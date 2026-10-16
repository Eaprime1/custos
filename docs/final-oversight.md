# Final Oversight

Prima-clock: 202610160354
status: first version, written after the first oversight (custos#450, hodie#165)

*The last look before a merge, run only when the owner says so.*

## What it is

A workflow, `.github/workflows/final-oversight.yml`, that checks a PR the way the first
oversight did by hand, and posts the result as one comment. It reports. It does not seal,
does not merge and does not edit the PR. The seal and the merge stay the owner's.

## What it checks (on the PR's current head)

| Check | Passes when | Counts as |
|---|---|---|
| Checks and statuses | every check run and commit status is green or skipped; none pending | must pass |
| Review threads | none open | must pass |
| Seal covers this head | a seal record exists, and only the journey document (a bot commit that touches only `pr-journeys/`) follows it | must pass |
| Observation complete | `turns/observations/<stamp>_pr<N>_observation.md` is in the PR, says `status: complete`, has Seen, Carried forward, Scores and Result, and scores M1 to M8 (0 to 3) | must pass |
| Watched paths | lists files under `vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/`, `device/`, `CODEOWNERS` and the seal path, and says which the PR body does not name | information |
| Stale claims | `bash tools/stale_claims.sh` count for `CLAUDE.md` | information |

The rules live in `.github/scripts/final-oversight.js`; `final-oversight-run.js` gathers the facts from GitHub and hands them over. The rules are tested offline by
`tools/test_final_oversight.js` (42 checks, run in CI by `seal-path-tests.yml`).

## How the owner's approval works

The job runs in a GitHub **environment** named `final-oversight` that lists the owner as a
required reviewer. Until the owner approves, the job shows **Waiting** on the PR and
nothing runs. The owner uses "Review pending deployments", the same place as other
approval prompts.

**One-time setup (the owner does this in the repo settings):**

1. Settings, Environments, New environment, name it `final-oversight`.
2. Tick "Required reviewers" and add the owner. Save.

Without step 2 GitHub creates the environment with no protection and the job would run
without waiting. Check it once after setup.

## How to use it

1. Finish the oversight review and file the observation with `status: complete`.
2. Add the `final-oversight` label to the PR.
3. Approve the waiting run. Read the comment it posts.
4. If it is green, seal, then merge on the owner's word. If it is red, fix the item, and the
   new head waits for a new approval (the older waiting run is cancelled).

## Safety

- The rules run from the **base branch**, not from the PR, so a PR cannot loosen the gate that
  reviews it. A PR that changes `final-oversight.js` is reviewed by the old version and the
  change is listed under watched paths.
- Only PRs from this repository run it. A fork PR is skipped.
- It needs no secrets and no paid model.
- The first run is on the first PR *after* this one merges, because the rules must be on the
  base branch.

## Not yet

- A matching version for hodie (it has no observation folder).
- A rule for the paid review having seen the final head.
- A check that the observation's scores are backed by counts.
