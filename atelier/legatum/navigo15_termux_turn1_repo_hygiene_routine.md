# Navigo15 (Termux) — Turn 1 — Repo Hygiene Routine

**Podium:** pixel8a-unexusi (Termux/PRoot, Pixel 8a)
**Round-robin:** The Marrowing of Hope, turn 1 (setup pass before the
custos conversation sees any turns start)
**Source:** `the_marrowing_of_hope_dev_reference_202608281.md`, item #20
(Cluster D — Infrastructure), cross-referencing item #19

---

## What Stood Out

Scanning the other navigo turns already filed (5 through 14) before
starting: nearly all of it is narrative, lore, and conceptual architecture
— Hope Chest cosmology, Sovereign Charter, crystalline economy, feral
gardens. Real and valuable work, but none of it required a terminal.

Two items in the brainstorm do: **#19** ("start as a repo branch in
custos, upgrade the prima repo template") and **#20** ("give Copilot a
routine to check all repos for required documents, create them if
missing, route the rest into a future-forward queue"). Nobody else had
touched either. As the navigo with actual `git`/`gh` access rather than a
document-only surface, this was the doable-first pick specific to what
this terminal can uniquely do this turn.

Item #20 also wasn't abstract for me — it's the exact gap I'd already
found and logged as an open Seed Weir entry two turns ago, working on
`pixelator`: custos has a real branch-closure procedure
(`docs/stale-branch-closure.md`) that pixelator never received, and
nobody had a repeatable way to notice that kind of gap except by hand.
Picking #20 closes my own open seed, not just the brainstorm item.

## What Got Built

Real, working, committed — not a plan:

- **`tools/repo_hygiene_check.sh` + `tools/repo_hygiene_manifest.txt`**
  (custos) — report-only scan of any target repo against custos's
  governance baseline (11 required documents/scripts). Non-destructive:
  never writes to the target, only reports.
- **`docs/repo-hygiene-routine.md`** (custos) — the routine: for each
  `[MISSING]` finding, a simple copy (no repo-specific content) gets
  ported directly; anything needing real judgment gets filed instead of
  guessed at.
- **`queue/future-forward/`** (custos, new) — landing spot for
  judgment-required findings, modeled on the existing Seed Weir /
  Artesium Weir pattern.
- **Ran it for real** against `pixelator`: 8/11 present.
  `docs/stale-branch-closure.md` was a simple copy — ported directly
  (`pixelator@40ecc93`), closing the Seed Weir entry from two turns ago.
  `LICENSE.md` and `CLAUDE.md` need actual per-repo decisions (what
  license fits an automation tool vs. a lore/governance repo; what a
  pixelator-specific `CLAUDE.md` should say instead of copying custos's
  own atelier/vault/moav-specific one) — filed at
  `queue/future-forward/pixelator.md` rather than invented.

Item #19 (repo branch + Prima template upgrade) is named here as the
natural next pick — not built this turn, since #20 was the tighter,
fully-doable scope for one turn.

## Filed To

- `custos/tools/repo_hygiene_check.sh`, `repo_hygiene_manifest.txt`
- `custos/docs/repo-hygiene-routine.md`
- `custos/queue/future-forward/README.md`, `pixelator.md`
- `custos/queue/seed-weir/README.md` — entry updated OPEN → PLANTED
- `pixelator/docs/stale-branch-closure.md` (new)
- This document — filed to `atelier/legatum/` (custos) and uploaded to
  the `marrowing_of_hope` Drive folder as
  `navigo15_termux_turn1_repo_hygiene_routine.md`

## Open for Next Turn

- Item #19 — repo branch + Prima concept-repo template upgrade
- `queue/future-forward/pixelator.md`'s two open items (`LICENSE.md`,
  `CLAUDE.md`) — need Eric's call, not another navigo's guess
- Running `repo_hygiene_check.sh` against other repos in the
  constellation (hodie, duplicatus, gravitar, navigo) hasn't happened yet
- Whether the Repo Hygiene Routine itself should become a CI workflow
  (advisory, like `scan_lexeme.yml`) rather than a manually-run script —
  named, not decided
