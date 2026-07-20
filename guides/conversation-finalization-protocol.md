# The Conversation Finalization Protocol

*Taking the bill apart until you find the story inside it.*

`suit: ♦️ Diamond — protocol, structure forming`
`prima-clock: 202607090827`

---

## Why This Exists

Conversations accumulate faster than they can be closed. Each one is a session
inside a podium — Claude Code, ChatGPT, Gemini, a voice thread, an email chain —
and when that session ends, the context that drove it disappears unless something
was extracted.

The cost of not extracting: the seeds in those conversations become unplanted.
The decisions become unrecorded. The motion looks like it never happened.

This protocol formalizes the extraction step. It is for:

- Conversations that already ended without being properly closed
- Conversations that are still open but need checkpointing
- Batches of accumulated conversations that need processing at once

The output is a **Conversation Arc** — a single document that captures what the
conversation actually was, what it produced, and where its contents belong.

---

## The Distillation Principle

A large government bill has hundreds of provisions. But it has one story: what
it's actually trying to do, who it helps, what it changes, and what it leaves
unresolved.

Finding that story is the job. Not summarizing every section — finding the spine.

A conversation might be ten thousand words. Its Conversation Arc might be two
hundred. The two hundred words are not a loss of the ten thousand. They are the
extraction of what the ten thousand were building toward.

**The thread is always there. The work is finding it.**

---

## The Protocol — Seven Steps

### Step 1 — Locate

Get the conversation. Export, paste, summary, screenshot, memory. It doesn't
need to be perfect — a rough reconstruction is better than nothing. If you have
multiple conversations on the same topic, treat them as one arc if they share a
thread; separate arcs if they don't.

### Step 2 — Thread

Read the whole thing without writing anything. Ask:

> *What was this conversation actually about? If I had to name the one thing
> moving underneath all the words, what would I call it?*

Don't answer yet. Just hold the question.

### Step 3 — Motion

List what *moved*. Not what was discussed — what **changed**:

- Decisions made
- Concepts named for the first time
- Positions taken or shifted
- Seeds planted
- Files or artifacts produced
- Problems identified (even if not solved)

Motion is evidence of the thread. If something moved, it's because the thread
was pulling it.

### Step 4 — Seeds

From the motion, extract anything that wants a life in the system. Ask each item:

- **Atelier?** — concept without a name yet, or newly named; not ready for
  formal custody
- **Pre-nullus?** — arriving from outside, not yet placed; needs eaprime1
  confirmation before vault
- **World-state?** — a fact about the system that should be recorded in
  `world-state.json`
- **Prima-clock?** — a dated event in the formal ledger
- **Nowhere yet?** — hold it, mark it open; don't force it

### Step 5 — Story

Write **The Thread**. One to three paragraphs. Present tense or simple past —
whichever feels true.

Rules:
- No transcript. The story, not the record.
- If you need more than three paragraphs, the thread isn't found yet.
- Name what actually moved, not what was said.
- Unresolved things can appear — but as open threads, not as confusion.

### Step 6 — File

Route each seed to its destination. Create the files or add the entries. Don't
skip this step — a Conversation Arc with seeds sitting in "Seeds Extracted" and
nothing in "Filed To" hasn't actually closed.

If a seed's destination is genuinely unknown: `atelier/`, suit ♦️, plank 0/3.

### Step 7 — Stamp

Assign a suit. Stamp the prima-clock. Set the chain of custody.

| Suit | When to use |
|------|-------------|
| ♦️ Diamond | Conversation produced seeds; structure forming |
| ♣️ Club | Session / operation type; episodic, no persistent seed |
| ♥️ Heart | Something alive and running came out of this |
| ♠️ Spade | Vault-quality; permanent artifact produced |

Most conversations are ♦️ Diamond or ♣️ Club.

**Chain of custody:**
- `CLOSED` — all seeds filed, nothing outstanding
- `OPEN-[reason]` — something remains (seed without destination, question
  without answer)

`OPEN` is a valid outcome. A Conversation Arc marked `OPEN-routing-pending` is
still a Conversation Arc. It has a place now.

---

## Output Location

Finalized Conversation Arcs live in:

```
dungeon-master/conversations/[YYYYMMDDHHMM]_[slug].md
```

Use the conversation's start timestamp if known. Use the finalization timestamp
if not. Slug is 2–4 words, hyphenated, lowercase — the name of the thread, not
the date.

Template: `dungeon-master/narrative-engine/conversation-template.md`

---

## Batch Processing

When working through a backlog:

1. **Order by earliest first** when possible — later conversations often
   reference earlier ones
2. **Extract first, file second** — don't try to decide every seed in one pass;
   get the arcs written, then route
3. A Conversation Arc with `OPEN` is still finalized — it has a place now
4. **Two entangled conversations** that can't be separated: merge them into one
   arc, note the merge
5. If you can't locate the full conversation, write from memory or from
   artifacts — whatever exists is enough to build the arc from

---

## Relationship to Other Systems

| System | Relationship |
|--------|-------------|
| `turns/log.md` | One turn log entry per session; the Conversation Arc is deeper |
| `turns/CLOSING.md` | That's for live sessions closing now; this is for retroactive processing |
| `dungeon-master/chronicles/` | Chronicles are for PR/branch arcs; Conversation Arcs are for conversation arcs |
| `atelier/` | Where seeds from Conversation Arcs often land first |
| `prima-clock/registry.md` | Significant conversation events get a registry row |

---

## What This Is Not

- Not a transcript archive — those live elsewhere if kept at all
- Not a journal — the arc is about motion and seeds, not reflection
- Not a verdict — conversations with ambiguous outcomes don't need resolution forced
- Not a completion trap — `OPEN` is correct when something is open

---

*One Nth radian per turn. Honest. Directional. Willing.*
