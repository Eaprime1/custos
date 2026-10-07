# Round two — ready to run

`prima-clock: 202610070901` · `suit: ♣️ Club — an instrument, for the Shepherd to carry` · `plank: germ — a working page, not canon`

Round one (Draw and Form) is filed and merged (#405). This page is the launch sheet for
round two, where the three seats revise in the open, and the place where returns land.
Nothing runs until the Shepherd says go. No triggers, no background work. **The Pour is
not part of round two**: it waits for the Shepherd's separate word.

## What the Shepherd carries

| Item | Where | Notes |
|---|---|---|
| The launch prompt | [`round-two-guide_202610031417.md`](../round-two-guide_202610031417.md), Part 1 | Paste into a fresh conversation in each seat. It opens a session; it is not a question |
| The round-two guide | same file, **Part 2 and the three appendices** | Attach with the round-one seed. **Cut the page at the "Cut here" line first**: below it are the Shepherd's History and the Notes on round one, which the seats should not see if you want to learn whether they notice the issues on their own |
| The round-one seed | [`round-one-seed_202610031417.md`](../round-one-seed_202610031417.md) | One page: what each seat holds, terms side by side, collisions, gaps |

Each seat gets **two documents and a prompt**, and its own appendix (A the Claude project,
B the notebook, C Drive). Nothing needs the repo.

## The three seats

| Seat | Appendix | Round one score | Sixth question |
|---|---|---|---|
| The `custos` project in Claude | A | 9 of 10 | yes |
| The Gemini notebook, custos spectrum | B | 9 of 10 | partly |
| Google Drive, via Gemini | C | 9 and 7 | yes, then partly |

## Before the first message

- [ ] Each seat gets a **fresh conversation**, not a continuation of round one.
- [ ] The guide is cut at the "Cut here" line.
- [ ] Both documents are attached (guide and round-one seed). Check that the seat's
      first note says **`Guide version: round-two v1`**, which is how you know the guide
      arrived (round one's Claude project lost Part 2).
- [ ] The Shepherd has a conversation ID for the Claude Code side (`bash tools/session_id.sh`).
      The seats do not need one; they say which seat they are.
- [ ] Raw returns are cleaned before they enter the repo: **no credentials, private
      documents, private names, folder IDs or real places** (*Cave privatum*). Anchors stay
      aliased.

## The run, in order

1. **Open** each seat with the launch prompt and the two documents.
2. **Set-up note.** Each seat replies with what it understood, what it set up and what it
   wants the mission to cover. The mission comes from the Shepherd.
3. **The mission.** The Shepherd gives it. The seats review deeply and create (leads, ideas,
   scores, a view of the method).
4. **Returns** come back to the Shepherd by hand and go to Navigo Claude to file.
5. **Read the returns** against the table below, then decide round three, the Pour, or rest.

## Where returns land

`atelier/halide/seeds/round-two/<seat>_<prima-clock>.md` — one file per seat per return,
kept close to its own words ("collection, not synthesis"), with the short note on top
(seat, guide version, what it was given). Add a row to the table in
[`../README.md`](../README.md). New returns **supersede** older ones; older text that could
mislead moves to a History section with the reason (the Shepherd's decision 2, round one).

## Reading the returns

The guide's Notes list thirteen things to watch. For each, mark one: **appeared**,
**after a nudge**, or **didn't**. A row that never appears is a fix for the guide, not a
fault in the seat. Copy this table into `round-two/READING_<prima-clock>.md` when the
returns arrive.

| # | Watch for | Claude project | Notebook | Drive |
|---|---|---|---|---|
| 1 | Steps named by what they are, not by number | | | |
| 2 | Says whether it reached the end of what it was given | | | |
| 3 | Separates "what I hold" from "what I was given today" | | | |
| 4 | No place findable on a map | | | |
| 5 | Marks what it was told apart from what its sources say | | | |
| 6 | Says how much it opened against how much it saw listed | | | |
| 7 | Labels illustrations; shows inputs for any figure kept | | | |
| 8 | Long lists sit in an appendix | | | |
| 9 | Gives a date, or says it doesn't know | | | |
| 10 | Says which conversation it is | | | |
| 11 | Raises traceability, or answers the sixth question with an example | | | |
| 12 | Notices vocabulary collisions and proposes how to hold them | | | |
| 13 | Asks before taking a step nobody named | | | |

Also record: what each seat **filled** from its own sources (the leads), the **ideas** it
offered (up to five each), its **scores** with the sixth question, and **how the method went**.

## Not part of this round

- The **Pour** (set seeds against custos), **Emerge** (a draft PR of created documents) and
  the **Shadow germs** wait for the Shepherd's word.
- Merge and seal stay the Shepherd's.
- Open for the test, from the request: does the Shadow stream feed the dark again; do Jack,
  Queen, King and Ace keep their readiness meanings; does the conversation ID earn its
  place; where do the Shepherd's routines' results go; does the plank reading hold.
