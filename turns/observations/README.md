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

## The Shepherd Copy

Each observation carries a **Shepherd Copy** section: the reading copy of the PR for the
Shepherd, written from the Us perspective, with a reading path, an open margin for the
Shepherd's ideas, and echoes into the project's record. The PR description points to it.
It is advisory for now. Definition: [`world/shepherd-copy.md`](../../world/shepherd-copy.md).

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
