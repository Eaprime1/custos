# PR Journey: #391 — prima recensio: log the first witness when a PR opens ready or is marked ready

**Repository:** Eaprime1/custos  
**prima-clock:** 202609291814  
**Branch:** `claude/prima-recensio-on-ready` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Make ready-for-review log a Prima Recensio on its own, so the first witness is in the PR's cue record without a comment. Closes #390.

## What Arrived

- `.github/workflows/latin-cue-record.yml` also listens to `pull_request` (`opened`, `ready_for_review`) and adds a `Prima Recensio` row, with the PR state at that moment and the review packet link. It skips drafts, forks and bot senders. A manual `prima recensio` comment still works and lands in the same log.
- `docs/latin-workflow-glossary.md` — Prima Recensio is now the one automatic call; the other calls stay the owner's.

Tested by running the script against a mocked context: ready-for-review, opened-ready, a manual comment, no cue, a quoted cue, a footer comment, and rows adding up in an existing log all pass. The completion check from #390 passes.

The workflow records only. It calls no model and never reviews, seals or merges; the paid Claude review still runs from `claude-code-review.yml`, which this PR does not touch. The row snapshots the PR the moment it is marked ready, so CI is usually still running; a later `renovata` comment refreshes it.

Separate from #389 (the disponi bot); the two touch different files.

## Resonance

*Steady, the first witness writes itself down.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609291810 | @Eaprime1 |
| Finalized | 202609291814 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| packet | ✅ |
| validate | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| scan | ✅ |

## DeepSource Record

*Not configured for this repo.*

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 6 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 2 file(s) changed |
| Verification | 5/5 | 6 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — the only hits are `.replace(` calls in workflow code, which are intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable (comment text is read in script code, never put into a shell command)

## What Door Does This Open?

Should the row also link the paid review's check once it exists, or is the packet link enough?

## Witnesses

- @Eaprime1 · 202609291814 · sealed at finalize

---
**prima-clock:** 202609291814  
**witnessed:** true — 1 witness, sealed 202609291814 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*