#!/usr/bin/env bash
# Reports counts and deck math from a Five Lakes valuation ledger CSV.
# Usage: bash tools/valuation_report.sh [path/to/ledger.csv]
set -euo pipefail

LEDGER="${1:-valuation/ledger_raw.csv}"

if [[ ! -f "$LEDGER" ]]; then
  echo "No ledger found at: $LEDGER"
  exit 1
fi

# Uses python3's csv module rather than awk so quoted fields (file names with
# commas/emoji) don't shift column alignment.
python3 - "$LEDGER" <<'PY'
import csv
import sys
from collections import Counter

path = sys.argv[1]
suits, ranks, types = Counter(), Counter(), Counter()
chips = 0
total = 0

with open(path, newline="", encoding="utf-8-sig") as f:
    reader = csv.reader(f)
    header_skipped = False
    for row in reader:
        if not row:
            continue
        if not header_skipped and (row[0].lower() in ("title", "filename") or (len(row) > 7 and row[7].lower() == "chip_value")):
            header_skipped = True
            continue
        total += 1
        suits[row[5] if len(row) > 5 and row[5] else "TBD"] += 1
        ranks[row[6] if len(row) > 6 and row[6] else "TBD"] += 1
        types[row[1] if len(row) > 1 and row[1] else "unknown"] += 1
        try:
            chips += int(row[7]) if len(row) > 7 and row[7] else 0
        except ValueError:
            pass
decks, remainder = divmod(total, 52)

print(f"Ledger: {path}")
print(f"Total documents: {total}")
print(f"Complete decks: {decks}")
print(f"Remainder (2s and Jokers): {remainder}")

print("\nBy suit (card_suit column):")
for k, v in suits.most_common():
    print(f"  {v:6d}  {k}")

print("\nBy rank (card_rank column):")
for k, v in ranks.most_common():
    print(f"  {v:6d}  {k}")

print("\nBy file type (file_type column):")
for k, v in types.most_common():
    print(f"  {v:6d}  {k}")

print(f"\nTotal chip value (floor): {chips}")
PY
