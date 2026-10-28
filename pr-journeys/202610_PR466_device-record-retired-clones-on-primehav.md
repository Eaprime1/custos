# PR Journey: #466 — device: record retired clones on primehaven

**Repository:** Eaprime1/custos  
**prima-clock:** 202610180505  
**Branch:** `claude/retired-clones-202610180031` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Record the clones on primehaven that have completed their mission, so they can leave the device without anyone wondering later where they went or what they held.

## What Arrived

A new append-only `device/retired-clones.md`:

- **The test:** every commit, stash and file is on GitHub, checked by blob hash against *all* remote history, not just the tip of `main`.
- **Archive first:** anything local-only is packed into a verified git bundle or tar, with `SHA256SUMS`, at `~/.eric/archive/retired-clones/202610180031/` on primehaven. The radix material went to `~/primehaven/vetting/radix/` and then to `eaprime1/maw`.
- **Entries:** eleven clones marked `verified — awaiting removal`, each naming the clone that stays canonical.
- **Removal:** done on the device by `~/primehaven/vetting/remove-retired-clones.sh`, which re-checks each clone and skips any that changed. The script is not in this repo.
- **Not yet retired:** the clones and local repos that still hold device-only work, and why: `~/fleet-commander`, the two `~/repo/_old/` clones, `~/mandelbrot/domos/runexusiam` (a local repo never on GitHub), `~/mandelbrot/repo/pandora` and `~/mandelbrot`.

| Retiring | Local-only content | Canonical |
|---|---|---|
| `~/repo/custos` | June 3 shepherd iteration, 3 commits (bundled) | `~/unexusi/custos` |
| `~/hodie` | commit 1411aa1, ECC Tools PDF (bundled) | `~/unexusi/hodie` |
| `~/mandelbrot/workshop/hodie` | commit, CLAUDE.md edit, `.vscode/` (bundled) | `~/unexusi/hodie` |
| `~/mandelbrot/repo/hodie` | none | `~/unexusi/hodie` |
| `~/repo/fleet-commander` | none | `~/fleet-commander` |
| `~/repo/MANDELBROT` | none | `~/unexusi/mandelbrot` |
| `~/mandelbrot/repo/unexusi` | none | `~/repo/UNEXUSI` |
| `~/mandelbrot/repo/spectorium` | none | `~/repo/Spectorium` |
| `~/mandelbrot/repo/tiezerk` | none | `~/unexusi/tiezerk` |
| `~/radix` | NotebookLM export, two images, a JSON (moved to `eaprime1/maw`) | `~/primehaven/repo/radix` |
| `~/mandelbrot/repo/radix` | seed document, platform guide, germ-bank log (moved to `eaprime1/maw`) | `~/primehaven/repo/radix` |

The CLAUDE.md `device/` file list is updated from six files to seven.

Depends on #465: the entries use `podium: primehaven`, which is registered in `device/podiums.md` by that PR. Merge #465 first.

## Resonance

*mission complete*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610180032 | @Eaprime1 |
| Finalized | 202610180505 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| DeepSource: Lua | ⏭ |
| DeepSource: Apex | ⏭ |
| DeepSource: Dart | ⏭ |
| DeepSource: Erlang | ⏭ |
| DeepSource: Helm | ⏭ |
| DeepSource: Perl | ⏭ |
| DeepSource: VB.NET | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| final-oversight | ⏭ |
| custos-speaks | ✅ |
| validate | ✅ |
| scan | ✅ |
| label | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| packet | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 21 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 4 file(s) changed |
| Verification | 5/5 | 21 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional (clean on `device/`)
- ✅ No unintended harm surface in tools or scripts (no scripts added to this repo; nothing is removed by this PR)
- ✅ Shell inputs validated where applicable (n/a)

## What Door Does This Open?

Removal happens on the device after review. The entries then flip to `removed YYYY-MM-DD`. The fleet-commander files already have a draft PR (eaprime1/fleet-commander#1). Should the other held items get homes the same way?

## Witnesses

- @Eaprime1 · 202610180505 · sealed at finalize

---
**prima-clock:** 202610180505  
**witnessed:** true — 1 witness, sealed 202610180505 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*