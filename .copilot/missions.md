# Missions — .copilot

Work assigned specifically to GitHub Copilot's perspective — as opposed
to `.artesian/`, which is open to whichever navigo picks it up first.
Perspective and tracking live here; Copilot can still work on other
repos when a mission calls for it — this file just says where its own
open threads are, from custos's side. Navigo number TBD — see
`stream-5-math/` in `CLAUDE.md` (Copilot: Mathematical Backbone /
prima-clock) for Copilot's existing domain assignment; this file is
separate from that.

## Conventions

- One entry per mission: what it is, status, where the work actually
  lands (may be a different repo).
- Status: `OPEN` → `IN PROGRESS` → `DONE` (link the result) — same
  discipline as `queue/seed-weir/`.
- If a mission stops being Copilot-specific and should be open to
  anyone, move it to `.artesian/` instead of leaving it here unclaimed.

## Primary Mission: PR Review

**Status:** OPEN, ongoing — this is Copilot's main job here, bigger
than any single bite-sized item below.
**What:** Copilot's native PR review (requested via the GitHub UI or
auto-assigned) is the critical function. Every PR benefits from it
reading the diff and flagging real problems before a human or another
navigo spends time on it. This is not a workflow file to build — it's
the standing job to keep doing well. The two missions below are small,
bounded side-tasks sized for the same bite as a review pass, not the
review job itself.

## Active Missions

### Retire the `bounty` label

**Status:** OPEN
**What:** `.claude/next-session.md` (2026-09-26) flags that `bounty`
should be retired across all repos in favor of whatever the
challenge/reward-ledger plan in
`docs/plans/202609252039-rewards-and-flags-plan.md` settles on. Confirm
that plan has landed (check for a newer session-close note first — this
one may be stale), then: find every open issue/PR carrying the `bounty`
label across custos and sibling repos, re-label or close per the
settled scheme, then delete the label itself.
**Done when:** `gh label list` no longer shows `bounty` in any repo it
was removed from, and nothing that mattered got silently dropped.

### CP-8 — pilot a per-round final-review record

**Status:** OPEN
**What:** `queue/future-forward/custos.md` [CP-8] notes pixelator keeps
one final-review record per round at `pr-journeys/final-reviews/`;
custos's `pr-journeys/` only records the outcome, not the round-by-round
findings. Read one example from pixelator's `pr-journeys/final-reviews/`,
then try the same pattern on a single custos PR as a pilot — don't
backfill every past PR, just prove the pattern once.
**Done when:** one real custos PR has a `pr-journeys/final-reviews/`
entry, and `queue/future-forward/custos.md` [CP-8] is updated to
RESOLVED with a link to it, or back to OPEN with what didn't work.
