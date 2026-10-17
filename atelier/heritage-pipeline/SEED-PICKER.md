# The Seed Picker (working name: Lector)

`suit: ♦️ Diamond — seed, structure forming`
`prima-clock: 202610171930`
`status: concept for the Shepherd. Not built.`

*From the Shepherd, 202610171006: "we might create a seed picker type agent or concept or workflow."
This is that concept, shaped by what went wrong in the engine test.*

---

## Why it exists

In the engine test, the automatic extractor returned five "seeds" and none was one of the three
real ones. In the Sanctum run, some seed fragments were paraphrases presented as quotations.
Both failures have one cause: the seed text was *written*, not *selected*. The picker fixes
that by never writing seed text at all. It only points at text that is already in the origin.

## The name

**Lector** is Latin for a reader. Its verb, *legere*, means both "to read" and "to gather, pick
out". A seed picker does both. (*Legere* and the Greek *legein*, from which "lexeme" comes, share
a root meaning "to gather".)

## What it does

1. **Reads** the origin (or the nullification copy) with an index of positions: tab or page, and
   a character offset.
2. **Proposes** up to five candidate spans. Each candidate carries `start`, `end`, the `quote`,
   a one-line reason, and a canon label (see step 5).
3. **Checks mechanically.** For each candidate, `text[start:end] == quote`, byte for byte, in
   UTF-8 with no normalization. A candidate that fails is dropped; it is not repaired.
4. **The Shepherd picks one to three.** The picker does not choose for them.
5. **Writes `seeds[]`** into the package. For each seed: the quote, the position, `verbatim: true`
   (set by the check in step 3, never by the picker's say-so), and a `canon` label:
   `established` (introduced or confirmed by the Shepherd), `proposed` (an assistant's
   extension) or `unresolved`. The label comes from who spoke the span, so the origin needs
   speaker tags; without them the label is `speaker: unknown`.
6. **Logs the run** in `engine_runs[]` with the command and the result.

## What it must not do

- Rewrite, shorten, merge or "clean up" a quote.
- Pick a span inside a distressed lexeme without flagging it. (On a nullification copy the span
  is a replacement; the seed records that.)
- Pick more than three seeds for one conversation, or fewer than one.
- Decide canon status for the Shepherd. It reports who spoke; the Shepherd decides.

## Tests it should have before anyone relies on it

| Case | Expected |
|---|---|
| A real quote at the right offsets | accepted, `verbatim: true` |
| A paraphrase of a real sentence | rejected |
| A quote one character off (offset or text) | rejected |
| A quote with a curly quote swapped for a straight one | rejected (no normalization) |
| A span spanning two speakers | accepted only if flagged as mixed |
| Six candidates proposed | the sixth is dropped before the Shepherd sees it |

## Where it lives

First as a manual workflow: prompt P5 in the heritage draft is its by-hand form (the check is
done by a script, the choice by the Shepherd). Later as a tool in custos `tools/`, and, if it
grows, as its own repo. The mechanical check is a few lines and is the part to build first.

---

*Concept only.*
