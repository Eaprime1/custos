# PR Journey: #456 — Latin workflow v2: emenda, omnes, standalone renovata, contributor playbook

**Repository:** Eaprime1/custos  
**prima-clock:** 202610160819  
**Branch:** `claude/nifty-mendel-vyji3n` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Refine the Latin workflow for the next round of contributor PRs, with the Shepherd's decisions of this session built in.

## What Arrived

- `docs/latin-workflow-v2.md`: the road of a PR, the new words, what each cue asks of a contributor, a paste-in line for conversations that cannot subscribe, and the decisions.
- `docs/latin-lexemes.txt`: plain-text quick reference for Notepad.
- `.github/scripts/cue-parser.js`: reads `emenda` (amend), `^omnes` (every contributor), `^cuncti` (the project as a whole) and a bare `renovata`.
- `.github/workflows/probatio-label.yml` and `.github/scripts/probatio-label.js`: the owner's `^name probatio` is the soft seal and sets `ready-for-oversight`. A person's push takes the label off. The final seal is untouched.
- `.github/workflows/latin-cue-record.yml`: logs `emenda` and a bare `renovata`.
- `.github/sovran-labels.yml`: the new label.
- `.claude/manual-finalize.md`: `finalize` moves out of the main stream into a manual backup method with a handwritten ticket.
- Glossary, conversation seed and `CLAUDE.md` updated. Tests: 67 rows for the parser, 15 for the label.

## Resonance

*`finalize-pr.yml` is unchanged: `ultima probatio` and `@claude finalize` still seal on the owner's cue. The new workflow runs from the default branch, so it takes effect after merge.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610160742 | @Eaprime1 |
| Finalized | 202610160819 | @Eaprime1 |

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
| dependency-review | ✅ |
| final-oversight | ⏭ |
| label | ✅ |
| custos-speaks | ✅ |
| scan | ✅ |
| tests | ✅ |
| scan | ✅ |
| validate | ✅ |
| injection-check | ✅ |
| packet | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 23 CI check(s) — all passed |
| Consistency | 4/5 | Template complete · ethics 0/0 |
| Scope | 4/5 | 14 file(s) changed |
| Verification | 5/5 | 23 check run(s) completed |
| **Valuation** | **High** | 18/20 |

## Ethics Check

*No ethics checklist found.*

## What Door Does This Open?

*Not recorded.*

## Witnesses

- @Eaprime1 · 202610160819 · sealed at finalize

---
**prima-clock:** 202610160819  
**witnessed:** true — 1 witness, sealed 202610160819 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*