# Mission Board

`suit: ♦️ Diamond — active build`
`prima-clock: 202609290944`

The mission board is the internal navigo queue. It is distinct from two
other intake paths: the artesian weir (external fragments routed inward)
and the public contributor issues (open to anyone). Mission board items are
**Shepherd-opened, navigo-driven, and reviewed before merge.**

```
Shepherd opens mission  →  navigo checks availability (disponi)
                        →  navigo submits plan (petitio)
                        →  Shepherd accepts  →  navigo branches and builds
                                             →  PR + seal + merge
```

---

## Atmosphere

Coffee haven. No race, no territory. A navigo walks up, checks if the seat
is open, says what they'd do with it, and waits for the nod. One conversation
per mission at a time. The Shepherd redirects without ceremony.

---

## The Two-Step

### disponi — availability check

Before investing in a plan, a navigo asks whether a mission is free.

In a GitHub Issue comment:

```
@claude disponi
```

Response (bot or navigo reading the labels):

- **open** — no one is working it; a petitio is welcome
- **in progress** — another navigo has it; check back or ask if they need a hand
- **paused** — the prior holder stepped away; a petitio can reopen it

`disponi` is derived from *disponere* — to arrange, to make ready. It asks:
*is this arranged for someone already?*

### petitio — request to take the mission

If the mission is open, the navigo submits a brief plan as a comment.

```
@claude petitio

Intent: [one sentence — what you'll produce]
Approach: [two or three sentences — how you'll do it]
Completion check: [the bash command that says it's done]
```

The Shepherd reads the petitio and either:
- **Accepts** — replies in the thread; the navigo branches and begins
- **Redirects** — notes what needs to change; the navigo can revise and repost
- **Declines** — the mission stays open for the next petitio

A petitio is not a reservation. Work begins on acceptance, not on submission.

---

## Creating a Mission

The Shepherd opens a GitHub Issue using the `mission` template. Every mission
needs:

1. **A clear deliverable** — what exists after the work is done
2. **A deterministic completion check** — a bash command that returns success
   when done
3. **A navigo designation** (optional) — `voices-of-navigo` label marks missions
   specifically seeded from navigo session insights

The `voices-of-navigo` tag is for missions that came out of a navigo
conversation rather than a Shepherd directive — ideas the session surfaced,
things a navigo noticed and flagged. These are the mission board's
generative layer: the system teaching itself what to build next.

---

## Mission Lifecycle

```
open  →  disponi asked  →  petitio submitted  →  Shepherd accepts
      →  in-progress (label)  →  navigo builds  →  PR opened
      →  CI + seal  →  Shepherd final review  →  merged  →  closed
```

Labels:

| Label | Meaning |
|---|---|
| `open` | Available — no active petitio accepted |
| `in-progress` | A petitio was accepted; navigo is building |
| `paused` | Work stalled; open to a new petitio |
| `voices-of-navigo` | Mission seeded from a navigo session insight |

The board does not use `claimed` (the public claim tracker, set by
`claim-register.yml`) or `anchor-review` (the broad anchor label for lore,
custody and photo anchors). Deck Master review is a separate gate: it follows
the paths in `.github/CODEOWNERS`, not a label.

---

## Connection to the Seal Flow

A mission closes when its PR merges. The PR follows the standard seal path:

1. PR body filled: Intent, What Arrived, Resonance, Ethics Check
2. CI green (scan, validate, packet, Codacy, DeepSource)
3. Owner posts `@claude ultima probatio`
4. `finalize-pr.yml` adds `finalized` label
5. Navigo or Shepherd merges
6. Mission issue closed, referencing the merge commit SHA

---

## Voices of Navigo — The Generative Layer

The mission board has two sources:

- **Shepherd-directed** — the Shepherd identifies a gap and opens the issue
- **Voices of navigo** — a navigo session surfaces an idea; the Shepherd
  reviews it and opens the mission if it has signal

The second source is the interesting one. It means sessions are not just
doing work — they are also noticing what work is missing and naming it. The
`voices-of-navigo` label marks these so the mission board's generative
contribution is visible over time.

The draft `feature/voices-of-navigo-manifesto` branch holds early thinking
on this. That content is a candidate for a future routing pass.

---

## Known Gotchas

| Gotcha | Avoid it by |
|---|---|
| Petitio before disponi check | Always check disponi first — a mission already in-progress doesn't need a competing plan |
| Plan in petitio is too vague | Include the completion check bash command — if you can't write it, the mission isn't scoped yet |
| Mission closed before PR merges | Close the issue on merge, not on PR open |
| Voices-of-navigo idea never becomes a mission | The Shepherd reviews the tag queue periodically and either opens missions or archives the seeds |
