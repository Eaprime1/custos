# PR Journey: #500 — workflows: queue final-oversight automatically once a PR seals

**Repository:** Eaprime1/custos  
**prima-clock:** 202610291811  
**Branch:** `auto-apply-final-oversight-label` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Eric noticed final-oversight showing skipped on PR #499 and asked why. Root cause: the gate itself is correctly built (GitHub environment `final-oversight`, required reviewer Eaprime1, configured 2026-10-16) -- its only trigger, the `final-oversight` label, was documented as a manual per-PR step and nobody has ever done it. Not a code bug; a missed habit, every time, since the environment was set up.

## What Arrived

- `finalize-pr.yml`: a new step 10b applies the `final-oversight` label automatically, but only at the point the PR actually seals -- after every other gate (template, threads, CI, observation, witness) has already passed. Not applied at the `ultima probatio` call itself, per Eric's instruction, since the call can still fail the gate.
- `docs/final-oversight.md`: "How to use it" updated to describe the new automatic step, and a new "Known gap" section names every PR in this stretch where the job sat skipped (#468, #469, #470, #487, #476, #496, #497, #498, #499) and why that wasn't a silent-approval risk -- the observations correctly logged it as skipped, not passed, throughout.

## Resonance

*Closes a real gap between documented design and what's ever actually run, without weakening the gate's owner-approval requirement.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610291807 | @Eaprime1 |
| Finalized | 202610291811 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| DeepSource: Perl | ⏭ |
| DeepSource: VB.NET | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| Codacy Static Code Analysis | ✅ |
| final-oversight | ⏭ |
| final-oversight | ⏭ |
| claude-review | ⏭ |
| GitGuardian Security Checks | ✅ |
| packet | ✅ |
| label | ✅ |
| tests | ✅ |
| scan | ✅ |
| injection-check | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| custos-speaks | ✅ |
| validate | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 20 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 3/3 |
| Scope | 5/5 | 3 file(s) changed |
| Verification | 5/5 | 20 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency and contribution records left unchanged.
- ✅ The owner's final approval step is preserved exactly -- this only stops the waiting job from never being queued.
- ✅ No hardcoded credentials, paths, or platform assumptions touched.

## What Door Does This Open?

The final-oversight gate, built 2026-10-16, actually gets exercised for the first time going forward instead of sitting configured-but-dormant.

## Witnesses

- @Eaprime1 · 202610291811 · sealed at finalize

---
**prima-clock:** 202610291811  
**witnessed:** true — 1 witness, sealed 202610291811 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*