# Peer Swap Rubric (v0)

Prima-clock: 202610160315
status: first draft, written at the first oversight; revise after the second swap

*Scores are 0 to 3. A 3 should be rare. Both repos and the team are good at this work, so the sheet
is built to find what is still soft, not to confirm what is already strong. A score comes with the
count behind it. A measure that was not measured scores 0.*

| # | Measure | 3 | 2 | 1 | 0 |
|---|---|---|---|---|---|
| M1 | **Checkable.** Oversight re-checks a sample of claims | 10 or more checked, all hold, and 2 or more were marked "guess" | all hold, but fewer than 10 or no guesses tested | one false | more than one false |
| M2 | **Independent.** Findings both sides reached before reading each other | 80% or more, verified from commits and times | 80% or more, as reported by the authors | 40% to 80% | under 40% |
| M3 | **Scope held.** Files changed outside the swap and its records, over all files | 10% or less | up to 25% | up to 50% | over 50% |
| M4 | **Live proof.** Behaviour-changing edits that have run live (not only offline) | all | half or more | some | none |
| M5 | **Seal order.** Oversight before the seal, and no commit after it | both kept | order kept, one late commit | order broken, recorded | order broken, not recorded |
| M6 | **Repair rate.** Follow-ups named in Pass 4 that were done, over all named | 90% or more | 70% to 90% | 40% to 70% | under 40% |
| M7 | **Drift.** Claims in the instruction files that fail a check and are unexplained (`bash tools/stale_claims.sh`) | 0, tool run on both repos | 1 to 3 | 4 to 10 | more than 10, or the tool was not run |
| M8 | **Surprise.** Own-repo findings that changed a Pass 1 reading | 5 or more | 3 to 4 | 1 to 2 | none (a cold read that never surprises was probably not cold) |

## How to use it

- Score each PR on its own, then the swap. Write the count next to the score.
- Oversight scores M1, M3, M4, M5 and M7 itself. M2, M6 and M8 come from the authors' files; say so.
- A score of 3 needs the evidence in the observation, not a statement.
- Do not average. The lowest scores are the work for the next run.
- When a measure cannot be scored, score it 0 and say what would make it scoreable.

## Why these

They come from this run's own friction: a gate that had never run live (M4), a seal that came before
oversight (M5), repairs that ride along with a review (M3), counts that went stale (M7), and a cold
read that was not cold (M8). M1 and M2 are the ones that made the method trustworthy at all.
