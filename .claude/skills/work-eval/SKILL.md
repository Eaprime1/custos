---
name: work-eval
description: Grade, value and evaluate finished work in custos (merged PRs, journeys, documents, tools, skills) as a retrospective. Use when the owner asks to review what has been completed, score or value past work, audit the quality of PR journeys, or check whether the existing auto-score means anything. Not for processing open PRs or sealing anything.
---

# Work Eval

**Prima-clock:** 202611090500
**Suit:** ♣️ Club, working copy
**Pairs with:** the `latin-workflow` skill (stages), `valuation/five_lakes_valuation_bridge_202606112205.md` (document rubric), `tools/journey_scorecard.sh` (facts)

This skill looks **backward**. It reviews work that is done and asks how good it was and where it belongs. It does not open, seal, merge or comment on PRs. Verdicts are advice to the owner. The Deck Master decides custody.

## Why a judgment layer

The auto-score in `finalize-pr.yml` (Correctness, Consistency, Scope, Verification, out of 20) counts CI check runs and changed files. It cannot tell sound work from tidy work. As of 202611090500, 63 of the 91 journeys carry it. Of those, 40 score 20/20 and only 2 score below 18. The other 28 carry no auto-score at all (closures, superseded duplicates, older journeys). A scale that saturates tells you nothing, so treat it as a **floor**: a low score is a flag, a high score is not evidence of quality. Run `bash tools/journey_scorecard.sh` to see the current distribution before trusting any number.

## Three layers

| Layer | What | Who produces it | Trust |
|---|---|---|---|
| 1. Mechanical | The auto-score already in each journey | `finalize-pr.yml` | Floor only |
| 2. Judgment | Six dimensions below, each scored with cited evidence | You, per unit of work | The real grade |
| 3. Valuation | Five Lakes card (suit + rank) for documents | You propose, Deck Master decides | Placement, not quality |

## Layer 2: six dimensions, 0 to 3 each (total 18)

Every score needs a **cited piece of evidence** (file path, line, command output, commit). No evidence, no score above 1.

| # | Dimension | 0 | 1 | 2 | 3 |
|---|---|---|---|---|---|
| 1 | **Intent** | None stated | Stated, vague | Stated, result matches | Stated, matches, and says what it deliberately leaves out |
| 2 | **Evidence** | Nothing run | "CI passed" only | A completion check run and named | Check output shown, and it would fail if the work were wrong |
| 3 | **Scope** | Silent extras or unrelated changes | Mostly one change | One change, all declared | One change, declared, and the diff matches "What Arrived" exactly |
| 4 | **Custody** | Unstamped, misfiled | Stamped or filed, not both | Stamped, filed, chain recorded | Also logged where the convention requires (turn log, registry, MOAV) |
| 5 | **Reach** | Orphan: nothing links to it | Linked one way | Linked from where a reader will look | Also wired in (tested, in CI, or referenced by the manifest) |
| 6 | **Loose ends** | Unnamed gaps | Gaps mentioned | Gaps named with an owner | Carried forward to a filed destination (queue row, issue, `turns/CULTIVATION.md`) |

### Reading the total

| Result | Latin call it maps to |
|---|---|
| 15 to 18, no dimension at 0 or 1 | Ready for `probatio`. Nothing to amend. |
| 11 to 14, or any dimension at 0 or 1 | `emenda`. List one flag per weak dimension. |
| Evidence at 0 or 1 because a claim could not be checked | `emenda confirmanda`. |
| Work is sound but a needed step is missing | `emenda supplenda`. Not a defect. |
| The grade turns on a choice only the owner can make | `judicium`. Give options, do not decide. |
| 0 to 10 | `judicium`: keep, rework or retire. |

A single 0 on **Evidence** or **Custody** caps the verdict at `emenda`, whatever the total.

## Layer 3: valuation (documents only)

Use the five questions from the Five Lakes bridge document: clear title (+2), prima-clock stamp (+2), complete (+3), connects to other documents (+2), assigned a destination (+1). Score maps to a card rank. Suit follows the lake that matches the document's nature.

- Floor value is 1 chip per document.
- State which suit system you are using. The hub suits (CLAUDE.md) and the Five Lakes suits collide on the same four symbols (`valuation/JOURNEY_SCHEMA.md`). Give both readings if ambiguous.
- Propose only. Never place anything in `vault/spade-of-aces/`.

## Procedure

1. **Scope the batch.** One of: a date range, an arc, a repo, or "everything merged since the last eval". Say what is in and out.
2. **Gather facts, do not judge yet.** `bash tools/journey_scorecard.sh` for the layer 1 table and saturation report. Add `--since YYYYMM` to narrow it.
3. **Sample.** If the batch is large, grade every unit with a layer 1 flag, plus every unit that touched a watched path (`vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/`, `device/`, `.github/workflows/`), plus a random handful of the rest. State the sample rule.
4. **Read the unit, not the summary.** Open the journey and check its claims against the merged diff and the files. A journey is a custody record written by the PR's own process, so it can overstate.
5. **Score layer 2** with one cited evidence line per dimension.
6. **Propose layer 3** for documents.
7. **Write the card** (template: `references/scorecard-template.md`). File it as `valuation/evals/<YYYYMM>_<scope>_eval.md`. This folder is a proposal. If the owner wants a different home, move it.
8. **Close with the Latin stage.** End with the call the batch maps to: how many are ready for `probatio`, how many need `emenda` (with the flags), how many need `judicium`.

## Rules

- **Grade the artifact, not the author.** Same bar for Claude, Gemini, ChatGPT, Perplexity and the owner.
- **Report, hold, do not fill.** If a dimension cannot be checked from the repo, say so and score it low with the reason. Do not assume.
- **A grade is not a seal.** Do not post a seal cue, do not label a PR, do not merge. The seal and the merge stay the owner's.
- **Past entries stay.** Do not edit journeys, `turns/log.md` or `pr-journeys/` to improve a score. If a journey is wrong, say so in the eval and let the owner route a correction.
- **Check the grader.** When a batch lands 18 of 18 across the board, say the rubric may be too easy and name one question that would have separated the units.
- **No cash.** Chips and cards are project vocabulary. Rewards are XP, badges and Sparstones. Do not map a grade to money.
- **Turn log.** An eval session is a meaningful session. Append to `turns/log.md` when it ends (schema in `turns/TURN_SCHEMA.md`).
