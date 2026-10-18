# PR Journey: #466 — device: record retired clones on primehaven

**Repository:** Eaprime1/custos  
**prima-clock:** 202610180354  
**Branch:** `claude/retired-clones-202610180031` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED (auto)  

## Intent

Record the clones on primehaven that have completed their mission, so they can leave the device without anyone wondering later where they went or what they held.

## What Arrived

A new append-only `device/retired-clones.md`:

- **The test:** every commit, stash and file is on GitHub, checked by blob hash against *all* remote history, not just the tip of `main`.
- **Archive first:** anything local-only is packed into a verified git bundle or tar, with `SHA256SUMS`, at `~/.eric/archive/retired-clones/202610180031/` on primehaven.
- **Entries:** nine clones marked `verified — awaiting removal`, each naming the clone that stays canonical.
- **Not yet retired:** four clones that still hold device-only work, and why.

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

The CLAUDE.md `device/` file list is updated from six files to seven.

## Resonance

*mission complete

---*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610180032 | @Eaprime1 |
| Auto-Finalized | 202610180354 | github-actions[bot] |

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
| final-oversight | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| GitGuardian Security Checks | ✅ |
| packet | ✅ |
| custos-speaks | ✅ |
| scan | ✅ |
| label | ✅ |
| validate | ✅ |
| scan | ✅ |
| dependency-review | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 21 CI check(s) — all passed |
| Consistency | 5/5 | Description complete · ethics 5/5 |
| Scope | 5/5 | 2 file(s) changed |
| Verification | 5/5 | 21 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional (clean on `device/`)
- ✅ No unintended harm surface in tools or scripts (no scripts added; nothing is removed by this PR)
- ✅ Shell inputs validated where applicable (n/a)

## What Door Does This Open?

Removal happens on the device after review. The entries then flip to `removed YYYY-MM-DD`. Should the four held clones get their own PRs in their own repos (fleet-commander's `fleet_modern.py` first)?

---

**prime state:** 3  
**witnessed:** false
- [ ] **observed:** observation document filed in `turns/observations/` (ticked by the cue record once it is there)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

---
**prima-clock:** 202610180354  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*