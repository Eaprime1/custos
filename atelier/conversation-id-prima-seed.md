# Conversation ID, prima version (seed)

`prima-clock: 202610310800` (UTC)
`plank germ` · a first gather and a proposal, not developed · origin: the Shepherd, chat `set-jmdfqh`, 2026-10-31

*Grows by addition. New material goes under "Added later" with a stamp.*

## What he asked

A conversation id has become a necessity. Gather what the project already says about it, from the Gemini
Drive and notebook seats, the Claude project seats, hopechest and custos, and make a prima version. The sign-in
idea in NEXUS-1 is one every voice can do. Notebook voices cannot write to GitHub, so they need a feeder.

## What was read

| Source | What it gives | Status |
|---|---|---|
| `tools/session_id.sh` (custos, with 29 checks) | The id format: `<type>-<6 chars>`, type is `exp`, `set`, `con` or `oth`. No time stamp on purpose. Prints the first line to paste: `Session: <id> · type: <type>`. | Built |
| `docs/plans/202610070939-cue-sigil-and-living-observation-plan.md` | The id rides in a cue: `^<navigo> [<id>] <cue words>`. Observation template gets a Conversation ID line. | Plan only, and its own "what was missed" says the line is not there |
| `device/podiums.md`, `device/CONVERSATION_LAUNCH_TEMPLATE.md`, NEXUS-1 | A `conversation_id` field per podium. Filled with the platform's own raw id (`session_...`), blank for devices. The launch template is the sign-in. | Built, used by hand |
| `docs/navigo-registry.md` | Navigo key `nx-<model>-<instance>`: names a seat that lasts. | Draft, keys are proposals |
| `.claude/threads.md` | Thread ids `T01`..`T12`: open streams that outlive a PR. | Built |
| `.claude/conversations.md` (PR 471) | Tracker keyed by title; an id is optional. | Germ |
| Drive: "The Conversation Continuum" (Perplexity export, 2026-10-28, version 2.0) | A lifecycle for a conversation. Stage I lists the metadata a conversation needs, and the first item is a Conversation ID. Seed JSON carries `source_conversation: conversation_id`. | Proposed, awaiting review, **not in the repo** |
| Drive: "finish-the-conversation-procedure" (PDF) and `conversation_collapse_engine.py` | The older procedure the Continuum revises, and a script for it. | In Drive; the procedure is referenced in the repo, the script is not |
| Halide seeds (Drive Gemini seat, Claude project seat, Gemini notebook seat) | Mention an 11-character "Quantum Runic ID" from a Genesis Identity Crystallizer. | Seen in one seat only. Not in the repo. Not adopted. |

Not read: the Claude project's own files and the Gemini notebook's sources. Only their halide seeds were
read, which say they reached their sources unevenly. Nothing here was checked inside those seats.

## What is already true

- The id format exists, is tested, and is already what the cue-sigil plan expects. **A prima version should keep it.**
- 32 characters are used in the tail (`a-h j k m n p-z 2-9`), six long: about 1.07 billion ids. Two ids
  colliding by chance is not a practical worry, so uniqueness does not need a shared ledger.
- The ledger `.claude/session-ids.md` is opt-in and was never created on any branch. Two branches that append to
  one file conflict on merge, and `.claude/halide-test-request.md` already says to skip it.
- Different things have different jobs and none of them is a conversation id:

| Name | Identifies | Lasts |
|---|---|---|
| cid, e.g. `set-jmdfqh` | one conversation | forever, never reused |
| navigo key, e.g. `nx-claude-main` | a seat | forever, never reused |
| `podium_id` | a place work happens from | while the place exists |
| `T01`.. | an open thread | until resolved |
| `KAN-9`, `NEXUS-1` | a Jira record | in Jira |
| prima-clock | a moment | a moment |
| platform ref, e.g. `session_01...` | the platform's own handle for the chat | as long as the platform keeps it; may be private |

## The gaps

1. Nothing joins them. The cid is in no tracker, no podium entry, no observation, no Jira ticket.
2. A platform ref cannot be the id: private chats and notebooks often have none. The cid has to be minted by us.
3. Notebook voices cannot run the script or write to GitHub. They need an id handed to them, and a way to send
   their output in.
4. The Continuum names a Conversation ID but never says how it is made. The format above answers that.
5. The Continuum is only in Drive, and it is about conversations, so it is a good first thing to send through a feeder.

## The prima version (proposal)

**1. The id is the one that exists.** `bash tools/session_id.sh --auto <type>`. A voice that cannot run it uses a
hand-made id (`--set`), or the Shepherd hands one over. The id goes in the conversation title and on its first line.

**2. A sign-in card, written once.** This is the NEXUS-1 sign-in. Six lines; the podium block already has most of them.

```
cid:      set-jmdfqh        minted, never derived
title:    all things Jira
key:      nx-claude-main    the seat, from docs/navigo-registry.md
platform: claude.ai/code    free text
ref:      ""                the platform's own id or link, optional, may be private
minted:   202610310800      UTC prima-clock
```

Risk level is left out on purpose: it waits for the KAN-10 seed, and until that exists the strictest reading applies.

**3. One place to point at.** `.claude/conversations.md` stays the Shepherd's pointer: the cid goes in front of the
title, `set-jmdfqh · all things Jira`. For voices that have nowhere to write, the sign-in card travels with the
feed (below). The podium `conversation_id` field keeps holding the platform's raw id; the cid goes beside it.

**4. Jira reads it the way it already reads podiums.** NEXUS-4 carries the label `podium:primapixel`. A label
`conv:set-jmdfqh` on a ticket says which conversation touched it. Held for KAN-6 (the label vocabulary).

**5. Cue and observation.** The cue form `^<navigo> [<cid>] <cue>` and a Conversation ID line in the observation
template are already planned. They stay planned; this seed does not build them.

## The feeder (proposal)

For voices that cannot reach GitHub, the Gemini notebooks first.

- **Drop:** the Shepherd exports the notebook to a Google Doc and saves it into one Drive folder (to be made).
- **Courier:** a navigo with Drive access reads the folder and files it by pull request. Navigo ChatGPT has done most
  of this so far. A Claude session with the Drive connector can do it too.
- **Arrival:** in the repo the files land where `.gemini/README.md` already says raw exports land first.
  File name `<prima-clock>_<cid>_<slug>.md`, and one sign-in card at the top. The cid in the name is what ties the file back to its conversation.
- **First test:** "The Conversation Continuum", since it is the document about this.

Nothing here makes a folder yet.

## Where it starts in Jira

NEXUS-1 says it holds review and decision records, not implementation. Two fits:

- **A child Task under NEXUS-1** recording this review and the decision on the proposal. NEXUS-1 can move it later.
- **Its own build home** (a KAN Epic beside KAN-8 and KAN-9) once the Shepherd says build.

Recommendation: the child Task now, the Epic when there is something to build.

## Not known

- Whether the Continuum's full metadata list (platform, author, destination, privacy class, hash) belongs on the
  card, or stays with the Continuum until it is reviewed.
- Whether the Quantum Runic ID is a real part of the system or a story one seat told itself. The halide seeds already ask.
- Whether any notebook can print a cid in its export on its own, or the Shepherd always pastes it.

## Added later

(nothing yet)
