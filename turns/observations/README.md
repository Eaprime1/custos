# Observations

Prima-clock: 202610070835

An **observation** is the oversight review we do together, before the seal and
before the merge. It is a document, one per PR, kept in this folder.

## Order of a PR's last steps

1. **Prima Recensio** — the first witness, on ready for review (`latin-cue-record.yml`).
   The navigo opens the observation document from the [template](observation-template.md)
   with `status: open`.
2. **Oversight review** — in the conversation, the Shepherd and the navigo go through
   checks, threads, deferrals and what the PR changes. Findings are fixed or carried
   forward with a reason. The navigo updates the document as this goes.
3. **Observation complete** — the document is set to `status: complete`.
4. **Seal** — the owner gives the seal cue (`ultima Probatio` or `finalize`). Owner only.
5. **Merge** — on the owner's word in the conversation. The navigo files nothing after
   the merge but a one-line result.

The seal, the cue and the merge are unchanged. The observation sits in front of them.

## The observed box

The PR template has a box below `witnessed`:

```
**witnessed:** false
- [ ] **observed:** observation document filed in `turns/observations/`
```

`latin-cue-record.yml` ticks it when `<prima-clock>_pr<N>_observation.md` is on the
PR's head commit. A ticked box means the document **exists**. Read its `status:` line
(shown in the cue record) to see whether the review is complete.

## Filing

`turns/observations/<prima-clock>_pr<N>_observation.md`, one per PR, append-only once
`status: complete`. A later change gets a new section dated below the old ones.
No private details or real-place names.

## The observation log

Prima-clock: 202610180502

The Shepherd's observation comes as a review, a review comment or a PR comment whose
text starts a line with `shepherd observation`, then optionally a 12-digit stamp:
`shepherd observation 202610171524`. `observation-log.yml` records each one in a single
living comment on the PR, when it is made: the time GitHub posted it (UTC), the stamp as
typed, who, the commit, and the first words. A review's inline comments are counted and
linked. An edit updates its row; a deletion leaves the row in place.

- **Only the owner's own words count.** Quoted text, code, comments that carry the Claude
  Code footer (a navigo writing under the owner's login), bots and anyone else are skipped.
- **Two clocks, never converted.** The typed stamp has been local (Pacific) time and this
  repo's records are UTC, so the row keeps both. Nothing converts one to the other. A
  stamp that is not exactly 12 digits is not read as a stamp.
- **A log, not the observation.** It does not write the observation, tick the observed
  box or gate the seal. The navigo still files the observation; the log is what it is
  written from. Archiving the living comment at merge is Phase 3 of
  `docs/plans/202610070939-cue-sigil-and-living-observation-plan.md` and is not built.
- **Tests:** `bash tools/test_observation_log.sh`, offline.
