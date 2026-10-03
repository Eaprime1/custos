# Halide Test Request — test and refine

`suit: ♣️ Club — an active working event`
`prima-clock: 202610022352`
`session anchor: 202610021614 (the Shepherd's clock)`
`plank: 1/3 — named, not yet tested. Not canon.`
`status: OPEN`
`for: a Claude Code conversation acting as Navigo Claude`

A request to run the halide process once, by hand, with real material, and report
what held and what did not. The Shepherd drives every step. **No triggers** in this
test: no scheduled routines, no PR watching, no automatic cues. Once the pattern is
clear, the trigger process gets added on top.

---

## Before the First Step

This sits outside the process, like an end cap. Do it first, before anything else:

1. **Get a conversation ID.** Run `bash tools/session_id.sh` (a small menu; you can
   also type an ID of your own), or `bash tools/session_id.sh --auto <type>`. Or ask
   the Shepherd for one.
2. **Pick the type:** `explore`, `setup`, `consider` or `other`. This test is
   `setup` unless the Shepherd says otherwise.
3. **Open your first reply with these lines:**

```
Session: <id> · type: <type>
Role: Navigo Claude, code conversation
Carrying: .claude/halide-test-request.md
```

The ID has no time stamp on purpose. It exists before the process, and so before the
prima-clock. It is not a navigo key (`docs/navigo-registry.md`): a key names a seat
that lasts, an ID names one conversation. Logging an ID to `.claude/session-ids.md`
is optional (`--log`); two branches that both append there will conflict on merge,
so skip it unless the Shepherd asks.

## Where We Are

`main` at `5934e6e`. What exists, and what does not:

| Exists | Where |
|---|---|
| The concept: a station in motion, three wells (dark, salt pan, lumen), seven wells held back | `atelier/halide/README.md`, `wells.md` |
| How a submission passes: draw, form, pour, emerge, shadow seeds | `atelier/halide/README.md` |
| A seed store: six drops, all from one key | `atelier/halide/trial-0.md` |
| The Shadow stream stub, with nothing filed | `atelier/halide/shadow-stream/README.md` |
| A Polaris seed and a cleaned sky photo | `atelier/halide/polaris-seed.md`, `sky/` |

**No deliberate pass has been run.** The concept is written; the process has not met
real material. One unplanned pass happened (PR #402 was formed and poured through
custos's review and seal), and it only fits the shape in hindsight. This request is
the first deliberate one.

## The Run

Each step waits for the Shepherd's word.

1. **Draw (the dark).** The Shepherd brings three perspectives. Write one **seed
   document** for each: what it holds, in its own words, with where it came from and
   what is not verified.
   - **The `custos` project in Claude:** the context that project carries.
   - **Google Drive, as a contributor:** material from Drive, brought the way an
     outside contributor would bring it.
   - **The Gemini notebook, custos spectrum:** what that notebook holds.

   These descriptions are the Shepherd's own. If a perspective has not arrived, say
   so and wait. Do not write it from guesswork.
2. **Form.** Combine the seeds into one **submission**: the seeds, and what the
   submission asks custos to do with them.
3. **Pour (the salt pan).** Read custos as it stands, and the current perspective.
   Set each seed against what is already there: what matches, what collides, what is
   new. One submission can develop **more than one concept**.
4. **Emerge (the lumen).** What is submitted to the repo is lumen: a draft PR with the
   documents created. The Shepherd seals and merges. You do neither.
5. **Shadow germs.** What is left over beyond the PR, the 1/3 pieces that the lumen
   makes visible, goes to the Shadow stream: one file per germ, or an addition to one
   that exists, in `atelier/halide/shadow-stream/`. The originator chooses an official working copy:
   a **Jack** (carries another's authority; append-only), a **Queen** (develop
   concepts from the seed) or a **King** (develop it as a whole). An *external*
   originator would also have the **Club Ace**, the official carbonite. The **Spade
   Ace** stays with the system.

## What to Hand Back

A short receipt, in the PR description and in the conversation:

- the session ID and type;
- each seed: where it came from, and what is not verified;
- the submission, in one paragraph;
- what changed in custos, with the PR link;
- the shadow germs, one line each, and which of them add to one that already exists;
- **what surprised you, and what did not fit.** This is the point of the test.

## Rules for This Test

- **Manual.** No schedules, no PR subscriptions, no background work. Say what you
  are about to do, do it, stop.
- **Merge and seal are the Shepherd's.** Only his words in the conversation.
- **The repo is public.** No credentials, no private documents, no places. Anchors
  are real places and stay in the background (`atelier/halide/README.md`, "Anchors Are
  Real Places"). Clean raw material before it enters.
- **Do not invent history.** Mark what is unverified. If you cannot see something the
  Shepherd mentions, say so and ask for it to be pasted.
- **Label plank states plainly** (table below), and treat the Shepherd's ideas as
  plank, sparkle, germ, not canon.

## To Test and Refine

Open in `atelier/halide/README.md`, plus what this request adds:

1. Does the Shadow stream feed the dark again, or stop there?
2. Do Jack, Queen, King and Ace keep their readiness meanings in
   `valuation/README.md`, or take the ones above?
3. Does the conversation ID earn its place at the front, and is the format right?
4. The Shepherd's routines already gather (email management and idea mining, a daily
   briefing) and their output is not landing anywhere. Are they dark feeds, and where
   do their results go? *Finishing a routine* is now a type of mission
   (`docs/mission-ideas.md`, item 10).
5. The plank reading below: does it hold in a real pass?

## The Plank, as the Repo Already Uses It

Checked against the files named. Where the Shepherd's reading adds to them, it is
marked.

| State | Meaning | Source |
|---|---|---|
| **3/0** | An undefined plank: it exists, the system knows it is there, and cannot yet compute its position | `atelier/unknown_void_arc.json` (`plank_system_connection`) |
| **0/3** (germ) | Pure germ: before any suit has claimed it | `incoming/pre-nullus/202606290000_joker-herald-fuel-loading.md` |
| **1/3** | Work | `.shadow-well/📜MOMENTUM_ARCHIVE_PERPETUAL_GATHERING_DOCUMENTS.md`; `valuation/five_lakes_valuation_bridge_202606112205.md` ("architecture named, not yet scripted") |
| **2/3** | Create; structure forming | the same archive; the joker-herald file |
| **3/3** | Play; ready for Prima Iteration | the same archive |
| **Pinnacle** | Crystallized; the Ace | `valuation/README.md` |
| **4/3** | Four progressions "in 4/3 synergy" | the momentum archive |
| **Open Joker** | Collapses germ to pinnacle in one motion: "a different transit type", not a bug | the joker-herald file |

**The Shepherd's reading (germ stage, 202610021614):** a plank is one whole, and cannot
naturally be more or less. The process has two end caps outside it.

- **Front cap, 3/0.** Undefined, which is a paradox. Its synergy resolves by
  **inversion** to 0/3: the undefined plank becomes a located germ.
- **Back cap, 4/3** (one and a third). More than one, which is a paradox. Its
  synergy resolves by **separation**: one (the plank completes) and a leftover 1/3.

Checked: 4/3 is 1 and 1/3, correct. Four thirds is one whole and a third left over,
the same as a carry in base three (4 is written 11). The inversion of 3/0 is 0/3 as a
swap of the two numbers, and as arithmetic it only holds on the *projective* number
line, where 3/0 is the point at infinity and its inverse is 0. In ordinary arithmetic
3/0 is undefined and so is its inverse. That matches the repo's own wording: 3/0 exists
but cannot be located, 0/3 is located.

**The Shepherd's refinement (202610030033):** many concepts use the plank system as a
**model**. The **lumen is the one**: what happens, the plank completing. The 1/3 left
over is a **shadow germ**, because we are in the shadow stream. It is **not a plank**:
a plank cannot be less than one, so it is a *piece* of plank, concept time happening.
What happens becomes a 1/3 germ, or adds to filling up one.

In practice: a document's stage (1/3, 2/3, 3/3) says where a whole plank stands. A
1/3 shadow germ is a different thing: a piece left over from a plank that finished.
(An earlier draft of this request called the leftover a plank at 1/3. That was wrong.)

---

*Before the first step is the end cap. The process starts when the ID is spoken.*
