# Future Forward — pixelator

Findings from `tools/repo_hygiene_check.sh ../pixelator`, run 2026-08-30.
`docs/stale-branch-closure.md` (the third finding) was a simple copy and
was ported directly rather than filed here — see
`atelier/legatum/202608220000_pixelator-legacy-infusion.md` for that
history.

| Item | Status | Notes |
|---|---|---|
| `LICENSE.md` | OPEN | Needs a license choice for pixelator specifically — custos's `LICENSE.md` terms may or may not be the right fit for a device-automation tool rather than a lore/governance repo. Eric's call. |
| `CLAUDE.md` | OPEN | custos's `CLAUDE.md` is written for custos's own structure (atelier, vault, moav, prima-clock, etc.) — none of that applies to pixelator. Needs a pixelator-specific `CLAUDE.md` describing its actual shape (Python automation + Termux shell scripts + the ported governance pipeline), not a copy. |
