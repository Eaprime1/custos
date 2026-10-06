# Peer Review Between Repos

`prima-clock: 202610060743`
`status: DRAFT v0, to be tested on Run 0 (custos and pixelator) and refined`

The repos in the constellation are peers. Each holds things the others could use, and copies of the same file drift apart quietly. This process is how two repos look at each other on purpose, decide what to share, and keep a record of what was decided.

It grows out of the [Repo Hygiene Routine](repo-hygiene-routine.md), which runs one way: custos checks another repo against its own baseline. Peer review keeps that check and adds the other direction and a hub view.

## Why a process, not a one-off

Run 0 found these before any lens was applied:

| Evidence | What it shows |
|---|---|
| `tools/validate_json_yaml.sh`: pixelator's copy fixes a missing-root false negative and merge-key handling; custos's copy lacks both | A fix can exist in only one repo |
| `tools/scan_lexeme.sh`: custos's copy scans `.yml` files and has the grep fix; pixelator's does not | The same, in the other direction |
| `docs/stale-branch-closure.md` is byte-identical in both | Copies that have not drifted yet |
| The hygiene check reports `scan_lexeme.sh` and `validate_json_yaml.sh` as **present** in pixelator | Present is not the same as current |

## Principles

- **Report, hold, do not fill.** Same discipline as the hygiene routine: name the difference, do not invent the answer.
- **Sovereign content stays sovereign.** Each repo keeps what is its own. Sharing is by choice and by PR, never by overwrite.
- **Facts first, judgment second.** A script gathers what differs. People and navigos decide what it means.
- **Keep the original.** A port shows its source and what was changed. Nothing is silently rewritten.
- **Credit both directions.** A finding that improves custos is as welcome as one that improves the other repo.
- **One change per PR,** so each can be reviewed, sealed and, if needed, undone alone.

## The three lenses

One pass looks at the pair three ways. Where possible, give each lens to a separate conversation so the views are genuinely different.

| Lens | Stance | Questions |
|---|---|---|
| **A: X through Y** | Repo X looks at Y | What does Y have that X lacks or does better? What would it cost X to take it? What is Y's own and should stay there? |
| **B: Y through X** | The mirror | The same questions, from Y's side |
| **C: the hub** | Custos looks at both, as coordinator | What applies to **every** repo, not just this pair? What is a pair-specific adaptation? What conflicts between the two views? What should be asked of the Shepherd? Who is the next pair? |

## The steps

1. **Pick the pair and the trigger** (see Cadence).
2. **Gather facts.**
   - `bash tools/peer_inventory.sh <repoA[@ref]> <repoB[@ref]>` lists same, differing and one-sided files, compared by git blob id.
   - `bash tools/repo_hygiene_check.sh <repo>` for each repo, against the baseline manifest.
   - Read the differing files. A difference is not a finding until you know which side is better, or that neither is.
3. **Run the lenses.** Each writes findings, each with its evidence.
4. **Disposition every finding** (below) and write the record.
5. **Open the PRs.** One per adopted or adapted change, in the repo that receives it. Draft first.
6. **File what needs the Shepherd** as OPEN rows in `queue/future-forward/<repo>.md`.
7. **Retro.** What did this run teach the process? Update this file.

## Dispositions

| Disposition | Meaning |
|---|---|
| **ADOPT** | Copy as is. The file has nothing repo-specific. |
| **ADAPT** | Port with named changes (names, paths, voice, local conventions). |
| **PROJECT-WIDE** | Applies to every repo. Goes on the shared list for the hub. |
| **ASK** | Needs a Shepherd decision. Not decided by the reviewer. |
| **SKIP** | Reviewed and not wanted, with the reason recorded. |

Each finding also records evidence, effort (XS, S, M, L), risk, and status (`OPEN` or `RESOLVED` with a link). Rows are never deleted.

## The record

`atelier/peer-review/<YYYYMM>_<repoA>-<repoB>_run-<N>.md`: facts, then each lens, then the findings table, then what the run taught the process. It is a nursery document, so nothing in it is canon until the Shepherd says so.

## Cadence and triggers

| Trigger | Why |
|---|---|
| After any port between repos | Check the port landed and that nothing else drifted |
| When a repo ships a new workflow, tool or convention | Announce it to the peers |
| When a shared convention changes (a lexeme list, a stamp format, a template) | Every repo that carries it needs the update |
| Before a repo starts receiving new material (for example the phone gateway) | Peers should agree on how it connects |
| Periodically, once per iteration or about monthly | Catch quiet drift |

**Order of pairs after Run 0:** custos with maw (maw is next to become active), then custos with hodie, then pixelator with maw (maw receives what pixelator routes).

## Sharing mechanics

The question from the June 26 note: can project-wide infrastructure live in one place and be reused by every repo? Three options, none chosen yet.

| Option | For | Against |
|---|---|---|
| **Copy and adapt, with a drift check** (today) | Simple. Each repo stays sovereign. Works offline and on Termux. | Drift is possible. Needs a check to catch it. |
| **Reusable workflows** (`workflow_call`, one repo hosts them) | One source for workflows such as finalize and review packet. | Cross-repo permissions and pinning. Per-repo adaptations (voice, paths, template sections) need inputs. |
| **Submodule or subtree** for shared docs and tools | A single copy of byte-identical files. | Awkward on a phone. Easy to leave stale. |

Proposal, to be tested: stay with option 1 and strengthen the drift check (compare content, not only presence), then trial option 2 on one stable workflow in a later run.

## Testing and refining

Run 0 is the test. After every run, answer:

1. How many findings, and how were they dispositioned? (A run that adopts nothing may mean the lenses are too timid, or the repos already agree.)
2. Which findings came from the script, and which from reading? Should the script find more?
3. Which steps were slow or unclear?
4. Did any finding turn out to be mistaken once checked? Why?
5. What would make the next run cheaper?

Change this file in the same PR as the run's record, so the process and its evidence stay together.

## Open questions for the Shepherd

- Should the hygiene manifest grow to include the four Latin-cue workflows, and compare content as well as presence?
- Who runs each lens: separate conversations, or one conversation in three passes?
- Is one prima-clock timezone to be chosen project-wide? (Run 0 found two in use.)
