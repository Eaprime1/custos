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
| File review (Shepherd Considers) | the checklist comment names this head (or a head only the journey document follows), lists every file, and every file to read is ticked (`docs/file-review.md`) | must pass |
| Watched paths | lists files under `vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/`, `device/`, `CODEOWNERS` and the seal path, and says which the PR body does not name | information |
| Stale claims | `bash tools/stale_claims.sh` count for `CLAUDE.md` | information |

The rules live in `.github/scripts/final-oversight.js`; `final-oversight-run.js` gathers the facts from GitHub and hands them over. The rules are tested offline by
`tools/test_final_oversight.js` (60 checks, run in CI by `seal-path-tests.yml`).

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
2. Call the seal (`ultima probatio` / `@claude finalize`). Once `finalize-pr.yml` actually
   seals — every gate passed, not just the call made — it now applies the `final-oversight`
   label itself (added 2026-10-29; see "Known gap" below). The label no longer needs to be
   added by hand.
3. Approve the waiting run. Read the comment it posts.
4. If it is green, merge on the owner's word. If it is red, fix the item, and the
   new head waits for a new approval (the older waiting run is cancelled).

## Known gap (2026-10-16 to 2026-10-29)

The `final-oversight` label was designed as a manual step (the original "How to use it"
step 2, above). In practice nobody ever added it — not on #468, #469, #470, #487 (the PRs
listed in `Custos — The Oversight Opening`, 2026-10-27), and not on #476, #496, #497, #498,
or #499, all handled in the same stretch this fix came from. The environment itself was
configured correctly the whole time (required reviewer set 2026-10-16); the job simply
never got queued, because its only trigger — the label — was never applied by anyone. Every
one of those PRs' observations correctly logged `final-oversight: skipped, not an executed
successful oversight review` rather than misreporting it as a pass, so nothing was
silently approved — the gate just never ran. Fixed by applying the label automatically at
the point `finalize-pr.yml` actually seals a PR (step 10b in that workflow), so the
approval step still belongs to the owner, but reaching it no longer depends on a label
nobody remembered to add.

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
