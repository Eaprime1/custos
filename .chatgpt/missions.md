# Missions — .chatgpt (nav5)

Work assigned specifically to nav5's perspective — as opposed to
`.artesian/`, which is open to whichever navigo picks it up first.
Perspective and tracking live here; nav5 can still work on other repos
when a mission calls for it — this file just says where nav5's own
open threads are, from custos's side.

## Conventions

- One entry per mission: what it is, status, where the work actually
  lands (may be a different repo).
- Status: `OPEN` → `IN PROGRESS` → `DONE` (link the result) — same
  discipline as `queue/seed-weir/`.
- If a mission stops being nav5-specific and should be open to anyone,
  move it to `.artesian/` instead of leaving it here unclaimed.

## Active Missions

### Reconcile the Polar Radian Compass Conversation Return

**Status:** IN PROGRESS  
**What:** Preserve Eric + ChatGPT's current Compass consolidation as a
source return, reconcile it with the fuller Act II architecture already on
`main`, and seed **Act II — Shadow of Polaris** as a shared narrative
workspace without overwriting or prematurely canonizing its sources.  
**Where:** Source return in
`.chatgpt/202610061728_polar-radian-compass-conversation-return.md`;
working architecture in
`atelier/act-ii/The Polar Radian Compass, Sextant & Crystalline Metric Architecture.md`;
collaborative scene system in `atelier/act-ii/shadow-of-polaris/`.  
**Arrived:** a scene-contribution template, an Extended Wobble Record, a
working project plumb-line definition (right angle / perpendicular / dynamic
standard), recognition hooks for cross-conversation weaving, and an opening
narrative germ.  
**Done when:** the new templates receive witness review, at least one sovereign
scene uses both instruments, and the Shepherd decides what should remain
nursery material or route onward.

### Build a Workflow-Based PR Review

**Status:** OPEN
**What:** Create at least one PR-review GitHub Action for this repo
from nav5's own perspective — modeled on
`.github/workflows/claude-code-review.yml`'s trigger pattern: it fires
once when a PR opens non-draft or moves to `ready_for_review`, and
again only when the `ai-review` label is added — never on every push.
That keeps review activity token/usage-mindful and lets Eric control
when a review actually spends anything.
**Non-CLI first:** the workflow must not depend on a CLI tool being
installed/authenticated inside the Action runner — use whatever
API/Action form nav5 has that doesn't need a local login. A
CLI-dependent review is an optional *addition*, not a replacement —
most navigos can offer one, but it must gate on the exact same trigger
as the Claude review above, not fire eagerly on every commit while the
PR is still being worked. It must not run until the PR is actually
ready to finish.
**Where:** `.github/workflows/` in this repo. Read `claude-code-review.yml`
and `review-packet.yml` first — `review-packet.yml` is the free,
no-model-usage layer every review should read and build on, not
duplicate.
**Done when:** the workflow runs on a real PR and posts something
useful, without spending usage before Eric is ready to finish the PR.
