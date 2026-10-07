# PR Journey: #408 — tools/validate_json_yaml.sh: adopt pixelator's two fixes

**Repository:** Eaprime1/custos  
**prima-clock:** 202610060935  
**Branch:** `claude/adopt-validator-fix-t2203p` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Adopt pixelator's version of `tools/validate_json_yaml.sh` (peer review Run 0, finding CP-1, ADOPT).

## What Arrived

Two fixes from pixelator's copy: a YAML file whose root is missing no longer passes silently, and a merge key (`<<`) can no longer override an explicit key. Both were reproduced against fixtures before the change, and the new script passes the same fixtures.

## Resonance

*borrowed, tested*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610060858 | @Eaprime1 |
| Finalized | 202610060935 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| GitGuardian Security Checks | ✅ |
| packet | ✅ |
| dependency-review | ✅ |
| validate | ✅ |
| scan | ✅ |
| scan | ✅ |

## DeepSource Record

*Not configured for this repo.*

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 7 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 1 file(s) changed |
| Verification | 5/5 | 7 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (the fixes came from pixelator's copy)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Should the two repos share this script by copy plus a drift check, or by a reusable workflow?

## Witnesses

- @Eaprime1 · 202610060935 · sealed at finalize

---
**prima-clock:** 202610060935  
**witnessed:** true — 1 witness, sealed 202610060935 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*