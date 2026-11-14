# PR Journey: #452 — final-oversight: report-only last look before merge, gated by the owner's approval

**Repository:** Eaprime1/custos  
**prima-clock:** 202610160434  
**Branch:** `claude/nifty-mendel-vyji3n` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Turn the by-hand final oversight into a workflow that waits for the owner's approval on purpose, so a PR cannot drift to merge on a stale green.

## What Arrived

- `.github/workflows/final-oversight.yml`: runs only when a PR carries the `final-oversight` label, in the `final-oversight` environment (the owner is the required reviewer). Posts one comment, updated in place, and a pass/fail check. It never seals, merges or edits the PR. The rules run from the base branch, so a PR cannot loosen the gate that reviews it. Fork PRs are skipped.
- `.github/scripts/final-oversight.js` (the rules) and `final-oversight-run.js` (gathers the facts from GitHub). The checks: every check and status on the head is green; no open review thread; the seal covers this head (only the journey document follows it); the PR's observation file is `status: complete` and scores M1 to M8; watched paths (Deck Master or seal path) are named in the PR body (information); stale claims (information).
- `tools/test_final_oversight.js`: 46 offline checks, wired into `seal-path-tests.yml`. Two deliberate breakages are caught by the table.
- `docs/final-oversight.md`, the `final-oversight` label in `.github/sovran-labels.yml`, the `CLAUDE.md` entry and workflow count (27).
- **Codacy round (`6e0755a`):** 17 findings on the first head, all in the new JS, now fixed. The critical and high pair was `new RegExp` built from a variable in `findObservation` (replaced by string checks plus one literal regex). The rest: functions over the complexity, length and parameter limits (`render`, `evaluateChecks`, `evaluatePostSeal`, `hardFail`, `run`, split into small helpers), redundant `'use strict'`, `node:` import, template literals. Lizard is clean at complexity 5, 20 lines, 4 parameters; behaviour is unchanged (46 of 46, the end-to-end dry run gives the same report).
- Watched paths touched, named here: `.github/workflows/final-oversight.yml`, `.github/scripts/final-oversight.js` and `final-oversight-run.js` are on the seal-path list. Nothing under `vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/` or `device/`.

## Resonance

*Instrument. It does what the first oversight did by hand, and asks for the owner's click first.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610160355 | @Eaprime1 |
| Finalized | 202610160434 | @Eaprime1 |

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
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| final-oversight | ⏭ |
| GitGuardian Security Checks | ✅ |
| custos-speaks | ✅ |
| validate | ✅ |
| tests | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| scan | ✅ |
| packet | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 21 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 4/5 | 8 file(s) changed |
| Verification | 5/5 | 21 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — the only hits are older ones in `review-packet.yml`
- ✅ No unintended harm surface in tools or scripts: report-only, no secrets, no paid model, base-branch rules, same-repo PRs only, no untrusted text in a shell, no RegExp built from input
- ✅ Shell inputs validated where applicable (the one shell step passes a path through `env`)

## What Door Does This Open?

Does the owner want a hodie version, and should the paid review having seen the final head become a rule?

## Witnesses

- @Eaprime1 · 202610160434 · sealed at finalize

---
**prima-clock:** 202610160434  
**witnessed:** true — 1 witness, sealed 202610160434 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*