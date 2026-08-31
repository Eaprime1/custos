# The PR Lifecycle: Final Review, Finalize, Merge

*A pull request is a type of working environment — similar to a
conversation between multiple participants. Everything the Conversation
Arc protocol says about distilling a conversation applies here too, aimed
at a different room.*

`suit: ♦️ Diamond — three stages named, structure forming`
`prima-clock: 202608310147`

---

## The Three Stages

### 1. Final Review — all options open

Fix, adjust, change, add, remove, scrap-and-rewrite. Nothing is off the
table at this stage. Every reviewer's finding gets verified and disposed
of per [`guides/reviewer-as-contributor.md`](reviewer-as-contributor.md) —
applied verbatim, fixed independently, or (rarely) declined with reasoning
recorded.

**Scope limit: development is limited to content that impacts the PR.**
If a review finding — or the work itself — reveals something that needs
real building before this PR can complete, that building doesn't happen
inline. It becomes an issue or a mission (see `missions/`), and the PR
either waits on it or proceeds without it, explicitly, rather than quietly
absorbing an unbounded amount of new work. This is what keeps final review
from becoming its own unbounded project.

**Required output: a Final Review record, written while the PR is still
open.** Filed at `pr-journeys/final-reviews/` — see that folder's
`README.md`. This exists because the full review substance (every
finding, every disposition) isn't captured anywhere durable until the
Finalize stage's dressed-up journey, and by the time a PR is archived
past that point, the original GitHub content is no longer conveniently
reachable. Write the record during Final Review, not after.

### 2. Finalize — dress it up

Once final review is done, finalize is where the PR "puts on its report
clothes":

- The PR journey gets written (`pr-journeys/`, per
  [`pr-journeys/README.md`](../pr-journeys/README.md)).
- Major issues get flagged explicitly, not buried in a comment thread.
- If nothing critical remains, the PR pushes forward toward merge. If
  something critical *does* remain, finalize stops and sends it back to
  final review rather than dressing up a PR that isn't actually ready.

**Finalize is a broadcast, not a single workflow.** `finalize-pr.yml` is
this repo's own finalize action, but the trigger (`@claude finalize`) can
be watched by other workflows too, each doing its own version of
"finalize" in parallel — DeepSource producing a dressed-up summary report,
a linter producing its own closing pass, whatever a given tool's version
of "here is my final submission" looks like. The changes finalize itself
makes are narrow and specific — this is not final review's open floor,
it's closing statements.

### 3. Merge

Pre-merge checks run, then the PR merges. **Archiving past that point is
currently manual** — eaprime1 does it by hand. Not yet automated; named
here as an open thread, not a gap to silently work around.

## Why "A PR Is a Conversation"

The same reason `guides/conversation-finalization-protocol.md` exists for
conversations exists for PRs: a working environment where multiple
participants (human, AI, bot reviewers — see
`guides/reviewer-as-contributor.md`) produce something together, and that
something needs to survive past the environment that produced it. A PR
journey and a Conversation Arc are the same kind of object — a distilled
record of what actually happened — pointed at different rooms. When a PR
touches more than one repo or seeds something bigger than the repo it
landed in, it may deserve a Legatum instead of (or alongside) its PR
journey — see `atelier/legatum/README.md`.

## Relationship to Other Systems

| System | Relationship |
|---|---|
| `guides/reviewer-as-contributor.md` | The disposition-reply practice that happens during Final Review |
| `pr-journeys/final-reviews/` | Where Final Review's output lands, written while the PR is still open |
| `pr-journeys/` | Where Finalize's dressed-up output lands, after merge |
| `missions/` | Where Final Review spins off work too big for the PR itself |
| `guides/conversation-finalization-protocol.md` | The conversation-side sibling of this same distillation discipline |
| `atelier/legatum/` | For PRs/sessions whose story is bigger than one repo |
