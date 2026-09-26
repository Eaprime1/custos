#!/usr/bin/env bash
# shepherd_considers — walk a directory's .md files one at a time.
# For each file it shows a preview, then asks: [v]iewed, [s]kip, [n]ote or [q]uit.
# The tool appends viewed and noted files to atelier/shepherd/review-log.md.
set -euo pipefail

DIR="${1:-atelier}"
DIR="${DIR%/}"
LOG="atelier/shepherd/review-log.md"

if [[ ! -d "$DIR" ]]; then
  echo "Error: '$DIR' is not a directory. Run from repo root."
  exit 1
fi

shopt -s nullglob
FILES=()
for candidate in "$DIR"/*.md; do
  if [[ -f "$candidate" ]]; then FILES+=("$candidate"); fi
done
shopt -u nullglob

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "Nothing to consider in $DIR — no .md files."
  exit 0
fi

mkdir -p "$(dirname "$LOG")"
if [[ ! -f "$LOG" ]]; then
  printf "# Shepherd Review Log\n\n*A record of attention. Appended by tools/shepherd_considers.sh.*\n" > "$LOG"
fi

SESSION=$(date '+%Y%m%d%H%M')
printf "\n## Session %s · %s\n\n" "$SESSION" "$DIR" >> "$LOG"

VIEWED=0; SKIPPED=0; NOTED=0; TOTAL=${#FILES[@]}; i=0

for f in "${FILES[@]}"; do
  i=$((i + 1))
  echo ""
  echo "── [$i/$TOTAL] $f ──────────────────────────────"
  head -n 10 "$f"
  echo "──"
  while true; do
    read -r -p "[v]iewed / [s]kip / [n]ote / [q]uit > " choice || choice="q"
    case "$choice" in
      v|V)
        stamp=$(date '+%Y%m%d%H%M')
        printf -- "- %s · \`%s\` · viewed\n" "$stamp" "$f" >> "$LOG"
        VIEWED=$((VIEWED + 1)); break ;;
      s|S)
        SKIPPED=$((SKIPPED + 1)); break ;;
      n|N)
        read -r -p "note > " note || note=""
        note="${note//$'\n'/ }"
        stamp=$(date '+%Y%m%d%H%M')
        printf -- "- %s · \`%s\` · noted · %s\n" "$stamp" "$f" "$note" >> "$LOG"
        NOTED=$((NOTED + 1)); break ;;
      q|Q)
        echo ""
        echo "Stopped at $f."
        break 2 ;;
      *)
        echo "v, s, n or q." ;;
    esac
  done
done

printf -- "\n*viewed %d · noted %d · skipped %d · of %d*\n" "$VIEWED" "$NOTED" "$SKIPPED" "$TOTAL" >> "$LOG"
echo ""
echo "Considered: viewed $VIEWED · noted $NOTED · skipped $SKIPPED · of $TOTAL"
echo "Logged to $LOG"
