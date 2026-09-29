# PR Journey: #241 — fix: workflow expression injection — gate pattern for all triggers (custos)

**Repository:** Eaprime1/custos  
**prima-clock:** 202607260212  
**Branch:** `claude/nifty-franklin-fxwp3r` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent / Summary

Fix HIGH-severity expression injection vulnerability (CWE-20) in custos workflow trigger gates.
`${{ github.event.comment.body }}` was referenced directly in job-level `if:` expressions,
allowing arbitrary content to influence workflow control flow. Fix: move body checks to a
gate `run:` step using `env:` to pass the value safely, gate main steps on
`steps.gate.outputs.triggered == 'true'`.

## What Arrived

Two workflow files updated:

- **finalize-pr.yml** — job `if:` now checks author_association only (allows `github-actions[bot]`);
  gate step checks `$COMMENT_BODY` via env for `@claude finalize`; main step gated on trigger output
- **pr-readiness.yml** — same gate pattern; checks for `@claude check` and explicitly excludes
  `@claude finalize` to prevent accidental readiness triggering during finalize flow

## Resonance

*sealed*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202607250000 | @Eaprime1 |
| Finalized | 202607260212 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| DeepSource: Shell | ✅ |
| DeepSource: Docker | ⏭ |
| DeepSource: Secrets | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| GitGuardian Security Checks | ✅ |
| claude-review | ⛔ |

*Note: claude-review failure is expected — OIDC auth validates workflow file matches default branch;
modifying the workflow file itself in the PR causes auth failure by design. Not a code defect.*

## DeepSource Record

**Passed:** 2  
**Failed:** 0  
**Skipped:** Docker and other language analyzers (not applicable)

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | CI passed — targeted security fix |
| Consistency | 4/5 | Template complete · ethics 2/2 |
| Scope | 5/5 | 2 file(s) changed |
| Verification | 3/5 | CI checks completed |
| **Valuation** | **High** | 17/20 |

## Ethics Check

- ✅ No secrets or credentials introduced
- ✅ Targeted two-file change — narrows attack surface, adds no new behavior

## What Door Does This Open?

Gate pattern is now the canonical form across all three repos (custos, hodie, radix).
Future workflows should follow this pattern from the start.

---
**prima-clock:** 202607260212  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*
