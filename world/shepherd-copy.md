# Shepherd Copy

Prima-clock: 202610091148 (UTC)
Suit: ♦️ Seed
Plank: Germ
Status: proposal for Deck Master review. Nothing here is binding until the Shepherd says so.

*The Shepherd reads the work. The work should be good to read.*

---

## Why

The Shepherd reads what arrives, to keep track of where things are going, and because
reading brings ideas, connections and additions that no check can supply. Reading time is
the cost. The answer is not to read less. The answer is to make the reading good.

A diff is a poor place to read prose. A Shepherd Copy is a better one.

## What it is

A **Shepherd Copy** is a reading Carbonite of one PR, made for the Shepherd. It is not a
summary that replaces the files. It is a path through them: what arrived, in what order
to read it, and where the Shepherd's own thoughts go.

It is written from the **Us** perspective: yours, mine, the project's. Where the work was
shared, "we". Where the navigo made a call, "I". Where the Shepherd decides, "you". It
names who made each piece (human, AI, outside contributor), and it does not invent
history: anything claimed as having happened has an anchor, or is marked proposal.

## Where it lives

As a section of the PR's observation document,
`turns/observations/<prima-clock>_pr<N>_observation.md`. The observation is already opened
at *Prima Recensio* and finished with the Shepherd, so the Shepherd Copy rides the same
step. The PR description carries a `## Shepherd Copy` line that points to it (or says
`pending`). No new folder and no new workflow: the cue record already ticks the
`observed` box when the document is on the head commit.

## Its four parts

1. **Arrived.** A short reading, in plain prose, of what came in and why it matters.
2. **Reading path.** The files in the order worth reading them, one line each: what it is,
   why read it, how long it takes.
3. **Margin.** Left open for the Shepherd: ideas, connections, additions. The navigo does
   not fill it. What lands there goes to a seed, a Linear issue or the next PR on the
   Shepherd's word.
4. **Echoes.** Where the work touches the Book (below), cited so it can be found again.

## The Book, and how to cite it

The project's record is not one repo. It is years of conversations, project documents,
repos, PRs and tracker issues: a book with thousands of pages and several voices. Cite it
the way a book is cited, so a later reader can find the page:

```
<kind> · <title or filename> · <stamp> · <locator>
```

- **kind:** `chat`, `doc`, `repo`, `pr`, `linear`
- **stamp:** a prima-clock stamp in UTC. For a chat the stamp is its last update (`u`),
  because that is what the search shows; the stamp of creation is not always known.
- **locator:** the first eight characters of a chat id, a path in a repo, a PR number, an
  issue key.

Example: `chat · Custos as third perspective contributor · u202608110857 · 89c43529`

An echo says what the source holds in one line and nothing more. **No pointer, no entry:**
an echo without a source the reader can open is a rumor, and is left out. Where a chat is
personal, cite the project document it fed, not the chat.

## Required, or advisory

**Advisory for now.** The PR template carries the line. The review packet shows whether the
PR description has the section. Whether the seal should refuse without a Shepherd Copy is
the Deck Master's call, the same open question as the observation (see
`turns/CULTIVATION.md`).

## What it is not

- Not a seal, a review or a merge. Those stay as they are.
- Not a substitute for reading what matters. It points to the reading.
- Not a model call in CI. The packet calls no model, and this changes nothing there.

## Not built, kept in view

A high-limit or unmetered model (a local one such as ollama) could draft the reading path
so the navigo's conversation is not the only place it can be made. Not built. The nearest
standing echo is the icon manager idea in the Jabber pass: a workflow that "dials up" an
agent, sends the data, validates the answer and ends the session
(`doc · Jabberseed.md · 202607221831`). Other options were explored earlier; any trigger
needs an unambiguous owner signal and a test on real comments, as the Latin workflow
glossary already says.

## Open

- **Shepherd, Navigator and Navigo.** Three words from one family, with a live naming
  review under way. Filed in `turns/CULTIVATION.md`; not decided here.
- **Review tiers.** An earlier idea sorted PRs by risk so the Shepherd could skim some.
  The Shepherd reads the work, so the idea is parked, not adopted.
- **Where a Shepherd Copy goes after the merge.** It stays in `turns/observations/`,
  append-only once complete. Whether it also feeds `pr-journeys/` is not decided.
