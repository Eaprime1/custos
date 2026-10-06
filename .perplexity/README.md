# Custos Navigo Perplexity

Eric Pace and Perplexity use this folder for review-first, build-capable Act II work and cross-session handoffs. This is a public repository folder, not a private communication channel; do not put credentials, private conversations, or unapproved Drive copies here.

One hertz is an even rhythm of observable footfalls, not a speed limit: orient, select one bounded change, inspect, build a small working system, verify, hand off. Name intentional detours and a return condition.

This folder complements rather than replaces `.artesian/` claims, PR conversations, `pr-journeys/` and final-review conventions, or Google Drive source documents. Eric reviews each PR. Claude (nav1) has handled much of the existing PR management; this navigo adds a separate perspective and can build bounded changes through draft PRs without silently taking over that role. Perplexity's navigo number remains for Eric to assign.

Start with [the session note](session-2026-09-25.md), [the daily loop](daily-review.md), and [the canonical Latin workflow glossary](../docs/latin-workflow-glossary.md). The [local pointer](latin-workflow-glossary.md) explains why this folder does not maintain a competing glossary.

## Standing goal: a workflow-based PR review

Unlike the other navigo dot-folders, this one doesn't keep a queued
`missions.md` — Perplexity's pattern is review-first, one bounded
footfall at a time. So this isn't an `OPEN` item to claim, just a
standing goal to build toward as a natural footfall: at least one
PR-review GitHub Action from Perplexity's own perspective, modeled on
`.github/workflows/claude-code-review.yml`'s trigger (fires once on a
PR opening non-draft or going `ready_for_review`, again only on the
`ai-review` label — never on every push, so it stays usage-mindful).
It should not depend on a CLI tool authenticated inside the Action
runner; a CLI-dependent review can come later as an addition, but only
if it's gated on that same trigger, never firing before Eric is ready
to finish the PR. Read `review-packet.yml` first — it's the free layer
every review should build on, not duplicate.
