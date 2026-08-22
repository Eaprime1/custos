#!/usr/bin/env bash
# Advisory check: do newly-added .md files carry a Prima-clock provenance stamp?
# Not a linter, not a blocker. Reports what's missing so it can be added by hand.
#
# Prima-clock format already in use across the repo (see prima-clock/registry.md,
# LICENSE.md, NOTICE.md, valuation/*.md): a "Prima-clock:" line containing one or
# two 12-digit YYYYMMDDHHMM stamps, e.g.
#   Prima-clock: 202608021015
#   Prima-clock: 202607290200 → 202607290523 | Iteration: Blackjack 21 | ...
#   Prima-clock: ~202606231600 → 202606242044 | ...
# The LAST 12-digit run on the line is treated as the current stamp.
#
# Only checks files newly added since BASE — existing undated files are never
# retroactively flagged. No state file, no bot commits: this repo's CI doesn't
# commit back to itself, and this check doesn't start.
set -euo pipefail

BASE="${1:-HEAD~1}"

echo "Prima-clock provenance scan — new files since ${BASE}"
echo ""

NEW_FILES=$(git diff --name-only --diff-filter=A "${BASE}...HEAD" -- '*.md' 2>/dev/null || true)

if [[ -z "$NEW_FILES" ]]; then
  echo "  (no new .md files since ${BASE})"
  exit 0
fi

COMPLIANT=0
MISSING=0

while IFS= read -r FILE; do
  [[ -z "$FILE" ]] && continue
  [[ -f "$FILE" ]] || continue  # file may have been deleted later in the same diff range

  LINE=$(grep -m1 "Prima-clock:" "$FILE" 2>/dev/null || true)

  if [[ -z "$LINE" ]]; then
    echo "  ⚠️  MISSING  $FILE"
    MISSING=$((MISSING + 1))
    continue
  fi

  # Extract all standalone 12-digit runs on the line (word boundaries keep this
  # from matching the first 12 digits of a longer, e.g. 17-digit hodie-style,
  # stamp); the last one is the current stamp. `|| true` keeps a no-match
  # non-fatal under `set -o pipefail` so it falls through to the MALFORMED
  # branch below instead of aborting the script.
  STAMP=$(grep -oE '\b[0-9]{12}\b' <<<"$LINE" | tail -n1 || true)

  if [[ -z "$STAMP" ]]; then
    echo "  ⚠️  MALFORMED  $FILE  (Prima-clock line present but no 12-digit stamp found)"
    MISSING=$((MISSING + 1))
    continue
  fi

  Y="${STAMP:0:4}"; MO="${STAMP:4:2}"; D="${STAMP:6:2}"
  H="${STAMP:8:2}"; MI="${STAMP:10:2}"

  if date -d "${Y}-${MO}-${D} ${H}:${MI}" >/dev/null 2>&1 || date -j -f "%Y%m%d%H%M" "$STAMP" >/dev/null 2>&1; then
    echo "  ✅  $FILE  (Prima-clock: ${STAMP})"
    COMPLIANT=$((COMPLIANT + 1))
  else
    echo "  ⚠️  INVALID DATE  $FILE  (${STAMP})"
    MISSING=$((MISSING + 1))
  fi
done <<<"$NEW_FILES"

echo ""
echo "  Compliant: ${COMPLIANT}   Missing/invalid: ${MISSING}"
echo ""
echo "  Advisory only — does not block merge. Add a Prima-clock line to flagged"
echo "  files when convenient: Prima-clock: \$(date -u '+%Y%m%d%H%M')"
