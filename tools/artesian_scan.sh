#!/usr/bin/env bash
# Artesian Scan — finds artesian/ folders and lists PDFs not yet logged at the Weir.
set -euo pipefail

ROOT="${1:-$HOME}"
WEIR="queue/artesium-weir"

if [[ ! -d "$WEIR" ]]; then
  echo "Error: $WEIR not found. Run from repo root."
  exit 1
fi

echo "Scanning for artesian/ folders under: $ROOT"
echo ""

FOUND_ANY=0
while IFS= read -r -d '' DIR; do
  while IFS= read -r -d '' PDF; do
    FOUND_ANY=1
    BASENAME=$(basename "$PDF")
    SLUG=$(echo "${BASENAME%.[pP][dD][fF]}" \
      | tr '[:upper:]' '[:lower:]' \
      | tr -c 'a-z0-9' '-' \
      | sed 's/-\+/-/g; s/^-//; s/-$//')
    if [[ -f "$WEIR/$SLUG.md" ]]; then
      echo "  [logged]  $PDF"
    else
      echo "  [new]     $PDF"
      echo "            -> slug: $SLUG"
    fi
  done < <(find "$DIR" -maxdepth 1 -iname '*.pdf' -print0 2>/dev/null)
done < <(find "$ROOT" -type d -iname 'artesian' -print0 2>/dev/null)

if [[ $FOUND_ANY -eq 0 ]]; then
  echo "No artesian/ folders with PDFs found under $ROOT."
fi

echo ""
echo "---"
echo "For each [new] item: review the PDF, write a carrier from templates/carrier.md,"
echo "and log it at $WEIR/<slug>.md. See $WEIR/README.md for the full routine."
