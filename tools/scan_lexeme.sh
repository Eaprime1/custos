#!/usr/bin/env bash
# Scan for distressed lexemes — patterns that signal a fragment needs attention.
# Not a linter. A listening tool.
set -euo pipefail

ROOT="${1:-.}"

# Markers are the shouted words a writer leaves behind. They are matched as
# whole words, in capitals only, so ordinary prose ("unknown", "unbroken",
# "todo list") stays quiet. Words with weight, such as "replace", are not
# scanned at all: see atelier/lexemes/reserved-lexemes.md.
MARKERS=(
  "TODO"
  "FIXME"
  "BROKEN"
  "TBD"
  "UNKNOWN"
)

# Phrases are matched in any case, anywhere in a line.
PHRASES=(
  "placeholder"
  "fill this in"
  "???"
  "My Prima Terminal"
)

echo "Scanning for distressed lexemes in: $ROOT"
echo ""

FOUND=0
INCLUDES=(--include="*.md" --include="*.sh" --include="*.yaml" --include="*.yml" --include="*.json")

report() {
  # report <pattern> <matches>
  if [[ -n "$2" ]]; then
    echo "  [$1]"
    echo "$2" | sed 's/^/    /'
    echo ""
    FOUND=1
  fi
}

for PATTERN in "${MARKERS[@]}"; do
  MATCHES=$(grep -rFnw "${INCLUDES[@]}" --exclude-dir=".git" -- "$PATTERN" "$ROOT" 2>/dev/null || true)
  report "$PATTERN" "$MATCHES"
done

for PATTERN in "${PHRASES[@]}"; do
  EXTRA_OPTS=()
  if [[ "$PATTERN" = "My Prima Terminal" ]]; then
    EXTRA_OPTS+=(--exclude="000-thee-the-door.md")
  fi
  MATCHES=$(grep -rFin "${INCLUDES[@]}" \
    ${EXTRA_OPTS[@]+"${EXTRA_OPTS[@]}"} \
    --exclude-dir=".git" \
    -- "$PATTERN" "$ROOT" \
    2>/dev/null || true)
  report "$PATTERN" "$MATCHES"
done

if [[ $FOUND -eq 0 ]]; then
  echo "No distressed lexemes found."
fi

echo "---"
echo "Scan complete. Distressed lexemes are invitations, not failures."
