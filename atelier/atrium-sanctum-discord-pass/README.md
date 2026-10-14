# Atrium discord pass: Sanctum export, rows 21, 22, 29 and 31

Prima-clock: 202610132212 (Pacific local)
Status: working note, assistant-built. Rulings marked "settled_by_human" are Eric's own words; everything else is a proposal for him to rule on.
Chain of custody: OPEN

The export is not in this folder. It holds Eric's quoted words and externally linked images, and the package-level privacy review (discord 26) has not happened. Only the test script and the facts it printed are filed here.

## What was tested

`test_sanctum_export.py` reads a text export as received and prints facts. It decides nothing.

```bash
python3 -I atelier/atrium-sanctum-discord-pass/test_sanctum_export.py PATH_TO_EXPORT
```

## Results for the export attached on 2026-10-13

| # | Result | Pointer | Readiness |
|---|--------|---------|-----------|
| 21 | Confirmed. Tab 1 holds 12,025 of 16,618 words and no human turns; Eric's words appear only as two quoted lines. | Tab 1, lines 1-1603; quotes at lines 818 and 936 | settled_by_human (yes, 202610132211) |
| 22 | Confirmed. Tab 2 has 10 seed fields and Tab 10 has 7. Tab 10 lost `seed_id`, `source_time_reference` and `status` and added none. | Tab 2 line 1605, Tab 10 line 2387 | drafted |
| 29 | Not settled. The export has no pages. "76-page" appears once (Tab 9, line 2211); "86" appears nowhere in it. | Tab 9, line 2211 | candidate |
| 31 (new) | A verbatim seed test run on the whole export passes trivially, because the seeds sit inside it as Tabs 2 and 10. The test must skip those two tabs. | Tabs 2 and 10 | candidate, assistant-proposed |

Seed fragments: all six appear exactly once in the export, each inside its own seed tab, and zero times outside Tabs 2 and 10, with case exact or ignored. The export cannot verify them, because Eric's turns are not in it.

Layout: ten tab headers at lines 1, 1605, 1670, 1712, 1799, 1894, 1938, 2007, 2187 and 2387; 2,440 lines; 122,878 bytes; no CRLF.
SHA-256 of the file: `e0c01226682b957c23a3fceb5c0c542f4484ee57ce3add3f44b41f0dbbffe019`

Word count depends on the method. Splitting on whitespace gives 16,618, which matches the earlier back-out of about 16,620. Plain `wc -w` gives 16,498, because it skips 120 tokens made only of non-ASCII symbols (92 are em dashes).

## Rulings

| # | Eric's words (202610132211) | Proposal (assistant-proposed) | Status |
|---|------------------------------|-------------------------------|--------|
| Row 21 | "yes": the origin is the export with both sides | Tab 1 goes to a container record; the origin stays "awaiting the export" | settled_by_human |
| Hash | not sure; "the most universal" | SHA-256 of the exact stored bytes, as hex beside the file name, checkable with `sha256sum`. Normalized text hashes only for derived text, with no sniffing of bare `---` lines | proposal_awaiting |
| Case | caps are part of the command lexemes (AND, OR, NOT, PRIME, ZERO, ONE, THIS, THEN, THAT, CUSTOS); scans struggle with all caps; he avoids typing them | My earlier question meant upper versus lower case inside a quoted fragment (Tab 2 "Spending", Tab 10 "spending"), not ALL CAPS typing. The verbatim test ignores case, flags "case differs", and never alters stored text | proposal_awaiting |
| Container | now that Google Docs have tabs, unsure of the best direction | The Doc with tabs is the container, each tab a part. Identify it by Drive file id plus the SHA-256 of its text export on the day, and re-record on every return. Page count stops being an identity. The 76-page PDF and the text export stay as separate copies with their own hashes | proposal_awaiting |

## Not seen, so not tested

- `DRAFT-202610131200.md` (the Atrium draft), the collapse and makers engines, the SOP PDF and the Latin glossary table.
- The Google Doc version of the Sanctum, which has not been compared with the text export.
- vault, archivum and nullus; the queue folder was not read.

## Still open

Rulings on hash direction, case and container; whether the Drive Sanctum doc and the text export are the same container; and the privacy review (discord 26) before any copy of the export leaves the private store.
