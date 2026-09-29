# Final Review Record: #314 — Add files via upload (Breathe II access-attempt report)

**Repository:** Eaprime1/custos
**Branch:** `Eaprime1-accessability_issue-1` → `main`
**Author:** @Eaprime1
**State at time of writing:** OPEN — Final Review complete, proceeding to Finalize

## Intent

An unsolicited external report: a fetch tool with a strict URL allow-list
(only URLs already surfaced by a prior search/fetch result) confirmed
`guides/` and `.artesian/` exist in `Eaprime1/custos` but could not read
their contents, and documented that failure honestly rather than
fabricating what the guide might say. Surfaced before the Breathe II
copy-paste onboarding message went out to other navigo conversations,
per eaprime1's explicit sequencing.

## Reviewer Findings and Disposition (commit `3fc3b71`)

| Reviewer | Finding | Disposition |
|---|---|---|
| Copilot | Report added at repo root instead of a formal custody destination (`CLAUDE.md:182-187` routing convention) | **Applied verbatim** — moved to `incoming/pre-nullus/202608311051_breathe-ii-guide-access-attempt-report.md`, indexed in `incoming/pre-nullus/README.md`. |
| Copilot | "No 404" line overstates what was learned — the report's own Details section says requests were rejected *before* reaching GitHub, so no signal (404 or otherwise) was ever returned | **Fixed independently, with reasoning** — reworded to state plainly that no server signal was received either way; individual-file presence was undetermined by the report alone. |
| Copilot | Caveats section attributed repo-page metadata (ID, commit/star/fork/issue counts) to the README when Key Finding 1 sourced them from the root repository page | **Applied verbatim** — split the line to attribute each fact to its actual source. |

Codacy, DeepSource (30-language sweep), GitGuardian, dependency-review, and Custos's own shepherd/scan checks all passed with no findings. `claude-review` passed.

## Root-Cause Fix (beyond the PR's own content)

The report is real signal that `guides/breathe-ii.md`'s onboarding
approach didn't account for fetch tools with restrictive allow-lists.
Added a section to the guide itself — "If Your Tool Can't Fetch These
Files" — naming the failure mode and asking for content to be pasted
directly when a navigo hits the same wall. Logged as a Seed Weir entry
(`queue/seed-weir/README.md`, status PLANTED) rather than left buried in
this PR's own record.

A Final Review Note was appended to the report itself, filed from a
checkout with direct repository access, confirming the report's central
inference was correct: the files exist with real, substantive content;
the tool simply couldn't reach them.

## Status at Time of Writing

All three review threads resolved. All CI checks passing. No issues or
missions spun off — the guide fix was small enough to land inside this
PR's own scope (`main` commit `1d48334`, landed ahead of this PR to
unblock Breathe II regardless of this PR's own merge timing).

## Filed To

`incoming/pre-nullus/202608311051_breathe-ii-guide-access-attempt-report.md`
(the report itself, moved and annotated), `guides/breathe-ii.md` (the
fix), `queue/seed-weir/README.md` (the seed, PLANTED), a copy of the
finalized report also placed in the shared `marrowing_of_hope` Drive
folder.
