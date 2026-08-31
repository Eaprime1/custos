#!/usr/bin/env bash
# Validates that every .json and .yaml/.yml file in the target parses
# cleanly. Catches silent merge-artifact corruption (duplicate keys,
# unclosed arrays, bad indentation) that produces no conflict markers but
# breaks the file — the exact bug class behind pixelator PR #2's
# identity.json/ecc-tools.json corruption. See
# atelier/legatum/202608220000_pixelator-legacy-infusion.md.
#
# Unlike scan_lexeme.sh (advisory), this is a real correctness check —
# invalid JSON/YAML is unambiguously broken, so this script exits nonzero
# on any failure and is meant to gate CI.
set -euo pipefail

ROOT="${1:-.}"
FAILED=0

echo "Validating JSON/YAML files under: $ROOT"
echo ""

# Avoid process substitution (<(...)) here -- it relies on /dev/fd, which
# some sandboxed/PRoot environments don't wire up correctly. A temp file
# is slightly less elegant but works everywhere, including real CI.
FILE_LIST="$(mktemp)"
trap 'rm -f "$FILE_LIST"' EXIT

find "$ROOT" -type f -name "*.json" -not -path "*/.git/*" -print0 > "$FILE_LIST"
while IFS= read -r -d '' FILE; do
  ERR=$(python3 -c '
import json, sys
def reject_duplicates(pairs):
    out = {}
    for k, v in pairs:
        if k in out:
            raise ValueError(f"duplicate key: {k!r}")
        out[k] = v
    return out
with open(sys.argv[1], "r", encoding="utf-8") as f:
    json.load(f, object_pairs_hook=reject_duplicates)
' "$FILE" 2>&1) || {
    echo "[INVALID JSON] $FILE"
    echo "$ERR" | sed 's/^/    /'
    FAILED=1
  }
done < "$FILE_LIST"

# .claude/homunculus/instincts/inherited/*.yaml is a generated hybrid
# format -- YAML frontmatter blocks interleaved with Markdown body text
# between `---` separators, deliberately not a single parseable YAML
# document (same convention as dungeon-master/narrative-engine's
# conversation-template.md). Excluded, not broken.
find "$ROOT" \( -name "*.yaml" -o -name "*.yml" \) -type f \
  -not -path "*/.git/*" \
  -not -path "*/.claude/homunculus/instincts/inherited/*" \
  -print0 > "$FILE_LIST"
while IFS= read -r -d '' FILE; do
  ERR=$(python3 -c '
import sys, yaml
class UniqueKeyLoader(yaml.SafeLoader):
    pass
def unique_mapping(loader, node, deep=False):
    mapping = {}
    pairs = loader.construct_pairs(node, deep=deep)
    for (key, value), (key_node, _) in zip(pairs, node.value):
        if key in mapping:
            raise yaml.constructor.ConstructorError(
                "while constructing a mapping",
                node.start_mark,
                f"found duplicate key ({key!r})",
                key_node.start_mark,
            )
        mapping[key] = value
    return mapping
UniqueKeyLoader.add_constructor(
    yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG, unique_mapping
)
with open(sys.argv[1], "r", encoding="utf-8") as f:
    list(yaml.load_all(f, Loader=UniqueKeyLoader))
' "$FILE" 2>&1) || {
    echo "[INVALID YAML] $FILE"
    echo "$ERR" | sed 's/^/    /'
    FAILED=1
  }
done < "$FILE_LIST"

echo ""
echo "---"
if [[ $FAILED -eq 0 ]]; then
  echo "All JSON/YAML files parse cleanly."
else
  echo "One or more files failed to parse. Fix before merging — this is not advisory."
fi

exit $FAILED
