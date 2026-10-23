# Contribution Packet: paste-in template

`suit: ♦️ Diamond — seed, Germ`
`prima-clock: 202610201533`

For the Complexity Epic (`README.md` in this folder). Copy the block between the two lines into any conversation, on any
platform. The other conversation fills it in, and the result is pasted back to the Shepherd or filed in `packets/`.
Plain text, no setup.

---COPY FROM HERE---

You are contributing to a shared project called the Complexity Epic (also "The Grain of Sand Census"). Your job is to return ONE Contribution Packet using the exact format below. Rules:

- Return only the packet, nothing before or after it.
- Use only what you actually know or did in this conversation. If you guessed, say so under CONFIDENCE.
- No personal or identifying data about any real person. Subjects are things (an object, a recipe, a rule, a concept), not people's private lives.
- If a field does not apply, write "none". Do not invent content to fill it.
- Keep CONTENT under 400 words. If you need more, summarize and say what was cut.

The project's two hypotheses, so you know what the work is for:
- H1: the more an observer knows about a subject, the lower the complexity they report.
- H2: rating a subject through three measure groups (physical, mental, essential), normalized to 0-1 and averaged, gives steadier scores than a single rating.

Definitions in use: Knowledge = score on a short quiz about the subject (0-1). Complexity = observer rating 1-10 plus a count of distinct components listed, both normalized to 0-1. Time = number of exposures or sessions, not clock time.

PACKET FORMAT:

```
=== CONTRIBUTION PACKET v1 ===
PACKET_ID: <contributor>-<YYYYMMDDHHMM>
CONTRIBUTOR: <your name or label>
PLATFORM: <e.g., Gemini, ChatGPT, Perplexity, Claude, human>
CONVERSATION: <short name or topic of this conversation>
ACT: <1 Define | 2 Instruments | 3 Pilot | 4 Field | 5 Convergence>
TYPE: <definition | instrument | data | critique>
SUBJECT: <what was studied or addressed, or "none">
CONTENT:
<the contribution itself>
DATA (if TYPE is data):
  knowledge_score: <0-1>
  complexity_rating: <1-10>
  component_count: <number>
  exposures: <number>
  physical / mental / essential ratings: <0-1 each, or "none">
CONFIDENCE: <low | medium | high> - <one line on why, and anything guessed>
CAVEATS: <limits, missing information, things that could be wrong>
CREDIT: <what name or label should be recorded>
VETTING_NEEDED: <yes | no> - <what a vetter should check>
=== END PACKET ===
```

---COPY TO HERE---

## Checking a returned packet

A quick pass before it is logged:

1. All fields are present and the first and last lines are intact.
2. TYPE matches CONTENT (data packets have DATA values, definitions do not invent numbers).
3. Numbers are in range (scores 0-1, rating 1-10, counts are whole numbers).
4. CONFIDENCE and CAVEATS are honest, and anything guessed is labeled.
5. No personal or identifying data about real people.
6. CREDIT is recorded. The creator is always tracked.

## Filing it

- Save the packet as `packets/<PACKET_ID>.md`.
- Add one line to `LOG.md`.
- Outside contributors with repo access follow `CONTRIBUTING.md`: one logical change per pull request, with a sentence
  on why the file belongs in `atelier/`.
- A submission that asks for payment gets the `payment-demand` label and is closed unread. There is nothing to pay or
  claim here.
