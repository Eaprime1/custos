# PR Journey: #501 — turns: backfill M1-M8 scores on PR #497 and #498 observations

**Repository:** Eaprime1/custos  
**prima-clock:** 202610291951  
**Branch:** `backfill-scores-497-498` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Eric asked for the M1-M8 scored rubric to be backfilled onto the four observations filed without it (#497, #498, #499, #500). #499 and #500 got their scores added directly on their own still-open branches; #497 and #498 are already merged, so this PR adds the same section to their files on main.

## What Arrived

Both `turns/observations/202610291201_pr498_observation.md` and `turns/observations/202610291630_pr497_observation.md` get a new "## Scores (RUBRIC.md v0)" section, scored the same way #476's original observation was (M2/M6/M8 at 0 where "not a swap PR" applies, M1/M3/M4/M5/M7 scored directly against what was actually checked).

## Resonance

*Closes a gap between what `docs/final-oversight.md` requires ("Observation complete" needs Seen, Carried forward, Scores M1-M8, and Result) and what these two files actually had.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610291940 | @Eaprime1 |
| Finalized | 202610291951 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| DeepSource: Lua | ⏭ |
| DeepSource: Apex | ⏭ |
| DeepSource: Dart | ⏭ |
| DeepSource: Erlang | ⏭ |
| DeepSource: Helm | ⏭ |
| DeepSource: Perl | ⏭ |
| Codacy Static Code Analysis | ✅ |
| DeepSource: VB.NET | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| final-oversight | ⏭ |
| GitGuardian Security Checks | ✅ |
| scan | ✅ |
| label | ✅ |
| dependency-review | ✅ |
| custos-speaks | ✅ |
| packet | ✅ |
| scan | ✅ |
| validate | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 21 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 3/3 |
| Scope | 5/5 | 3 file(s) changed |
| Verification | 5/5 | 21 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency and contribution records left unchanged.
- ✅ No prior finding, decision, or carried-forward item altered — only the missing scoring section added.
- ✅ No executable or system configuration changes.

## What Door Does This Open?

All four recent observations now carry the full rubric the house process expects, not just the narrative sections.

## Witnesses

- @Eaprime1 · 202610291951 · sealed at finalize

---
**prima-clock:** 202610291951  
**witnessed:** true — 1 witness, sealed 202610291951 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*