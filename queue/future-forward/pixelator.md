# Future Forward — pixelator

Findings from `tools/repo_hygiene_check.sh ../pixelator`, run 2026-08-30.
`docs/stale-branch-closure.md` (the third finding) was a simple copy and
was ported directly rather than filed here — see
`atelier/legatum/202608220000_pixelator-legacy-infusion.md` for that
history.

| Item | Status | Notes |
|---|---|---|
| `LICENSE.md` | OPEN | Needs a license choice for pixelator specifically — custos's `LICENSE.md` terms may or may not be the right fit for a device-automation tool rather than a lore/governance repo. Eric's call. **Shepherd 202610060158:** licensing is a dedicated conversation across all repos; unsure whether custos's own license setup was finished — check there first. |
| `CLAUDE.md` | RESOLVED | custos's `CLAUDE.md` is written for custos's own structure (atelier, vault, moav, prima-clock, etc.) — none of that applies to pixelator. Needs a pixelator-specific `CLAUDE.md` describing its actual shape (Python automation + Termux shell scripts + the ported governance pipeline), not a copy. Done: pixelator `CLAUDE.md` written for its own shape (pixelator #16, merged). |
| Issue forms [PC-5] | RESOLVED | Pixelator has `bounty`, `mission` and `upgrade`. Custos retired `bounty` (replaced by `sparstone-trial`) and also has `lexeme` and `feedback`. Suggestion: add `lexeme`, retire `bounty`, hold the rest. **Shepherd 202610060158: yes — retire `bounty`, bring custos's `lexeme` form to pixelator.** Done: the `lexeme` form is in and `bounty` is removed (pixelator #15, merged). `mission` and `upgrade` labels follow in a small PR. |
| Custody log [PC-8] | RESOLVED | `pixelate/ROUTING.md` says to record each crossing in the chain of custody log, but pixelator has none beyond the agent's own JSON log. Suggestion: its own log in the format of custos's `prima-clock/registry.md`, linking to `maw/registry/custody_log.md`. **Shepherd 202610060158: yes — give pixelator a log and other core documents as needed.** Done: `pixelate/CUSTODY_LOG.md` (draft, UTC stamps) and `CLAUDE.md` (pixelator #16, merged). |
| README clone line | OPEN | The README tells you to clone `github.com/devicehaven/pixelator`. Shepherd: devicehaven is now the spectorium repo, so the line is stale. Suggestion: `eaprime1/pixelator`. Please confirm. |
| Starter workflows `blank.yml`, `terraform.yml` | OPEN | Both run on branch `claude/restructure-pixel8a-architecture-8TCj4`, which no longer exists (`main` is the only remote branch). Suggestion: retire both. |

The last four rows come from peer review Run 0 (`atelier/peer-review/202610_custos-pixelator_run-0.md`, prima-clock `202610060830`). The finding ids are in brackets.
