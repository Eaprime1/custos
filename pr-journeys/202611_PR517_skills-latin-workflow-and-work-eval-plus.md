# PR Journey: #517 — skills: latin-workflow and work-eval, plus journey_scorecard tool

**Repository:** Eaprime1/custos  
**prima-clock:** 202611092142  
**Branch:** `claude/sweet-noether-5dwc3t` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Turn the Latin workflow into a skill, and add a retrospective way to grade, value and evaluate finished work, before the owner goes back into the PRs and branches.

## What Arrived

- `.claude/skills/latin-workflow/SKILL.md`: the calls, modifiers, addressing, three-letter codes and hyphen call form (proposed), a proposed merge word, what is live versus only words, the road of a PR, how to add a lexeme, and a guardrail against typing a live seal cue in a comment. It is a summary; the glossary wins on any disagreement.
- `.claude/skills/work-eval/SKILL.md` and `references/scorecard-template.md`: a six-dimension judgment layer (0 to 3 each, evidence required) over the existing auto-score, its relation to the observation rubric (M1 to M8), a Five Lakes valuation proposal for documents, and verdicts that map onto Latin calls (ready for probatio, emenda, judicium). It looks backward and leaves sealing and merging to the owner.
- `tools/journey_scorecard.sh`: read-only. Reads the auto-score out of `pr-journeys/`. Run on the current repo: 125 journeys, 97 with an auto-score, 58 of those at 20/20, 3 under 18, 28 with no auto-score. The tool reports that saturation, which is why the judgment layer exists.
- `CLAUDE.md`: the tool in the Shell Tools block and a short Skills section.
- `turns/observations/202611092140_pr517_observation.md`: the observation for this PR (`status: complete`).

Checked: the tool runs with no arguments, `--since`, `--csv`, and exits 2 on a bad `--since` and 1 on a missing folder. `bash tools/scan_lexeme.sh` is clean for the new files. ShellCheck was not available here.

## Resonance

**groundwork**

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202611091251 | @Eaprime1 |
| Finalized | 202611092142 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| DeepSource: Analysis | ⏭ |
| check | ⏭ |
| packet | ✅ |
| Codacy Static Code Analysis | ✅ |
| label | ✅ |
| packet | ✅ |
| final-oversight | ⏭ |
| scan | ✅ |
| custos-speaks | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| validate | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Analysis

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 13 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 4/5 | 6 file(s) changed |
| Verification | 5/5 | 13 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Should the six dimensions be tried on one real batch (for example the October journeys) before they are treated as the rubric? And an observation lexeme, as the owner suggested, belongs with the next lexeme rulings.

## Witnesses

- @Eaprime1 · 202611092142 · sealed at finalize

---
**prima-clock:** 202611092142  
**witnessed:** true — 1 witness, sealed 202611092142 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*