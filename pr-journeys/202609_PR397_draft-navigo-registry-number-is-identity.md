# PR Journey: #397 — Draft navigo registry — number is identity, label is name

**Repository:** Eaprime1/custos  
**prima-clock:** 202609291952  
**Branch:** `claude/navigo-registry` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Draft a single tracker that says which navigo is which, so the numbered scheme and the Navigo Claude / Perplexity / Unexusi labels stop competing (`turns/CULTIVATION.md`).

## What Arrived

`docs/navigo-registry.md`: a registry table (number, label, team, workspace, legacy name, status) and five rules (assign on first appearance, never reuse a number, labels follow the Shepherd, legacy names stay readable, seat holders use the number). Marked DRAFT throughout. CLAUDE.md and CULTIVATION.md are deliberately untouched until the Shepherd confirms the numbers. Drift entry recorded.

## Resonance

*Tentative.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609291942 | @Eaprime1 |
| Finalized | 202609291952 | @Eaprime1 |

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
| validate | ✅ |
| scan | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| packet | ✅ |
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
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

What is the true order of first appearance, and should the mission board's `in-progress` seat record the holder's number (#396)?

## Witnesses

- @Eaprime1 · 202609291952 · sealed at finalize

---
**prima-clock:** 202609291952  
**witnessed:** true — 1 witness, sealed 202609291952 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*