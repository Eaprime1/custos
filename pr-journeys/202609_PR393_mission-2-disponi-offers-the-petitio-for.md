# PR Journey: #393 — mission 2: disponi offers the petitio form when a seat is open or paused

**Repository:** Eaprime1/custos  
**prima-clock:** 202609291825  
**Branch:** `claude/petitio-template` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

When the disponi bot answers open or paused, its reply carries the petitio form (Intent / Approach / Completion check), so a navigo fills in a form instead of writing the plan from memory. Closes #392.

## What Arrived

- `.github/workflows/disponi.yml` — open and paused replies include a copy-ready petitio block, inside a code fence so the cue in it is quoted, not given. Taken seats (in progress, submitted, claimed, closed) get no form.
- `docs/mission-board.md` — one line saying the disponi reply carries the form.

**Not yet tested, please hold before merging.** The shell was unavailable while I built this, so I pushed the files through the GitHub connector and could not run the mocked-context test I ran for the disponi bot in #389. I read the JavaScript by eye and it looks sound, and the #392 completion check passes by search (`petitio_template` is on line 72). This is a live workflow, so I will run the test as soon as the shell is back and say so here before this goes ready.

## Resonance

*Careful, the form waits for the test.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609291821 | @Eaprime1 |
| Finalized | 202609291825 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| GitGuardian Security Checks | ✅ |
| packet | ✅ |
| claude-review | ✅ |
| custos-speaks | ✅ |
| record | ✅ |
| Codacy Static Code Analysis | ✅ |
| claude-review | ⏭ |
| check | ⏭ |
| DeepSource: Analysis | ⏭ |
| record | ⏭ |
| packet | ✅ |
| claude-review | ⏭ |
| custos-speaks | ✅ |
| scan | ✅ |
| scan | ✅ |
| validate | ✅ |
| dependency-review | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Analysis

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 17 CI check(s) — all passed |
| Consistency | 4/5 | Template complete · ethics 4/5 |
| Scope | 5/5 | 2 file(s) changed |
| Verification | 5/5 | 17 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ☐ `bash tools/scan_lexeme.sh` run — not run yet (shell unavailable); to run with the test
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable (comment text is read in script code, never put into a shell command)

## What Door Does This Open?

Should a petitio comment get an acknowledgement from the bot, or stay with the Shepherd?

## Witnesses

- @Eaprime1 · 202609291825 · sealed at finalize

---
**prima-clock:** 202609291825  
**witnessed:** true — 1 witness, sealed 202609291825 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*