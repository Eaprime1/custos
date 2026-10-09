# Notion branch tracker — schema proposal

Prima-clock stamp: 202610092148 (UTC). Status: proposal, ♦️ Germ.

`custos_branch_tracker.xlsx` mirrors a proposed two-database schema for tracking seeds and stream returns in Notion. Nothing has been created in Notion yet. It does not replace `branch-tracker/branches.md`, which stays the active map.

## Sheets

- **Branch Tracker** — one row per seed: Seed, Plank, Suit, Destination repo, Source, Prima-clock, Custody status, Stream return, MOAV carrier, Vault copy. Dropdowns hold the Plank, Suit, Source, Custody status and Vault copy values. The grey row is an example to copy, not data.
- **Stream Returns** — one row per `STREAM N RETURN`: Title, Agent, Timestamp, Signal extracted, Seeds fed.
- **Summary** — formula counts by Plank, Suit and Custody status.
- **Design Notes** — design choices and the open question.

## Design choices

- Plank and Suit are restricted lists, so a Germ row can stay nearly empty.
- "Extracted" keeps the row in place after a branch becomes its own repo, preserving the record of departure.
- The vault stays out of Notion, because Notion pages are editable and a mold must not be. Only a "Vault copy" flag lives in the tracker.

## Open question

Standalone databases, or inside the existing "Sargasso Sea - Consortium Hub" database in Notion? Recommendation: standalone, since a hub should not hold the thing it routes. Eric decides.

Provenance: Navigo Claude × eaprime1, from the Custos project conversation of 202610091447 local.
