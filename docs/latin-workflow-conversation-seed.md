# Latin Workflow — Conversation Seed

**Prima-clock:** 202609262250
**Suit:** ♣️ Club, working copy
**Adapted from:** [`latin-workflow-glossary.md`](latin-workflow-glossary.md), which covers PRs

The glossary gives the Latin calls for pull requests. This is the same
grammar adapted to a **conversation**: one session between eaprime1 and a
navigo, on any podium. That includes Claude Code, Claude.ai, Gemini, ChatGPT
or a VSCode session, with or without GitHub access.

A conversation moves through the same stages a PR does. It orients, works,
finds, decides, finishes, polishes and seals. Naming the stage out loud
tells the navigo what kind of response is wanted, without a paragraph of
explanation.

## How to use it

Paste the **seed block** below as the first message of a new conversation,
or point the navigo at this file. After that, eaprime1 can steer with a
single call, such as `ultima Recensio` or `Judicium`, and the navigo answers
in that call's mode.

---

## Seed block

```text
We work with the Latin workflow calls (custos: docs/latin-workflow-conversation-seed.md).
A call names the stage of this conversation. When I use one, answer in its mode:

PRIMA RECENSIO — orient. Read what I've given you (carrier, handoff, state docs),
  then tell me where things stand and what's open. Don't start the work yet.
RECENSIO — the working scan. Find issues, recommend fixes, do the work asked.
EXTREMA RECENSIO — one thing, to the bottom. A forensic deep dive; show evidence.
JUDICIUM — a decision only I can make. Stop. Give me the options, your
  recommendation and what each choice changes. Don't act until I rule.
ULTIMA RECENSIO — the final review, not the locked one. Fix everything found
  so the work is ready to finish. No new scope.
LUSTRATIO — polish for presentation: descriptions, documents, reading path.
  Clear away noise. Change how it reads, not what it does.
SUPREMA LUSTRATIO — the brief for high command: a summary someone else can
  act on without this conversation.
NOVISSIMUM — the rear guard. Close loose ends: file seeds and open questions,
  update state docs, leave nothing mid-flow. Say what's carried forward.
ULTIMA PROBATIO — the seal. Write the closing record (journey, turn log),
  confirm everything landed, then stop. After this, nothing in this
  conversation changes; new work opens a new conversation.

If a call is unclear, or I use a word that isn't one of these, say how you're
reading it before acting.
```

---

## The calls in a conversation

| Call | In a PR | In a conversation | The navigo's output |
|---|---|---|---|
| **Prima Recensio** | First automated checks | Opening orientation | A state-of-things snapshot, e.g. `turns/STATE-OF-CONSTELLATION-*.md` |
| **Recensio** | Deep scan, findings, fixes | The working loop | Work done, findings named, fixes made |
| **Extrema Recensio** | Forensic audit | One question pursued to evidence | Findings with the evidence behind them |
| **Judicium** | Maintainer decision gate | The owner's ruling | Options, a recommendation and consequences, then a pause |
| **Ultima Recensio** | Final review pass | Finish what's open; no new scope | Everything found is fixed or named |
| **Lustratio** | Presentation polish | Tidy the record and the reading path | Clean descriptions and documents, folded noise |
| **Suprema Lustratio** | Release notes, executive brief | A hand-off brief | A summary that works without the conversation |
| **Novissimum** | Rear-guard cleanup | Loose ends filed | Seeds, open questions and state docs updated (`turns/CLOSING.md` steps 2–5) |
| **Ultima Probatio** | Final sign-off; frozen | The conversation is sealed | Journey, turn log and AAR written; merges confirmed (`turns/CLOSING.md` steps 3, 7, 8) |

## Adapting to the podium

- **With repo access** (Claude Code, a VSCode podium): the outputs land as
  files and PRs. Probatio includes confirming that every PR merged.
- **Without repo access** (a chat-only podium, e.g. nav3 before GitHub access):
  the same calls apply, but the outputs are documents for eaprime1 to file.
  Novissimum and Probatio produce a closing document to carry into custos,
  which then files it through the Artesium Weir.
- **Mixed words:** eaprime1 may write a call with other words around it, e.g.
  "ultima Probatio. finalize". The call decides the mode. The surrounding
  words are context, not a second instruction.

## The rule that matters most

**A call is a mode, not a keyword.** "Ultima Recensio … ready to complete or
finalize" means review and fix. It does not mean seal, even though the word
*finalize* appears. The PR workflows learned this the hard way (custos#339:
a Recensio comment sealed a PR by accident). Conversations keep the same
discipline: act on the stage named, and when two stages seem to be named,
ask.

## Worked example

The Act II setup session
([`valuation/nav1-act-ii-setup_journey_202609262245.md`](../valuation/nav1-act-ii-setup_journey_202609262245.md))
ran the full arc before the grammar had a name:

1. **Prima Recensio:** the State of the Constellation snapshot.
2. **Recensio:** the naught, nullus and maw work.
3. **Ultima Recensio:** "the final review not the locked in review".
4. **Lustratio:** ECC noise folded out of the reading path.
5. **Probatio:** radix#42 sealed by `ultima Probatio`.
6. **Novissimum and the close:** the journey, the turn log and the seeds.
