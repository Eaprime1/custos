# Legatum

*Latin: a bequest, a thing left behind — the root of "legacy."*

`suit: ♦️ Diamond — concept named, structure forming`
`prima-clock: 202608220000`

---

## What a Legatum Is

A conversation ends. Its context does not persist — but its work should.
`guides/conversation-finalization-protocol.md` already solved this for
custos with the **Conversation Arc**: seven steps (Locate, Thread, Motion,
Seeds, Story, File, Stamp) that distill a conversation down to its spine
and file it at `dungeon-master/conversations/`.

A **Legatum** is the same discipline, aimed at a different destination.
Not every conversation belongs only to custos. Some conversations are
building toward a **Legacy** — a dedicated system for what a body of work
leaves behind, across repos, across devices, across the whole constellation
custos sits inside. That Legacy doesn't have its own repo yet. Until it
does, its seed material stages here, in the atelier — named, structured,
ready to move, but not yet permanently homed.

**A Legatum is a Conversation Arc that already knows it's headed
somewhere else.**

## Relationship to the Conversation Arc

Same distillation principle (find the spine, not a transcript). Same
section discipline — a Legatum carries:

- Prima-clock / Date Range / Title / Entities
- **The Thread** — the story, 1-3 paragraphs, not a transcript
- **Motion** — what actually changed
- **Seeds Extracted** — what wants a life beyond this conversation
- **Artifacts** — files, PRs, documents produced
- **Unresolved Threads** — named, not forced closed
- **Filed To** — where everything landed
- **Custody Receipt** — prima-clock, suit, entities, chain of custody

The difference is scope and destination, not method:

| | Conversation Arc | Legatum |
|---|---|---|
| Filed at | `dungeon-master/conversations/` | `atelier/legatum/` (until Legacy repo exists) |
| Belongs to | custos specifically | Legacy — a body of work spanning repos/devices |
| Use when | The conversation's story is custos's own history | The conversation's story is bigger than one repo — infrastructure, cross-repo pattern work, a session whose real subject is "how we work," not just "what we shipped" |

When in doubt: if the conversation only touched custos, write a
Conversation Arc. If it touched other repos, ported patterns between them,
or produced ideas meant to outlive any single repo — write a Legatum.

## Template

```markdown
# LEGATUM

## Prima-clock
[YYYYMMDDHHMM — conversation start, or finalization timestamp if start unknown]

## Date Range
[YYYYMMDDHHMM → YYYYMMDDHHMM — if the conversation spanned multiple sessions; omit if single]

## Title
[What this conversation was actually about — not what it started as, what it became]

## Entities
[eaprime1 + Claude/Gemini/ChatGPT/Copilot — model or session identifier if known]

## Repos Touched
[Every repo this conversation did durable work in — a Legatum's defining trait]

## The Thread
[The story. 1-3 paragraphs. Not a transcript. The spine.]

## Motion
[What changed: decisions made, concepts named, positions taken, seeds planted]

-

## Seeds Extracted
[What wants a life beyond this conversation — cross-reference Seed Weir entries
if applicable: queue/seed-weir/README.md]

-

## Artifacts
[Files, PRs, documents produced — across every repo touched]

-

## Unresolved Threads
[What was open when this conversation ended]

-

## Filed To
[Where each seed or artifact went]

-

## Custody Receipt
- Prima-clock: [YYYYMMDDHHMM]
- Suit: [♦️ Diamond / ♣️ Club / ♥️ Heart / ♠️ Spade] — [reason]
- Entities: [who was present]
- Chain of custody: [CLOSED | OPEN-reason]
```

## Filing

```
atelier/legatum/[YYYYMMDDHHMM]_[slug].md
```

Same timestamp/slug convention as Conversation Arcs. When a dedicated
Legacy repo eventually exists, these migrate there wholesale — this
folder is staging, not permanent custody, which is exactly what `atelier/`
is for.

## Log

| Legatum | Repos Touched | Suit | Status |
|---|---|---|---|
| [`202608220000_pixelator-legacy-infusion.md`](202608220000_pixelator-legacy-infusion.md) | pixelator, custos | ♦️ | CLOSED |
| [`202608211549_what-the-repos-owed-each-other.md`](202608211549_what-the-repos-owed-each-other.md) | custos, hodie, duplicatus, gravitar, navigo | ♦️ | OPEN-seeds-pending |
