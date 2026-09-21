#!/usr/bin/env bash
# Repo Hygiene Routine — checks a repo against custos's governance-baseline
# manifest (tools/repo_hygiene_manifest.txt) and reports what's missing.
#
# Report-only, non-destructive. Never writes to the target repo. Matches
# this project's hold-not-fill discipline: name what's missing, don't
# silently invent it. See docs/repo-hygiene-routine.md for the full routine
# (what to do with findings once you have them).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST="${SCRIPT_DIR}/repo_hygiene_manifest.txt"
TARGET="${1:-.}"

if [[ ! -f "$MANIFEST" ]]; then
  echo "Error: manifest not found at $MANIFEST" >&2
  exit 1
fi

if [[ ! -d "$TARGET" ]]; then
  echo "Error: target repo not found at $TARGET" >&2
  exit 1
fi

echo "Repo Hygiene Routine — checking: $TARGET"
echo "Manifest: $MANIFEST"
echo ""

MISSING=0
PRESENT=0

while IFS= read -r ITEM; do
  [[ -z "$ITEM" || "$ITEM" == \#* ]] && continue
  if [[ -e "${TARGET}/${ITEM}" ]]; then
    echo "  [present] $ITEM"
    PRESENT=$((PRESENT + 1))
  else
    echo "  [MISSING] $ITEM"
    MISSING=$((MISSING + 1))
  fi
done < "$MANIFEST"

echo ""
echo "---"
echo "Present: $PRESENT   Missing: $MISSING"

if [[ $MISSING -gt 0 ]]; then
  echo ""
  echo "For each missing item: is it a simple copy from custos (a template,"
  echo "a script with no repo-specific content)? If so, port it directly."
  echo "If it needs real repo-specific judgment (CODEOWNERS usernames,"
  echo "PR-review prompt content, etc.), file it at"
  echo "queue/future-forward/<repo-name>.md instead of guessing. See"
  echo "docs/repo-hygiene-routine.md for the full routine."
fi
