# PR Journey: #378 — ci: single publish source — static deploy from ֍custos֎ only

**Repository:** Eaprime1/custos  
**prima-clock:** 202609290543  
**Branch:** `publish-flow-single-source` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Establish `֍custos֎` as the single source for GitHub Pages, resolving the race condition between two competing deploy workflows.

## What Arrived

- `static-gh-pages.yml` — push trigger moved from `main` to `֍custos֎`; this is now the sole deploy workflow
- `jekyll-gh-pages.yml` — push trigger removed; `workflow_dispatch` kept for manual use if ever needed; a comment explains why

No content changes. Two files, +3/−5.

## Resonance

*settled*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609290534 | @Eaprime1 |
| Finalized | 202609290543 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
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
| Codacy Static Code Analysis | ✅ |
| packet | ✅ |
| dependency-review | ✅ |
| validate | ✅ |
| scan | ✅ |
| scan | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 18 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 2 file(s) changed |
| Verification | 5/5 | 18 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — no distressed lexemes introduced
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Now that deploy is gated to `֍custos֎`, what's the dress-up list for main before the first deliberate radix → `֍custos֎` publish? (Stray root files, `index.html` navigo table update, constellation section.)

## Witnesses

- @Eaprime1 · 202609290543 · sealed at finalize

---
**prima-clock:** 202609290543  
**witnessed:** true — 1 witness, sealed 202609290543 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*