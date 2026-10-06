#!/usr/bin/env bash
# Validates that every .json and .yaml/.yml file in the target parses
# cleanly, and rejects duplicate keys (Python's json/yaml loaders silently
# keep the last value on a repeated key by default -- exactly the bug
# class this exists to catch). Catches silent merge-artifact corruption
# (duplicate keys, unclosed arrays, bad indentation) that produces no
# conflict markers but breaks the file — the exact bug behind pixelator
# PR #2's identity.json/ecc-tools.json corruption (see that repo's PR #2
# for the original incident; ported from custos, see custos PR #312).
#
# Unlike scan_lexeme.sh (advisory), this is a real correctness check —
# invalid JSON/YAML is unambiguously broken, so this script exits nonzero
# on any failure and is meant to gate CI.
#
# Runs as a single Python process rather than one subprocess per file --
# spawning an interpreter per file doesn't scale on repos with hundreds
# of JSON/YAML files.
set -euo pipefail

ROOT="${1:-.}"

# .claude/homunculus/instincts/inherited/*.yaml is a generated hybrid
# format -- YAML frontmatter blocks interleaved with Markdown body text
# between `---` separators, deliberately not a single parseable YAML
# document (same convention as dungeon-master/narrative-engine's
# conversation-template.md). Excluded, not broken.
EXCLUDE_PATTERN="/.claude/homunculus/instincts/inherited/"

python3 - "$ROOT" "$EXCLUDE_PATTERN" <<'PY'
import json
import os
import sys

root, exclude_pattern = sys.argv[1], sys.argv[2]
failed = False


def reject_duplicate_keys(pairs):
    seen = {}
    for key, value in pairs:
        if key in seen:
            raise ValueError(f"duplicate key: {key!r}")
        seen[key] = value
    return seen


def find_files(root, suffixes):
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d != ".git"]
        for name in filenames:
            if name.lower().endswith(suffixes):
                yield os.path.join(dirpath, name)


if not os.path.isdir(root):
    print(f"ERROR: {root!r} is not a directory or does not exist.", file=sys.stderr)
    sys.exit(2)

print(f"Validating JSON/YAML files under: {root}")
print()

json_files = sorted(find_files(root, (".json",)))
for path in json_files:
    try:
        with open(path, "r", encoding="utf-8") as f:
            json.load(f, object_pairs_hook=reject_duplicate_keys)
    except Exception as e:
        print(f"[INVALID JSON] {path}")
        print(f"    {e}")
        failed = True

yaml_files = sorted(
    p for p in find_files(root, (".yaml", ".yml")) if exclude_pattern not in p
)
if yaml_files:
    try:
        import yaml
    except ImportError:
        print("ERROR: PyYAML is not installed, so YAML files cannot be checked.")
        print("This is a missing dependency, not a broken YAML file.")
        print('Install it first: python3 -m pip install pyyaml')
        sys.exit(2)

    class UniqueKeyLoader(yaml.SafeLoader):
        pass

    def unique_mapping(loader, node, deep=False):
        # Reject duplicates only among this mapping's own literal keys,
        # checked BEFORE merge-key (<<) expansion. A local key legitimately
        # overriding a merged-in key is valid YAML (standard merge-key
        # override semantics), not corruption -- only a literal key typed
        # twice in the same block is.
        seen = set()
        for key_node, _ in node.value:
            if getattr(key_node, "tag", None) == "tag:yaml.org,2002:merge":
                continue
            key = loader.construct_object(key_node, deep=True)
            if key in seen:
                raise yaml.constructor.ConstructorError(
                    "while constructing a mapping",
                    node.start_mark,
                    f"found duplicate key ({key!r})",
                    key_node.start_mark,
                )
            seen.add(key)
        loader.flatten_mapping(node)
        return dict(loader.construct_pairs(node, deep=deep))

    UniqueKeyLoader.add_constructor(
        yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG, unique_mapping
    )

    for path in yaml_files:
        try:
            with open(path, "r", encoding="utf-8") as f:
                list(yaml.load_all(f, Loader=UniqueKeyLoader))
        except Exception as e:
            print(f"[INVALID YAML] {path}")
            print(f"    {e}")
            failed = True

print()
print("---")
if failed:
    print("One or more files failed to parse. Fix before merging — this is not advisory.")
    sys.exit(1)
else:
    print("All JSON/YAML files parse cleanly.")
PY
