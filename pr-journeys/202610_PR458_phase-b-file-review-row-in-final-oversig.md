# PR Journey: #458 — Phase B: File review row in final oversight, observation required for the seal

**Repository:** Eaprime1/custos  
**prima-clock:** 202610161221  
**Branch:** `claude/nifty-mendel-vyji3n` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Phase B of three. Final oversight now checks that the Shepherd read the files, and the seal asks for a filed observation. Phase A (the checklist) is on `main` from #457. Phase C (the gate for hodie) follows.

## What Arrived

- `.github/scripts/final-oversight.js` and `final-oversight-run.js`: a new must-pass **File review** row. It reads the Shepherd Considers checklist and fails when:
  - the comment is missing, or has no checklist (the rules were not on the base branch);
  - the checklist describes another head, or a head that real commits (not the journey document) have moved past;
  - the list was cut off (`total` larger than `shown`);
  - any "Read these" file is unticked. The row names the unticked files.
- `.github/workflows/finalize-pr.yml`: the owner's seal now asks for a filed observation (`turns/observations/<12 digits>_pr<N>_observation.md`) that says `status: complete`. A bot's finalize is not asked. The gate lists a missing or open observation as a blocker, with the usual "comment again" message.
- `tools/test_final_oversight.js`: 46 to 60 checks. `tools/test_seal_observation.sh` and `.js`: 9 rows that run the real "Finalize PR" script against fake GitHub calls. Both are wired into `seal-path-tests.yml`.
- Docs: `docs/final-oversight.md`, `docs/file-review.md`, `.claude/manual-finalize.md` (a missing observation is a reason for the manual ticket), `turns/CULTIVATION.md` (the open observation item is decided), `CLAUDE.md`.

## Resonance

*This changes the seal path. The seal workflow and the oversight rules both run from the base branch, so neither applies to this PR. This PR seals the old way. The first PR after the merge is the first to need an observation, and the first to show the File review row.

The observation rule in the seal is deliberately light (filed, `status: complete`). Sections and scores stay in final oversight, which already checks them.

`.claude/manual-finalize.md` is the way around the gate if it ever misfires.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610161209 | @Eaprime1 |
| Finalized | 202610161221 | @Eaprime1 |

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
| final-oversight | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| custos-speaks | ✅ |
| label | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| injection-check | ✅ |
| tests | ✅ |
| scan | ✅ |
| validate | ✅ |
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
| Scope | 4/5 | 13 file(s) changed |
| Verification | 5/5 | 23 check run(s) completed |
| **Valuation** | **High** | 18/20 |

## Ethics Check

*No ethics checklist found.*

## What Door Does This Open?

*Not recorded.*

## Witnesses

- @Eaprime1 · 202610161221 · sealed at finalize

---
**prima-clock:** 202610161221  
**witnessed:** true — 1 witness, sealed 202610161221 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*