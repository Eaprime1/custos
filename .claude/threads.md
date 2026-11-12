# Threads

Prima-clock: 202611120411
Kept by: nav1 (Claude with the Shepherd). A living register, not an append-only log. Format and rules: `docs/latin-workflow-v2.md`, section "Threads".

A thread is an open question or stream that outlives one PR. The navigo posts a thread's note
and asks when the work reaches it, so the Shepherd is not holding the list. Ids are never reused.

| Id | Name | State | Next ask, and where it is asked |
|---|---|---|---|
| T01 | Suit vocabulary | waiting on Shepherd | Which suit list is real: `CLAUDE.md` terms or the Linear names. Asked when #469 returns. Also in `turns/CULTIVATION.md`. |
| T02 | `held` gate | waiting on Shepherd | Whether `finalize-pr.yml` gets a real `held` gate. Asked when `sustine` is next used. |
| T03 | Jira and GitHub label sync | waiting on Shepherd | Whether labels sync automatically. Asked at the next Jira pipeline PR. |
| T04 | KAN-5 remainder | open | 37 of 48 findings overlap #441. After #468 merges, refresh #441 and re-query Codacy. |
| T05 | Dixi Jam four rights | waiting on Shepherd | Text of the rights, or where it lives (Drive, or a conversation). Asked on #470 with `confirmanda emenda`. If found in a conversation, run the finish-the-conversation process. |
| T06 | Machine: first live module | parked | Which module runs first, and whether it may run against a real system. Asked when a module is proposed for a live run. |
| T07 | Observation box from tracked comments | open | Tick `observed` from the Shepherd's observation comments tracked by #467, not only from the file. A small change to `latin-cue-record.yml`, after #467 merges. |
| T08 | Rejected-cue notice | open | When an owner cue line is rejected (a misspelling), say so in the cue log. See v2.1, "A cue that is not read". |
| T09 | Codacy checks to keep | open | Which checks stay, which get a narrow exclusion; no blanket exclusion. Asked at the next Codacy PR. |
| T10 | Mission board and simple tracker | parked | Start with a sheet or a checklist. Asked when the inventory is next opened. |
| T11 | Local model for simple lint fixes | parked | Whether opencode or ollama is worth setting up. Asked after T09. |
| T12 | Port the new modifiers to hodie | done | Done by hodie #173 (merged 202611120000-ish: see the PR). Row kept so the id is not reused. |
| T13 | Hand-off between conversations, and pandora seeds | open | The Shepherd's design (202611120345 UTC): a development conversation takes work to the Shepherd's "ready for review"; an oversight observer conversation (part of the shadow of ethica, in the Shepherd's words) takes the PR from there through the merge. New conversations start from a pandora seed (`pandora/GERM_SCHEMA.md`, the `semina` call), not a spawn. A seed carries the parent conversation's id and a link back; the new conversation's first message confirms it germinated from that seed; at milestones it sends a report to the linked conversations. Ask: which fields `GERM_SCHEMA.md` gains (parent id, link, germination confirmation, milestone report) and whether `semina` writes them. Asked at the next `semina`. |
| T14 | `^^^claude` carries the `@` role | open | `finalize-pr.yml` requires `@claude` in the comment before it will seal. The Shepherd wants `@claude` to mean only "look at this comment and proceed", and `^^^claude` (the project's version of `@`, for now) to carry the call, so the seal does not need `@claude`. Needs a Deck Master workflow PR to `finalize-pr.yml`, `cue-parser.js` reading `^^^`, the cue record, tests, and a hodie port. Until then the seal call still needs `@claude`. Ask: the order of those changes. Asked when the seal gate is next touched. |
| T15 | Format of the owner's stamp | open | `stamp-on-submit.js` appends `prima-clock: YYYYMMDDHHMM UTC (stamped on submit)`. The Shepherd wants the system standard format. Ask: is that the plain `Prima-clock: YYYYMMDDHHMM` the repo's other records use (UTC by convention), without the added words? Asked at the next change to `stamp-on-submit.js`. |
| T16 | `renovata` and scoring | open | The Shepherd's idea (202611120327 UTC): a `renovata` call starts a new scoring session from the new perspective, so a PR that gets one has two scores to average, or its stages are scored as separate events. Many changes in the development stage are expected. Ask: which of the two, and whether `RUBRIC.md` or the `work-eval` skill holds it. Also recorded in the PR #467 observation. Asked at the next `renovata`. |
