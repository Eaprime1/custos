# Build plan: Atrium, Finish the Conversation (and what is related)

`suit: ♦️ Seed · plank: 1/3 Plank (proposed)`
`Prima-clock: 202611011738` (UTC)
`status: proposed plan for the agent to refresh and the Shepherd to approve. Nothing is created in Linear from this file.`

*Six milestones. Each lists its issues, who decides, and how you would know it is done. Sizes are rough and are not estimates of time. The agent re-checks every "exists" claim against the repos before using it.*

---

## How to read the plan

- **Decider** is the person whose word closes the issue. "Shepherd" means only he can. "Agent" means the agent may do it after a yes on the milestone.
- **Check** is a command or a plain question. "None yet" is allowed and says why.
- Order matters only where **Blocked by** is shown.

---

## M0. Floor (setup, no building)

Goal: the agent knows the current state and the Shepherd has said yes to a shape.

| Issue | Decider | Check |
|---|---|---|
| Refresh the floor against `04-RENOVATA-REVIEW.md`; report differences only | Agent | A comment lists what changed, what is open, what was not checked |
| Report the workspace mismatches (labels absent, four projects) and ask: recreate or skip | Shepherd | JUDICIUM answered |
| Settle the system of record (Linear, Jira, or Jira as root with Linear as view) | Shepherd | JUDICIUM answered |
| Name the project and its owner | Shepherd | Name stated |

## M1. One-conversation package (the Flywheel run as the worked example)

Goal: one conversation taken through all five stages, so the next one has a pattern.

| Issue | Decider | Blocked by | Check |
|---|---|---|---|
| Pick one to three seeds from the five candidates | Shepherd | origin export | `seeds.json` has 1 to 3 `selected: true`, each `verbatim: pass` |
| Confirm or change name, runic code, three symbols | Shepherd | | A stated answer. The runic string needs a script reader |
| Decide the thread's date | Shepherd | | One line with the date and how known |
| Review the draft Active Reference; keep, trim or drop | Shepherd | | A stated answer |
| Decide whether the "Flywheel Sacred Seed" page enters the package | Shepherd | | A stated answer |
| Write the PR Journey once seeds are picked | Agent (after yes) | seed picks | The custos PR template sections are all filled (Intent, What Arrived, Resonance, Ethics Check, Sense Check, What Door) |

## M2. Reconcile the seams (custos#510)

Goal: each of the nine rows ends in one line: adopt the custos choice, amend the SOP, or keep both and say why.

| Row | Subject | Status of the question |
|---|---|---|
| 1 | Where Stage V archives | Decided in principle (private Armarium); the SOP needs amending |
| 2 | Passport inside the document vs beside it | Origins decided; derived documents open (sidecar or one marker line) |
| 3 | Who may apply the Wax Signet and the Notary Seal | Open |
| 4 | TKP gate | Proposed: a pass or fail checklist first |
| 5 | Valuation (€C, Ξ) | Principle decided (bounded, banded); form open |
| 6 | Seed extraction | Proposed: picked, never written |
| 7 | Quince 15 Lens and other undefined terms | Undefined; PR #474 lists more |
| 8 | Stamp length | Open; repo uses 12 digits UTC |
| 9 | The two engines | Not in custos; plan not started |

Plus one more: **choose the per-conversation layout** (#473 or #474) and **fix the SOP's home** (PR #474 `SOP.md`). One Linear issue per row, each with its row text copied in and a JUDICIUM comment. Check for each: the Shepherd's one-line answer is recorded on custos#510.

## M3. Armarium and custody

Goal: the origin is kept safely and the custody record is truthful.

| Issue | Decider | Check |
|---|---|---|
| Export the Flywheel thread as exact bytes | Shepherd | A file exists; its SHA-256 is recorded in a file beside it |
| Privacy review of that file | Shepherd | Pass, or what stays out |
| File the origin in the Armarium on branch `hopechest/origins` (exists at `40e744a`, same as `main`, empty) | Shepherd, with an assistant that has push access | `bash tools/verify.sh` in the Armarium passes; one origin per commit |
| Decide whether a registry row and a MOAV carrier are cut | Shepherd | A stated answer; if yes, the stamp is 12-digit UTC and a `chain_of_custody` field is present |

The Armarium is private. The agent does not need to read it. The agent tracks the work, not the contents.

## M4. Engines and gate

Goal: the machine parts are either brought in and tested or left out on purpose.

| Issue | Decider | Check |
|---|---|---|
| Decide whether the collapse and Makers Mark engines come into custos | Shepherd | A stated answer |
| If yes: a shared hashing module, tested against `sha256sum`; the five tests in PR #473 `NOTES-hash-and-tkp.md` section 1 | Agent (after yes) | The five tests pass; the first (collapse then verify) no longer reads TAMPERED |
| Manual gate (pass or fail, no score) adopted or amended | Shepherd | PR #473 `PLAN.md` section 6 reads as current |
| TKP: retire, keep as information, or keep as it is | Shepherd | Answer on custos#510 row 4 |

## M5. Related seeds (HANDOFFS A to G)

These are the hand-off topics already written in `atelier/heritage-pipeline/HANDOFFS.md`. Open them as backlog issues only; no work starts without a yes.

| Letter | Topic |
|---|---|
| A | Send the Armarium pack (commission pack) |
| B | Autographum (a section for handwritten origins) |
| C | Exemplar (a rare character and high-value lexeme) |
| D | Matenadaran and Valthraman |
| E | The scanner review (DeepSource and Codacy) |
| F | Armarium: detection and the Genizah |
| G | The time form |

---

## Order of work

M0 first and alone. Then M1 and M2 in parallel (they touch different questions). M3 needs the Shepherd's export, so it can sit while the others move. M4 waits for M2 rows 2, 4, 5 and 9. M5 is a shelf.

## What is not in this plan

- Building the engines (M4 asks whether, not how).
- Anything in the Armarium's contents.
- Merging, sealing or closing custos PRs.
- Linear automations. The agent suggests; the Shepherd configures.

---

**prima-clock:** 202611011738
**witnessed:** false
