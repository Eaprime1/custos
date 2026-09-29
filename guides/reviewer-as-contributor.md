# Reviewers Are Contributors

*Every voice that touches a PR — a comment, a suggested diff, a passing
check — is a type of contributing entity. The system grows through
interaction, not through review as a gate to clear.*

`suit: ♦️ Diamond — practice named, structure forming`
`prima-clock: 202608302037`

---

## The Principle

When a PR is open, `codereviewbot-ai`, `Copilot`, `deepsource-io[bot]`,
`claude[bot]`, and a human co-owner are not sorted into "real feedback"
and "noise to clear." Each one that leaves a finding is treated the same
way: as a contributor whose input becomes part of the record. We don't
need to differentiate human, AI, or bot to decide whether a finding
counts — the finding either holds up or it doesn't. What we *do* track,
when it's necessary or appropriate, is attribution: whose finding this
was, and what happened to it.

This isn't a courtesy. It's load-bearing: this session alone, treating
`codereviewbot-ai` and `Copilot`'s findings as real work to trace to root
cause (not just patch locally) surfaced two bugs that existed in custos
itself, not just the repo being reviewed (`scan_lexeme.sh`'s duplicate
`--include` flags and missing `*.yml` coverage; `sovran-labels-sync.yml`'s
missing `closure` label — see `pr-journeys/202608_PR311_fix-sovran-labels-
sync-yml-closure-label.md` and prima's `202608_PR19_review-fix-round.md`).

## The Practice

For every finding on a PR:

1. **Verify it's real.** Read the actual code/doc, not just the comment.
   Some findings are stale (GitHub's line-position tracking can re-anchor
   an old comment onto unrelated current content) or already resolved by
   an earlier fix — check before acting, don't assume every open comment
   thread still describes current reality.
2. **Fix it, at the root if the finding leads there.** A finding on repo A
   might be a symptom of a bug that also lives in repo B, if A's file was
   copied from B. Fix both, not just the one that was reviewed.
3. **Reply in the thread, crediting the reviewer by name**, stating the
   disposition:
   - **Applied verbatim** — a suggested diff (a ` ```suggestion ` block or
     equivalent) was used as-is or in substance.
   - **Fixed independently** — addressed differently, with the reasoning
     for the different approach when it isn't obvious.
   This reply *is* the interaction — the reviewer's finding produced a
   visible, attributed response, whether or not the reviewer can read it.
4. **Let the PR owner resolve the thread** once they've seen the reply and
   agree it's handled. Don't resolve your own replies — that's the human
   owner's confirmation step, not an automatic one.
5. **Record the full disposition in the PR's journey** (see
   `pr-journeys/README.md`) as a table: reviewer, finding, disposition.
   Two real examples: `pr-journeys/202608_PR310_locations-review-fixes.md`
   (five review rounds, custos) and prima's `202608_PR19_review-fix-
   round.md` (two rounds, cross-repo root-cause fixes).

## What This Is Not

- Not a reason to auto-apply every suggestion without reading it — a
  finding can be wrong, or right about a symptom but wrong about the fix.
- Not a mandate to loop indefinitely — if a review cycle stops finding new
  issues (or eaprime1 names the pattern directly, as happened at round 5
  of PR #310), stop and merge. Diminishing returns are real.
- Not a replacement for the Shepherd's own review — reviewers are
  contributors, not the final gate. eaprime1 reviews too, and always has
  final say.

## Relationship to Other Systems

| System | Relationship |
|---|---|
| `guides/multi-ai-workflow.md` | Broader multi-entity handoff philosophy (the Lumenar); this guide is the specific PR-review-comment practice within it |
| `pr-journeys/` | Where the disposition record lives per PR |
| `docs/repo-hygiene-routine.md` | An example of a routine whose review findings led to root-cause fixes in a second repo, per this guide's step 2 |
