# Artesium Weir

*The filter. One side: the raw artesian flow. The other: chain of custody.*

---

## What Crosses Here

Artesian folders hold PDF prints — pages pulled from the web, set aside before
they had names. They can turn up anywhere on the filesystem: any `artesian/`
folder, wherever a print landed.

Nothing artesian is "in custody" until it has passed through the Weir.

## The Routine

1. **Scan** — run `bash tools/artesian_scan.sh [root]` to find `artesian/`
   folders and list PDFs not yet logged here.
2. **Review** — for each new PDF, read it. Understand what it's for and what
   setup or development it implies.
3. **Carrier** — write a carrier document from `templates/carrier.md`:
   source path, what the PDF is, why it matters, and a development plan.
   Log it as `queue/artesium-weir/<slug>.md`.
4. **Split** —
   - The origin PDF's *mold* goes to `vault/` — never edited, the source of
     all copies (see `vault/README.md`).
   - The carrier's *page* moves on to `seep-artois/` — the pool, ready to be
     drawn.
5. **Close** — set the carrier's `chain_of_custody` to `CLOSED` once both
   copies have landed in their destinations.

## Log

| Item | Status | Carrier |
|---|---|---|
| Cygwin Installation.pdf | CLOSED | [seep-artois/cygwin-installation.md](../../seep-artois/cygwin-installation.md) |
