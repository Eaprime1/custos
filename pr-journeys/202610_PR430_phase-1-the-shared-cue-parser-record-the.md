# PR Journey: #430 — Phase 1: the shared cue parser; record the Shepherd's answers to the plan

**Repository:** Eaprime1/custos  
**prima-clock:** 202610071012  
**Branch:** `claude/quirky-carson-uez4sb` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Start phase 1 of the caret-cue plan (#429): a shared cue parser with an offline test table, and record the Shepherd's answers to the plan's four open questions that it builds on.

## What Arrived

- **Parser:** `.github/scripts/cue-parser.js`. Reads the caret form (`^<navigo> [<conversation-id>] <cue words>`, case-insensitive) and the older `@claude` form, only at the start of a line. It skips comments that carry the Claude Code footer, bot authors, and anyone but the owner when an association is given. It ignores fenced code, inline code, quotes and indented code. Navigos are matched by name against a list taken from the registry. Anything that looks like a cue but is not (unknown navigo, no cue words, unrecognized words, an ambiguous mix) is reported as rejected and never as a cue. It only reads text: it never labels, seals or merges.
- **Tests:** `tools/test_cue_parser.js` with a 51-row table, run by `bash tools/test_cue_parser.sh`. No network. It also checks that the default names appear in `docs/navigo-registry.md`. A mutation check (removing the footer rule) was caught by the table.
- **Answers recorded:** the plan's decisions table and a short observation addendum for #429 (case-insensitive caret, names only, a living ledger comment archived on return, `^custos check` and `^custos concordance` as aliases beside the `@claude` forms).
- No workflow changes. Nothing calls the parser yet.

This PR carries both because the session has one branch and #430 was still open when phase 1 started.

## Resonance

*Exact.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610070957 | @Eaprime1 |
| Finalized | 202610071012 | @Eaprime1 |

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
| custos-speaks | ✅ |
| scan | ✅ |
| validate | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 19 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 5 file(s) changed |
| Verification | 5/5 | 19 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Phase 2: the cue router, the To column in the cue record, and the `awaiting:<navigo>` labels.

## Witnesses

- @Eaprime1 · 202610071012 · sealed at finalize

---
**prima-clock:** 202610071012  
**witnessed:** true — 1 witness, sealed 202610071012 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*