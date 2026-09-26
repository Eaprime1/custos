# Crawl Summary — `unexusi-storage`

**prima-clock:** 202609230927
**Status:** crawl in progress — not yet run to completion

This file holds the summary of the recursive Drive crawl that fills
[`ledger_raw.csv`](ledger_raw.csv): file and folder counts, the file-type
breakdown, and the deck math. The crawl has not finished, so there are no
final figures yet. This file records that state honestly rather than
estimating.

## Where the crawl stands

The working record is [`crawl_progress_state.md`](crawl_progress_state.md).
At its last update:

- The root folder was crawled: 4 files, 7 subfolders, 1 shortcut.
- None of the queued top-level entries has been walked. The counts disagree:
  the root line says 7 subfolders and 1 shortcut, and "Total folders
  encountered" says 7, but the pending list has 8 entries. Which entry is
  the shortcut isn't recorded, so this is left open.
- `crawl_progress_state.md` reports 4 file rows written. Those rows are not
  in this repository's `ledger_raw.csv`, which currently holds only its
  header row.

## The ledger

`ledger_raw.csv` starts with the header row that
[`_helper.py`](_helper.py) rows match:

| Column | Meaning |
|---|---|
| `title` | Drive file title (formula-leading characters prefixed with `'`) |
| `file_type` | Simplified MIME type (`gdoc`, `pdf`, `image`, …) |
| `folder_path` | Path of the folder the file sits in |
| `drive_id` | Drive file ID |
| `modified_time` | Drive modified time |
| `card_suit` | Suit, left unscored until the scoring pass |
| `card_rank` | Rank, left unscored until the scoring pass |
| `chip_value` | Chip value (the helper writes `1`) |
| `notes` | e.g. `shortcut, not followed` |

Rows are appended by the crawl:

```bash
python3 valuation/_helper.py "<folder path>" < files.json >> valuation/ledger_raw.csv
```

## When the crawl completes

Update the *Where the crawl stands* section with the final counts:

- total files and folders;
- the file-type breakdown;
- deck math: complete 52-card decks and the remainder.

`bash tools/valuation_report.sh` prints the file total, the file-type
breakdown and the deck math from the ledger. The ledger holds files only,
so the folder total comes from the crawl record, not from the report.
