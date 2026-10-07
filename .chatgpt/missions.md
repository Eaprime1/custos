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

### Connect Nav5 Latin Cues and DeepSource Evidence

**Status:** OPEN  
**What:** Let Eric call `Navigo ChatGPT — Ultima Recensio` and
`Navigo ChatGPT — Ultima Probatio` as nav5 review stages while preserving the
owner-comment boundary for sealing. Improve DeepSource handling so quota,
skipped, failed, pending, and successful states are reported distinctly and
cannot be mistaken for one another.  
**Safety boundary:** Conversation calls may request review and evidence
assessment. They must not seal, finalize, witness, or merge a PR. The existing
explicit owner PR-comment cue remains the only finalization authority.  
**Compatibility:** Keep the Latin cue recorder, review packet, Claude review,
Codacy, DeepSource, repository checks, and manual merge decision additive rather
than mutually exclusive.  
**Done when:** A live PR demonstrates nav5 cue routing without sealing; the
finalization evidence records DeepSource state and quota exceptions accurately;
tests prove failed or pending required checks still block; and the owner retains
the final comment and merge decisions.

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
