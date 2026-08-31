# Final Reviews

*Captured while the PR is still open — before archiving makes the
original review content hard to reach.*

Sibling to the main `pr-journeys/` (which records a PR's life **after**
merge/finalize, presentation-ready) and to `closures/` (branch closure
notes). A Final Review record captures the **substance** of the Final
Review stage — every reviewer finding and its disposition — while the PR
is live, per [`guides/pr-lifecycle.md`](../../guides/pr-lifecycle.md).

## Why This Exists

The dressed-up PR journey (`pr-journeys/*.md`) is a summary, written at
Finalize time, after Final Review is already done. It doesn't carry the
full finding-by-finding record — and once a PR is archived, that raw
review content stops being conveniently reachable. This closes the gap:
write the substance down *during* Final Review, not after.

## Naming

```
YYYYMM_PR{N}_{slug}.md
```

Same convention as `pr-journeys/`. Written and updated while the PR is
open — unlike the main journey, this document is *not* sealed at write
time; append to it as more review rounds happen.

## Structure

- **Header** — repo, branch, PR number, state (OPEN, not MERGED — this is
  written before that)
- **Reviewer Findings and Disposition** — one table per review round:
  reviewer, finding, disposition (applied verbatim / fixed independently
  / declined + reasoning), same format already proven in
  `pr-journeys/202608_PR310_locations-review-fixes.md`
- **Issues/Missions Spun Off** — anything Final Review's scope limit
  pushed out to `missions/` or an issue, rather than building inline
- **Status at Time of Writing** — what's still open, what's resolved

## Relationship to the Full PR Journey

When the PR reaches Finalize and gets its full `pr-journeys/*.md` entry,
that entry can reference this one rather than re-deriving the review
history. This document doesn't get replaced by the journey — it's the
detailed record the journey's summary was drawn from.
