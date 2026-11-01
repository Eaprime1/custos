# Renovata review: the floor under the Linear project

`suit: ♦️ Seed · plank: 1/3 Plank (proposed)`
`Prima-clock: 202611011738` (UTC; the Shepherd's anchor 202611010921 is Pacific, 202611011721 UTC)
`status: a floor that was true when written. The agent refreshes it (RENOVATA) and reports differences only.`

*Modeled on `atelier/hodie-shadow/202610152017_renovata-opening.md`: a table of what was checked and found, a short list of what was not checked, then four things named but not resolved.*

---

## Refresh: the floor at 202611011735 UTC

Pull request and issue state read through the REST API. Linear read through the connector, read only. Repo contents read from `origin/main`.

| Check | Result |
|---|---|
| custos `main` | `be1ed10` ("Shepherd's notes, prime-progression germ, cue parser reads refice/semina/sustine, Jira-first liminal", #471) |
| PR #473 `claude/finish-flywheel-sacred-seed` | open, draft. Run folder `atelier/heritage-pipeline/runs/202610201544_flywheel-sacred-seed/`: `PLAN.md`, `seeds.json`, an Active Reference, `NOTES-hash-and-tkp.md`. Not merged |
| PR #474 `hopechest/consummatio-colloquii` | open, draft. Carries `finish-the-conversation/SOP.md`, a `hopechest/README.md` and three templates. Read, including its bot and author comments. Not merged |
| custos issue #510 | open. Nine seams, an overlap table with #474, a layout question. Edited 202611011735 after finding that its first version wrongly said the SOP had no home in the repo |
| Armarium (private) | branch `hopechest/origins` pushed at `40e744a`, equal to `main`. Holds no origin. Nothing committed |
| Linear workspace | Qrunexusiam, team QRU. Four projects (P-QRU-1 to P-QRU-4). Suit and Plank label groups **absent**. Present: `Voice of Navigo`, `Devin Playbooks`, Bug, Improvement, Feature |
| Linear statuses | Backlog, Todo, In Progress, In Review, Done, Canceled, Duplicate (as `conventions.md` lists them) |
| Jira | KAN project and NEXUS-1 oversight space are the Shepherd's latest direction (`.shepherd/liminal-jira-202610310011.md`, checked by that session at 202610310011 UTC). **Not re-checked in this pack** |
| Paths the pack cites | All confirmed present on `main` at `be1ed10`, except the PR #474 files, which exist only on that branch |

**Not checked:** the content of other open custos PRs; Jira's current state; any Linear issues inside the four projects (only projects, labels, statuses and teams were listed); comments on custos#510 after its edit; the `docs/linear-plugin` skills beyond `conventions.md` and the setup skill.

---

## What the Flywheel run itself taught (carry forward)

- The procedure and custos disagree in nine places, and none of them is anyone's mistake.
- Earlier turns of the thread had invented details (a mileage figure, a baptism, an efficiency range) and a wrong suit mapping. Both were corrected in `PLAN.md` section 2 and none was carried into any file.
- An assistant cannot make an exact-bytes origin from inside the conversation it is in. The export has to come from the Shepherd.
- The automatic extractors missed real seeds before. Seeds are picked by a person.
- A private repo can be pushed to from a conversation once the repo is attached with push access. That is how the Armarium branch was made.

---

## Four things named, not resolved

1. **Which system holds the work.** Jira first (latest liminal direction) and a Linear project (this request) are both live. The sources do not say how they relate.
2. **Two spellings of the same four suits.** State names (Seed, Carbonite, Aethereal, Pinnacle) in `world/suit-and-plank.md`; card names (Diamond, Club, Heart, Spade) elsewhere. Not a conflict, but the labels need one choice.
3. **Two layouts for one job.** #473 and #474 both define where a finished conversation's package lives. Neither is merged.
4. **Documentation drift in the Linear plugin docs.** `conventions.md` says two projects and says label groups exist; the workspace has four projects and no such groups. Which side is edited to match the other is open.

---

## How to refresh this table

For each row: re-read the live source, write "same" or the new value, and add one line only where something changed. Do not re-derive rows that cannot have moved. Add a row for anything new you find. Report the differences first, in a reply of a few lines.

---

**prima-clock:** 202611011738
**witnessed:** false
