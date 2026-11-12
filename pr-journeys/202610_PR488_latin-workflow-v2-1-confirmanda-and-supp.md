# PR Journey: #488 — Latin workflow v2.1: confirmanda and supplenda, the Ask, threads, probatio note

**Repository:** Eaprime1/custos  
**prima-clock:** 202610220009  
**Branch:** `latin-v2-1-lexemes` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Give oversight a way to send a PR back that is not a repair: a claim that needs confirming, or a step the road lacks. Written from the Shepherd's words at the oversight of #468, #469, #470 and #476.

## What Arrived

Two modifiers of `emenda`, `confirmanda` (a claim or source cannot be checked from the repo) and `supplenda` (the work is sound but a step the road needs is missing). Both are read by `cue-parser.js` and logged by `latin-cue-record.yml` (5 new test rows, 72 in all; the count in `CLAUDE.md` follows). Also written up in `docs/latin-workflow-v2.md` as v2.1: the Ask shape, the thread register (`.claude/threads.md`, T01 to T11), the contributor's probatio note (step 4a), merge confirmation, and a note on a cue that the parser does not read. The glossary and `latin-lexemes.txt` are updated. Only the two modifiers are built; the rest is practice, and the doc says so.

## Resonance

*attentive*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610212351 | @Eaprime1 |
| Finalized | 202610220009 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| check | ⏭ |
| packet | ✅ |
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
| final-oversight | ⏭ |
| injection-check | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| validate | ✅ |
| custos-speaks | ✅ |
| label | ✅ |
| tests | ✅ |
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
| Correctness | 5/5 | 25 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 4/5 | 9 file(s) changed |
| Verification | 5/5 | 25 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Should the recorder say so when an owner cue line is rejected (T08), and should the `observed` box tick from the tracked observation comments (T07)?

## Witnesses

- @Eaprime1 · 202610220009 · sealed at finalize

---
**prima-clock:** 202610220009  
**witnessed:** true — 1 witness, sealed 202610220009 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*