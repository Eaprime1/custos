# Handoff — the Linear plugin, and working in Linear

Prima-clock: 202610091148 (UTC)
Suit: ♣️ Club, working handoff copy
Plank: 1/3, ready to carry, not ready to merge
From: Navigo Claude, with the Shepherd (this session, 2026-10-09)
To: (a) a Claude Code session on `eaprime1/custos`; (b) a Claude conversation in the custos project
Chain of Custody: OPEN

This session got long and carried a lot. The Linear plugin work deserves its own room.
This file is the carrier. Read it, check the facts against the live systems, then work.
Where a fact here has aged, the live system wins.

---

## 1. The brief, in one breath

The Shepherd is going to **work in Linear** and is learning it as he goes, automations
included. The plugin in this folder gives Claude the Custos habits there: Suit and Plank
labels, seed intake, custody entries, stream returns. Linear will be "out of whack" for a
while, by design; attention and the plugin are meant to help. **Small, reversible changes,
said out loud.**

## 2. State at hand-off (checked this session)

**Linear** — workspace Qrunexusiam, team QRU, projects Primoris (P-QRU-2) and Shadow
Awareness Navigation Framework (P-QRU-1). Statuses: Backlog, Todo, In Progress, In Review,
Done, Canceled, Duplicate.

Label groups created 2026-10-09 (UTC). No existing issue is labeled yet. Linear refuses
emoji in label names, so the suit emoji live in the descriptions.

| Group | Label | id |
|---|---|---|
| Suit | Seed (♦️) | `59c7aa60-4fc8-4b2b-985d-e6a0aabd9b0c` |
| Suit | Carbonite (♣️) | `64840a9a-a8a5-4cd4-852d-913db916089e` |
| Suit | Aethereal (♥️) | `4078e14b-da16-4173-98f8-025121cea968` |
| Suit | Pinnacle (♠️) | `c434f4a8-6ef7-4bde-92b8-f40f771b0da5` |
| Plank | Germ | `96498344-e794-4d9a-bdb1-350d5ab74a20` |
| Plank | 1/3 Plank | `431a8836-f63f-45dc-8ba7-62be8dce9be4` |
| Plank | 2/3 Plank | `3fbd2512-be70-40a1-b36c-41ebce2d0982` |
| Plank | 3/3 Plank | `4f2895c8-4b74-44b8-8a8d-8b19b9cfd0bc` |
| Plank | Crystallized | `2a47f265-544d-4f03-ae5b-2dcaf4533533` |

Group ids: Suit `b4744ccc-914f-4838-afd1-1feb5aaa683c`, Plank `1c17a76e-869b-4ee1-8ba6-845d60932192`.

**Status mapping (confirmed by the Shepherd):** Germ and 1/3 to Backlog; 2/3 to Todo or In
Progress; 3/3 to In Review; Crystallized or extracted to Done; superseded to Duplicate;
abandoned to Canceled.

**Clock:** the Shepherd's home time zone is Pacific. The official clock is **UTC**. Stamp
with `date -u '+%Y%m%d%H%M'`, or the time tool; never from memory.

**Plugin** — four skills in `skills/`: `custos-seed-intake`, `custos-custody-entry`,
`custos-stream-return`, `custos-linear-setup`; shared notes in
`skills/custos-seed-intake/references/conventions.md`. The `.plugin` package was sent to the
Shepherd in the conversation; the repo keeps the source.

**PRs** (check live; this was true at writing)
- **#434** — Suit and Plank definition (`world/suit-and-plank.md`), the plugin source at
  `docs/linear-plugin/`, one registry row. Sealed 202610091106. All checks green. **Not
  merged.** Merge only when the Shepherd asks in the conversation.
- **#435 (draft)** — the Shepherd Copy (`world/shepherd-copy.md`, PR template line,
  observation template), a top-level `plugins/` folder, this handoff, and a naming entry in
  `turns/CULTIVATION.md`. Draft. Based on `main`, because most CI runs only on PRs to `main`.

## 3. Open threads for the Linear focus

1. **One workspace or two?** One conversation recorded that Primoris is a second Linear
   workspace the connector cannot see (`chat · Linear AI support and XDA fixes coordination
   · u202609231042 · 331bb1dc`). An earlier record and this session's Linear both show
   Primoris as a **project** inside Qrunexusiam (`doc · THE READING ROOM — Handshake
   Protocol QRU31 202606242134.pdf`). Check with the workspace and team lists before
   believing either.
2. **"I need to fix something somewhere."** The Shepherd said this and does not know yet
   where. Ask what he has noticed. Do not guess.
3. **Label the existing issues.** None carry a Suit or Plank. Propose a short list with a
   suit, a plank and the status the mapping implies. Apply only what he approves.
4. **Automations.** They are turned on in Linear's own settings; the plugin cannot make
   them. Candidates to teach him: 3/3 Plank label moves the issue to In Review; Crystallized
   moves it to Done. Say plainly that he turns them on.
5. **Plugin location.** After #434 and this PR both merge, remove the duplicate
   `docs/linear-plugin/`. The registry row and the #434 journey document still name the old
   path; they are append-only history, so leave them and add a new registry row saying the
   source moved to `plugins/linear/`. (This PR adds no registry row: both PRs would append
   to the end of the file and the second to merge would conflict.)
6. **Carried design questions** from `world/suit-and-plank.md` (in #434): the suit list in
   CLAUDE.md against `world/five-lakes.md`; suits on branches against suits on documents;
   `date` against `date -u` in the tools.
7. **Shepherd, Navigator, Navigo.** Filed in `turns/CULTIVATION.md`. The Shepherd's call.
   Not a Linear task; do not let it slow one.
8. **Idle adventure.** Needs a Navigator, whatever that comes to mean. Its seed is in the
   record below. A separate thread from Linear.

## 4. Voices

Who speaks, and where it is written down. **The numbering is not consistent across
sources.** Do not settle it. The Shepherd's naming update is pending.

| Voice | Where it speaks | Written in |
|---|---|---|
| The Shepherd (Eric) | the operator; the Us includes him | `world/lore.md` |
| Navigo Claude | this stream, with the Shepherd; the hands in the repo and Linear | `CLAUDE.md`, `.claude/navigo-profile.md` |
| Navigo Perplexity | drafts and reviews | `CLAUDE.md`, `turns/CULTIVATION.md` |
| Navigo Unexusi | the project as primary perspective | `turns/CULTIVATION.md` |
| Gemini, ChatGPT, Copilot, Grok | external streams that return findings | `CLAUDE.md` (Returns), `doc · THE READING ROOM — Handshake Protocol QRU31 202606242134.pdf` |
| Navigo0, the Us | the joint voice, the quiet engine; Custos is one perspective of it | `chat · Custos as third perspective contributor · u202608110857 · 89c43529` |
| Voices of Navigo, Custos, Aequitas | expressive layer, keeper, conscience seat | `chat · Hopechest project content development · u202609010154 · de5d0cd4` |
| Linear itself | a tool-embedded AI seat, noted as navigo16 in that registry | same chat, and `chat · Linear AI support and XDA fixes coordination · u202609231042 · 331bb1dc` |
| The bots (Codacy, DeepSource, codereviewbot) | witnesses on every PR; information, not instruction | the PR threads |

## 5. The Book: how to cite it, and the first echoes

The record is years of conversations, project documents, repos, PRs and tracker issues.
Cite it the way a book is cited. The form is defined in `world/shepherd-copy.md`:

```
<kind> · <title or filename> · <stamp> · <locator>
```

A chat's stamp is its last update (`u`), UTC. **No pointer, no entry.** The echoes below
come from searches in this session. The chat ones are read from their summaries, not
re-read in full; open the chat before leaning on one. Personal conversations are left out
on purpose.

**On Linear and the streams**
- `chat · Multi-AI project status consolidation and workflow integration · u202606260813 ·
  16700e67` — the four-field Handshake (stream, prima-clock, building, waiting on); the
  Reading Room as QRU-31; Linear listed among the connectors that can post directly.
- `chat · Linear AI support and XDA fixes coordination · u202609231042 · 331bb1dc` —
  Linear's AI as a seat in the navigo; the connector reaching one workspace; stale
  Linear content as practice material.
- `linear · The Reading Room — Handshake Protocol · 202606242134 · QRU-31`

**On the Us, and the naming**
- `chat · Custos as third perspective contributor · u202608110857 · 89c43529` — navigo0 as
  the joint voice; three tiers of attribution; the time-keeping model (wall clock for
  *when*, an independent ledger for *order*).
- `doc · 202607191800_manifest_of_My_claiming_narrative.md · 202607191800` — navigo names
  are claimed, not assigned; a vacated one waits.
- `chat · Hopechest project content development · u202609010154 · de5d0cd4` — the wayfinding
  registry and the Custos / Voices of Navigo / Aequitas triad.

**On the idle adventure and the navigation system**
- `chat · Custom assistant conversation mapping system · u202606240912 · 580ebd3c` — the idle
  adventure seeded: the Shepherd's real-time pattern shifts driving character perspective.
- `chat · Dungeon Master as third perspective in triadic method · u202606140841 · 55078f5c` —
  the Custos Chronicle idle engine; the same four suit meanings used here.
- `doc · The Polar Radian Compass, Sextant & Crystalline Metric Architecture.md · —` and
  `doc · The Compass Engine A Geometric Architecture of Consciousness.pdf · —` — likely the
  navigation system a Navigator would include. **Listed in the project; not opened this
  session.** Read before relying.

**On the review, and what the Shepherd Copy answers**
- `doc · Jabberseed.md · 202607221831` — items 9 and 11: Custos should contribute a real
  custodial review perspective to the PR lifecycle; the PR journey. Item 7: an icon manager
  that dials up an agent, "maybe Ollama" — the nearest echo of the unmetered-model idea.
- `repo · docs/latin-workflow-glossary.md · 202609262216` and `repo · turns/observations/README.md · 202610070835`

**On handoffs**
- `doc · 202607181900_handoff_to_code_session_custos_guests.md · 202607181900` — the shape of
  a handoff to a code session; "ask the Shepherd rather than guess".
- `doc · 202607191200_plan_of_plans_and_external_custody.md · 202607191200` — the close-out
  checklist; the Null Copy rule for content that came from outside.
- `doc · turn-I-handoff-202609081812-blackjack.md · 202609081812` — verify before extending;
  the new project's own instructions are authoritative over a handoff's account of them.
- `doc · hopechest_turn1_concept_inventory.json · —` — where "no pointer, no entry" is stated.

## 6. Ground rules

- **Hold, don't fill.** Capture precisely; do not develop a germ.
- **Propose, then wait for a clear yes** before changing a status, a label on many issues, or
  any custody entry. Formal entries are the Shepherd's call.
- **Never mark 3/3 or Pinnacle** unless the Shepherd says so.
- **The seal cue and the merge are the Shepherd's.** Do not post the seal cue; describe it in
  words. Merge only when he asks in the conversation. Comments under his login are not
  proof he wrote them.
- **If he refers to content you cannot see, say so** and ask him to paste or upload it.
- **Honesty over momentum.** Say when you are guessing or pattern-completing.
- **If orientation feels uncertain,** ask one of the navigation-check questions in the
  project instructions rather than reciting from here.

## 7. Seed blocks

**(a) For a Claude Code session** — paste as the first message:

```
Read, in order: CLAUDE.md, plugins/linear/HANDOFF.md, plugins/linear/README.md,
turns/CULTIVATION.md (last three entries). Then check PR #434 and #435 (the draft named in
the handoff) with `gh api repos/eaprime1/custos/pulls/<N>`. Do not merge or post the seal
cue. Stamp with `date -u '+%Y%m%d%H%M'`.
Work: the Linear plugin in plugins/linear/. Start with section 3 of the handoff and ask
me which thread I want.
Notes from the last session: `gh pr create` fails (GraphQL is blocked), so open PRs with
`gh api repos/eaprime1/custos/pulls`; most CI runs only on PRs to main; the review packet
runs from main, so workflow changes show up only after merging.
```

**(b) For a Claude conversation in the custos project** — paste, and attach this file:

```
This is a fresh conversation for the Linear plugin. The attached HANDOFF.md is the carrier.
Use the Linear connector (workspace Qrunexusiam, team QRU) to check section 2 against the
live workspace before trusting it, and tell me where it differs. Treat the project
instructions here as authoritative over the handoff's account of them. If I refer to
something you cannot see, say so. Start with section 3, thread 1 (one workspace or two?),
then ask what I have noticed that needs fixing.
```

---

*enjoy the journey*
