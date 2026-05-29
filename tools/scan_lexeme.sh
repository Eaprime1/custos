#!/usr/bin/env bash
# Scan for distressed lexemes — patterns that signal a fragment needs attention.
# Not a linter. A listening tool.
set -euo pipefail

ROOT="${1:-.}"

PATTERNS=(
  "TODO"
  "FIXME"
  "BROKEN"
  "placeholder"
  "REPLACE"
  "fill this in"
  "TBD"
  "???"
  "UNKNOWN"
  "My Prima Terminal"
)

echo "Scanning for distressed lexemes in: $ROOT"
echo ""

FOUND=0
for PATTERN in "${PATTERNS[@]}"; do
  MATCHES=$(grep -rFin -- "$PATTERN" "$ROOT" \
    --include="*.md" --include="*.sh" --include="*.yaml" --include="*.json" \
    --exclude-dir=".git" 2>/dev/null || true)
  if [[ -n "$MATCHES" ]]; then
    echo "  [$PATTERN]"
    echo "$MATCHES" | sed 's/^/    /'
    echo ""
    FOUND=1
  fi
done

if [[ $FOUND -eq 0 ]]; then
  echo "No distressed lexemes found."
fi

echo "---"
echo "Scan complete. Distressed lexemes are invitations, not failures."
