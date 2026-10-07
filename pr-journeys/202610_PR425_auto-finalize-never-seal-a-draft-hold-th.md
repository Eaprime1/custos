# PR Journey: #425 — auto-finalize: never seal a draft, hold the seal while changes are requested

**Repository:** Eaprime1/custos  
**prima-clock:** 202610070630  
**Branch:** `claude/quirky-carson-uez4sb` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Keep the auto-finalize bot, which the Shepherd finds useful on active PRs, and stop it sealing work that is not ready: drafts, and PRs with an open changes request.

## What Arrived

One file, `.github/workflows/auto-finalize.yml`, 21 lines added:

- **A draft is skipped** before any other check.
- **An open changes-requested review holds the seal.** Each reviewer's latest decisive review counts (approved, changes requested, dismissed). A later approval or a dismissal clears an earlier request, and plain comments do not count.
- The gates that already held the seal are unchanged: unresolved review threads, failing or pending checks, missing template sections, an age over one hour, and the `finalized` label.

Why: #405 was sealed on Oct 3 while still a draft, and the seal is meant to say the work is ready. #404 was sealed correctly, once it was ready and green.

Tested offline with a fake GitHub (13 checks): a draft is skipped, an open request holds the seal, approval or dismissal clears it, a comment does not, one reviewer's approval does not clear another's request, every older gate still holds, and a ready green PR is still finalized. The draft check fails against the old script and passes on this one.

**This is not the literal retirement** that pixelator did (it deleted `auto-finalize.yml`). The Shepherd's reasoning was to keep it for active PRs, so this narrows it. If retiring is still wanted, say so and this PR changes.

**Open for the Shepherd:** the one-hour age gate counts from when a PR was opened, not from when it was marked ready. A long-lived draft marked ready can be sealed on the next run with no review window. A "ready for one hour" gate would close that, but needs the timeline API, so it is left out here.

**Order matters for labels:** the `finalized` labels on #404 and #405 are meant to come off, but the bot would put them straight back (it re-checks on every check suite). They come off after this merges.

## Resonance

*Threshold*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610070621 | @Eaprime1 |
| Finalized | 202610070630 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| scan | ✅ |
| validate | ✅ |
| packet | ✅ |
| DeepSource: Analysis | ⏭ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Analysis

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 8 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 1 file(s) changed |
| Verification | 5/5 | 8 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Should a seal wait a set time after a PR is marked ready, so there is always a review window?

## Witnesses

- @Eaprime1 · 202610070630 · sealed at finalize

---
**prima-clock:** 202610070630  
**witnessed:** true — 1 witness, sealed 202610070630 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*