# Shepherd's notes

**Prima-clock:** 202610190754 (UTC)
**Suit:** ♣️ Club, working copy
**Plank:** 1/3, structure forming

*Eric's page. It grows. Anyone working with the Shepherd (a conversation, a navigo) adds to it as
things come up. The Shepherd can also just say "add this to the notes."*

How it works:

- **Threads** is a living table. Edit a row in place when a thread moves, and stamp the change.
- **Decided**, **Words** and **Candidates** grow by addition. Do not rewrite what the Shepherd said.
- **Log** is append only, newest last.
- The Shepherd's own stamps look like Pacific local time (202610190044 is 07:44 UTC).
  Repo stamps are UTC (`date -u '+%Y%m%d%H%M'`). When both appear, say which.

## Threads

| # | Thread | State | Where |
|---|---|---|---|
| 1 | Does the seal gate read `held`? | Answered 202610190754: no. The label exists; nothing reads it. | `sovran-labels.yml`, `finalize-pr.yml` |
| 2 | `refice`, `semina`, `sustine` | Accepted. Parser and cue record read them (202610310011 UTC). They set nothing yet. | `cue-parser.js`, `latin-cue-record.yml` |
| 3 | `probatio` starts the soft-seal scans | Decided in principle. Not built. | needs a workflow edit |
| 4 | KAN-4 (Codacy 8) | Draft PR #468, Idling, waiting on the Shepherd to read 3 files | KAN-4 |
| 5 | KAN-5 (Codacy 48) | Waiting for the Shepherd's go. Touches the same files as KAN-4, so after #468 merges. | KAN-5 |
| 6 | KAN-6 (labels, Idling) | Draft PR #469, decisions recorded in §7 | KAN-6 |
| 7 | KAN-7 (the Machine) | Germ. Gets the expert-Unexusi-per-tool idea | KAN-7 |
| 8 | Suit list conflict | Open | `turns/CULTIVATION.md` |
| 9 | Prime progression | Germ filed. Steps 21 to 59 not given. | `.shadow-well/prime-progression-germ.md` |
| 10 | DeepSource and Codacy on request | Shepherd checks their settings | their dashboards |
| 11 | Roads ladder | Drafted below, waiting on the Shepherd | this page |
| 12 | Connector matrix | Candidate 4 | below |
| 13 | Conversation-branching methods | Needs the old methods pasted in | candidate 5 |
| 14 | Seats and folders (mulberry, unexusiam, primapixel) | Plan filed 202610310146 UTC. Terminals and second repo answered 202610310250 UTC (`primal`). Rename timing open. | `seats.md` |
| 15 | Harmony server format | Epic KAN-8 opened at the Shepherd's yes. Format and the unfinished server not yet described. | KAN-8 |
| 16 | Official stamp on submit | Built (option 1, append a UTC line). `stamp-on-submit.yml` + script + test. Comment stamping starts once it is on main. | PR 471 |
| 17 | Connector experts | Filed as a seed 202610310300 UTC; moved to the atelier 202610310612 UTC | `atelier/connector-experts-seed.md` |
| 18 | Harmony and Discord handoff | Semina written for the antigravity navigo 202610310315 UTC. Stages named: 1/3 voices of navigo, 2/3 manos of navigo, 3/3 open. | `.antigravity/` |
| 19 | Server custos (queen) | Seed at 1/3 plank 202610310613 UTC; woven into KAN-8 | `atelier/server-custos-queen-seed.md` |
| 20 | Content risk level | Seed 202610310613 UTC; levels not scoped | `atelier/risk-level-seed.md` |
| 21 | Balance and pressure | Seed for a conversation 202610310613 UTC | `atelier/balance-pressure-seed.md` |
| 22 | Conversation reference | Tracker seed; a title is enough | `.claude/conversations.md` |
| 23 | System email | Seed placed with Navigo Perplexity | `.perplexity/system-email-seed.md` |
| 24 | Mulberry repo plan for GitHub Copilot | Opportunity noted; the plan is not yet written | none yet |
| 25 | Print option for pages | Deferred until the Latin lexeme update. For now the notes carry it | none |

## Decided

- 2026-10-31: the atelier is the default workshop: seeds found in a domos go to its atelier unless the folder says otherwise.
- 2026-10-31: undershepherd describes the AI side of a navigo, `navigo(shepherd)_gemini(undershepherd)`, as a partial descriptor only.
- 2026-10-19: starter tickets KAN-1 to KAN-3 stay as examples. SAM1 stays as the practice board.
- 2026-10-19: the repo label system is primary. Jira follows it.
- 2026-10-19: `ultima recensio` is the last step before oversight; then `probatio`.
- 2026-10-19: `novissimum` is "end it now": only small tweaks, carry the rest forward by name.
  `cursus expeditus` stays as the glossary has it.
- 2026-10-31: an Epic is opened for the harmony server format (KAN-8). Discord is not a server of the Shepherd's; it would
  be one built from that format. Every server gets a way for him to interact, a simple UI at minimum.
- 2026-10-31: the harmony and Discord working copy goes to the antigravity navigo, in `.antigravity/`. The Shepherd gave three stages
  for the larger build: 1/3 voices of navigo, 2/3 manos of navigo, 3/3 open.
- 2026-10-19: the work is shifting from building to overseeing. Build the playground (a safe
  place to be as is), then oversee it.

## Words

| Word | State | Meaning |
|---|---|---|
| `recensio`, `probatio`, `renovata`, `extrema`, `emenda`, `novissimum`, `cursus`, `expeditus`, `ultima` | Live (glossary, v2) | As in `docs/latin-workflow-glossary.md` |
| `refice` | Read by the parser | Repair by plan. With a plan, follow it. Without one, write the plan, then repair. |
| `semina` | Read by the parser | Sow the seed. Write a handoff block so the work continues in a new conversation. Clutch in (disengage, like a vehicle's clutch), explore, clutch out (re-engage). |
| `sustine` | Read by the parser; sets nothing | Hold back. Sets `held`; the final seal waits for the Shepherd's release. The tenor of being held is part of the design. |

My Latin is a working reading; the Shepherd's ear decides. Making any of these live means:
`cue-parser.js` and its test rows, the glossary and v2 doc, and (for `sustine`) the seal gate
reading `held`. Each is a reviewed change.

## Roads

A ladder of reach for any piece of work. Offered as a draft.

| Road | Reach |
|---|---|
| Interstate | across repos, the constellation |
| US highway | a whole repo |
| State road | an arc or a branch |
| County road | a PR |
| Forest service road | the sandbox: SAM1, the Machine |
| Street and address | a file or a line |
| Back roads | paths taken because an idea pulled, not because a plan said so |
| Mystery and secret roads | known to few, unnamed: the shadow-well |
| Imaginary roads | anchored serious play |
| Capillaries | the smallest scale, where "artery or vein" stops mattering and the blood flows regardless |

Country Roads is the safety net: the way back home. It sits inside the project's safe
bookends. For anyone whose history makes that song or that road hard, it is offered, never
imposed, and they can name their own road home.

Provenance: the Shepherd grew up in Coos Bay, Oregon (Eastside, Greenacres), on Highway 101.

## Candidates

The Shepherd's five titles, tightened, with a view on each. None is a ticket yet.

1. **Wolven images and Loreye: the image and lore library.** Content with provenance. First
   step is an inventory: where the images live, which are lore and which are art. I do not know
   what Loreye is, so this needs the Shepherd's words before anything is built.
2. **The Machine as a method.** KAN-7 is the artifact (the pinball). This is how productivity
   works through it: chained stations, each one visible and cheap, each handing off to the next.
   Probably KAN-7 becomes the Epic and this is a child.
3. **Prime progression (Epic).** Yes, an Epic, and KAN's first. Children: the germ is filed;
   steps 21 to 59; how it meets `.prime` and hodie's list; the math link at 21; how it drives
   the oversight transition.
4. **Connector matrix: who can connect to what.** Rows are voices and tools; columns are
   read, write, auth, where configured, limits, last verified (stamped). The "last verified"
   column matters: connectors drop and return between sessions. A CSV in the repo is
   versionable; a Google Sheet is easier to edit. The Shepherd picks.
5. **How a conversation branches: spawn, divergent, rabbit trail, shadow, child.** Inventory
   the old methods (they live in earlier conversations I cannot see), then say which cue now
   covers each, so there is one system and not five. Candidates: spawn is `semina`, hold is
   `sustine`, fan-out is `^omnes`, the whole is `^cuncti`, shadow is the shadow-well.

6. **Connector experts.** A skill set per connector, each a station that looks for opportunities as a PR
   moves (Zapier first, as his example). More steps at the same time, not faster steps. Filed as a seed:
   `atelier/connector-experts-seed.md` (moved from `.shadow-well/` 202610310612 UTC).

The five-chapter story pattern (five content streams, a sixth to gather, a seventh to build)
is the shape `returns/` already has: streams 1 to 5, a gather step in `queue/artesium-weir/`,
and a commission to build.

## Testing while in momentum

A UL-inspired certification idea. The name is inspiration; nothing here claims any connection
to, or standing with, a real certification body.

| Idea | In this repo |
|---|---|
| The standard | The PR template, the Ethics Check and the Sense Check |
| The tests | Stations: scan, review packet, Codacy gate, DeepSource, oversight run |
| The mark | The `finalized` and `witnessed` labels, plus the PR Journey |
| Re-examination after a change | `renovata` |

**A station contract** is the socket the future testing facility plugs into: input is the PR's
head commit; output is pass, fail or needs-shepherd with one line of report; plus its cost
class (free or paid) and the cue that calls it. Draft for the Shepherd to confirm.

Ready to hand off now as the first in-momentum run: KAN-5, after #468 merges. It is
mechanical, has a clear check, and the road from build to `ultima recensio` can be recorded.

Still to build before the test means much, in order of value:

1. ~~`cue-parser.js` learns `refice`, `semina`, `sustine`, with test rows.~~ Done 202610310011 UTC.
2. The seal gate reads `held`.
3. `probatio` dispatches `final-review.yml`.
4. The station contract, written down.
5. The Shepherd's decision on #468.

## Log

- 202610190754: page started. Threads 1 to 13 seeded from the conversation of 2026-10-19.
- 202610310011 UTC: the Shepherd asked for build item 1. Parser, 8 test rows, cue record and quick reference updated. `sustine` still sets no label. Shepherd's note: three devices now (mulberry Windows, unexusiam Ubuntu, primapixel Pixel 8a); a Jira-first journey is opening.
- 202610310011 UTC: liminal opened for the Jira-first journey: `.shepherd/liminal-jira-202610310011.md`.
- 202610310146 UTC: the Shepherd's review comments on PR 471 read. Added threads 14 to 17, candidate 6, KAN-8.
- 202610310300 UTC: connector experts moved to a seed in `.shadow-well/`, as the Shepherd asked. Liminal keeps a pointer.
- 202610310315 UTC: the Shepherd's note on the antigravity handoff read. `.antigravity/` created with a README and a semina.
- 202610310324 UTC: stamp-on-submit built after the Shepherd chose option 1; 22 checks pass; not merged.
- 202610310612 UTC: four open review threads on PR 471 answered: Latin naming deferred to the 3/3 plank, Discord as the first harmony with navigo_gemini-notebook as a report hub, the connector experts seed moved to the atelier with an advisement left behind, and a reference convention noted (a conversation's title is enough).
- 202610310613 UTC: seeds filed for the queen, content risk level, balance and pressure, a conversation tracker and a system email. Atelier made the default workshop.
