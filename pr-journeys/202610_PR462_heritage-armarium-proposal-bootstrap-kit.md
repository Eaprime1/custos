# PR Journey: #462 — heritage: Armarium proposal, bootstrap kit, seed picker, repo restructure plan

**Repository:** Eaprime1/custos  
**prima-clock:** 202610171957  
**Branch:** `claude/conversation-completion-content-ee6y67` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Carry the heritage follow-up that was held back from sealed PR #444: a home for finished-conversation origins, a seed picker concept, and a plan for restructuring the other repos.

## What Arrived

10 files, all proposals. Nothing is built or created outside this repo.
- `atelier/heritage-pipeline/ARMARIUM.md` and `armarium-bootstrap/` (README, `.gitattributes`, `tools/verify.sh`): the proposed private origin repo, its layout, and the tested hash rule.
- `atelier/heritage-pipeline/SEED-PICKER.md`: the Lector concept.
- `atelier/heritage-pipeline/DRAFT-202610131200.md`: §11 update.
- `guides/repo-restructure-plan.md`, `tools/repo_inventory.sh` (read-only), `atelier/repo-restructure/PLANS-202610171912.md`: how to plan a repo restructure, plus plans for vault, archivum, nullus and queue.

Not in this PR: the private repo itself (needs the Shepherd's word), the engines, and the observation-file correction for #444 (waiting on the Shepherd's observation comment).

## Resonance

*Groundwork*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610171926 | @Eaprime1 |
| Finalized | 202610171957 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| check | ⏭ |
| packet | ✅ |
| Codacy Static Code Analysis | ✅ |
| final-oversight | ⏭ |
| label | ✅ |
| dependency-review | ✅ |
| custos-speaks | ✅ |
| scan | ✅ |
| scan | ✅ |
| validate | ✅ |
| GitGuardian Security Checks | ✅ |
| packet | ✅ |
| DeepSource: Analysis | ⏭ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Analysis

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 13 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 4/5 | 10 file(s) changed |
| Verification | 5/5 | 13 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts (`repo_inventory.sh` and `verify.sh` only read)
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Does the Shepherd want the private `armarium` repo created, and with which hash rule?

## Witnesses

- @Eaprime1 · 202610171957 · sealed at finalize

---
**prima-clock:** 202610171957  
**witnessed:** true — 1 witness, sealed 202610171957 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*