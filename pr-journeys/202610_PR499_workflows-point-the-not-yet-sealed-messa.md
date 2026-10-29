# PR Journey: #499 — workflows: point the not-yet-sealed message at ultima probatio

**Repository:** Eaprime1/custos  
**prima-clock:** 202610291825  
**Branch:** `fix-finalize-wording` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

The finalize/seal workflow's "not yet sealed" retry message still told people to comment `@claude finalize`, even though the trigger has accepted `@claude ultima probatio` since the Latin workflow v2.1 cue vocabulary made it the standard seal call. Eric caught this directly: he called `ultima probatio` on #496/#497/#498 and the bot bounced him back toward the old phrasing instead of confirming the call it had just received.

## What Arrived

`.github/workflows/finalize-pr.yml`: one line changed. The retry instruction now reads "comment `@claude ultima probatio` (or `@claude finalize`) again" instead of only naming `finalize`.

## Resonance

*One-line fix, zero behavior change to the gate itself.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610291644 | @Eaprime1 |
| Finalized | 202610291825 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| final-oversight | ⏭ |
| claude-review | ⏭ |
| DeepSource: Analysis | ⏭ |
| Codacy Static Code Analysis | ✅ |
| final-oversight | ⏭ |
| packet | ✅ |
| custos-speaks | ✅ |
| validate | ✅ |
| tests | ✅ |
| label | ✅ |
| injection-check | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Analysis

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 15 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 3/3 |
| Scope | 5/5 | 3 file(s) changed |
| Verification | 5/5 | 15 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency and contribution records left unchanged.
- ✅ No executable logic changed — trigger condition untouched, only the printed string.
- ✅ No hardcoded credentials, paths, or platform assumptions touched.

## What Door Does This Open?

The bot's own voice matches the vocabulary it was actually built to understand, instead of presenting a retired term as the primary instruction.



**witnessed:** true — 1 witness · sealed 202610291701 by @Eaprime1

- @Eaprime1 · 202610291701 · sealed at finalize

## Witnesses

- @Eaprime1 · 202610291701 · sealed at finalize

---
**prima-clock:** 202610291825  
**witnessed:** true — 1 witness, sealed 202610291701 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*