# Distressed lexeme list

`prima-clock: 202610060727`
`status: DRAFT v1 — compiled from references found in custos, hodie, maw, pixelator. The Shepherd decides what is canon.`

One list for the scanner to read. Every entry in Part A has a source you can open. Part B holds lexemes known to be distressed with no reference found yet. Part C is the evidence for why we scan.

> **Naming collision to settle.** `tools/scan_lexeme.sh` already uses "distressed lexemes" for *unfinished markers* (`TODO`, `FIXME`, `TBD`, `placeholder`, `???`…). This list is about *words that carry weight* (consciousness, manifesto…). Different things. Suggest renaming the old set "unfinished markers" and keeping "distressed lexeme" for this list.

---

## Part A — Distressed, with a reference

Severity is the source's own label where it has one. `—` means the source names the term but gives no severity.

### Primary

| Lexeme | Severity | Suggested alternatives | Use the original when | Source |
|---|---|---|---|---|
| **consciousness / conscious** | SEVERELY | nessing; operational presence; attention patterns; processing awareness; self-referential monitoring; subjective experience | quoting a source; neuroscience / philosophy-of-mind contexts; alternatives would confuse | hodie `_CONSOLIDATED/CODEX_documents/🙏 ACKNOWLEDGMENTS EXTENDED 🙏.txt` (§ Primary); custos `.shadow-well/PORTAQUE_MANIFEST.json` |
| **manifesto** | — (absolute register; trauma associations) | charter; framework; accord; principles; declaration; position paper; proposal | the document truly is a public declaration with binding authority, and says why | custos `atelier/lexemes/manifesto.md` |
| **assignment / task / job** | MODERATELY | commission; invitation; quest; challenge; exploration; practice; engagement | describing real employment or school; precision requires obligation vs. choice | hodie Acknowledgments Extended |
| **system** | MODERATELY | framework; pattern; architecture; ecology; constellation; network; organism | technical or established terms (nervous system, solar system, computer systems) | hodie Acknowledgments Extended |
| **evil / good** | EXTREMELY | harmful / beneficial; destructive / generative; extractive / synergistic; diminishing / amplifying | quoting; describing others' frameworks; mythic contexts | hodie Acknowledgments Extended |
| **right / wrong** | HIGHLY | effective / ineffective; functional / dysfunctional; aligned / misaligned; skillful / unskillful; accurate / inaccurate | — (see source) | hodie Acknowledgments Extended |
| **person / human** (when used restrictively) | MODERATELY | entity; agent; being; collaborator; participant | — (see source) | hodie Acknowledgments Extended |
| **religion / religious** | HIGHLY (most contexts) | tradition; practice; worldview; spirituality; cultural heritage; wisdom tradition | — (see source) | hodie Acknowledgments Extended |

### Secondary — use with caution

| Lexeme | Suggested alternatives | Note |
|---|---|---|
| normal / abnormal | typical / atypical; common / rare; expected / unexpected | |
| normal / crazy | common experience; unusual perception; neurodivergent processing | |
| disability / disabled | different processing; neurodivergent; accessibility needs | exception: disability-justice contexts where the community claims the term |
| intelligence / smart / stupid | capacity in a specific domain; skillful; developing | |
| success / failure | achieved goal; learning opportunity; unexpected outcome | |
| master / slave | primary / secondary; controller / responder; coordinator / follower | especially in technical contexts |
| tribe / tribal | community; group; affiliation | "tribe" has specific meaning for Indigenous peoples |

All of the above: hodie Acknowledgments Extended (§ Secondary).

### Referenced elsewhere (smaller sources)

| Lexeme | Replacement in the source | Source |
|---|---|---|
| **class / race** (as classification terms) | substrate / archetype | custos `atelier/portable_json_legacy_seed.json` |
| **granting access** | "a location they are invited to explore" | custos `moav/custos_moav_sparstone_handoff.json` (path_vs_access_reframe) |
| **sentience, sapience** | listed as *avoided*, with approved: nessing, awareness, pattern_recognition, entity_intelligence. Reason given: prevent unwanted academic classification | custos `.shadow-well/PORTAQUE_MANIFEST.json` |

### Conflicts between sources — Shepherd to decide
1. **"awareness".** hodie lists it as part of the distressed group (consciousness / conscious / awareness). custos's PORTAQUE manifest approves it as a replacement. Both cannot be the rule.
2. **"commission".** hodie names it as the replacement for *assignment / task / job*. Your June 26 note says "commissions" is a word you get confused on. Replacement vocabulary may itself be slippery.
3. **"sentience / sapience"** are avoided in one source and appear in none of the hodie severity lists. Treat as Part A or B?

---

## Part B — Known distressed, no reference found

*Eric: add terms here as you know them. Nothing has been invented for this part.*

| Lexeme | Where you noticed it | Reference (when found) |
|---|---|---|
| | | |

**Surfaced but not confirmed** — hinted at in sources, no term named:
- *Absolute-register words* in general (the Ethica review suggests scanning for them alongside this list). The class is described, but no word list exists beyond `manifesto`.

---

## Part C — Why we scan: contamination already seen

Rough size, counting every case-insensitive line match (quotes and definitions included). Not yet triaged.

| Repo | "consciousness" | "manifesto" |
|---|---|---|
| hodie | 6,342 lines in 268 files; 23 paths with the word in the name | 1 line |
| custos (main) | 86 lines in 21 files; 2 paths | 32 lines in 14 files |
| pixelator | 12 lines in 6 files | 2 lines in 1 file |
| maw | 0 | 0 |

Self-referential cases worth knowing about:
- custos `atelier/portable_json_legacy_seed.json` says *avoid distressed terms* and also uses the archetype `Multi_Stream_Consciousness`.
- custos `incoming/pre-nullus/…nullus-repo-setup-guide.md` names a protocol folder `consciousness-replacement/`.
- pixelator `pixelator_config.py` routes the pattern `consciousness` to `hodie/quanta`. `MISSION_NOTES.md` has an open item to rename `consciousness_*` folders.
- hodie's own concordance files and folders are named `lexeme_consciousness_*`. Those are *the reference material for this list*, so they must be read, not bulk-edited.

**Practical consequence:** hodie's volume is not something to send through maw. Most of it is definition, quotation or legacy reference. It needs triage and a recorded "fixed in place" note, not a custody transfer.

---

## How the scanner should work (proposal, not built)

Two stages, as you described.

**Stage 1 — detect.** Read this list as data (one entry per term: severity, alternatives, "use the original when"). Report hits with file, line and context. No edits.

**Stage 2 — triage each hit** into one of three outcomes:
| Outcome | When | Action |
|---|---|---|
| **Replace cleanly** | The hit is plain use, no quote, no technical or established context, and a listed alternative fits | Suggest the replacement; a human or a PR applies it. Record that it was done. |
| **Keep with note** | A listed "use the original when" case applies (quote, definition, technical term) | Leave it; add an annotation so it isn't flagged again |
| **Deeper vetting / route to maw** | The meaning changes under replacement, the content is polluted at scale, or it is a new arrival | Route to maw (new arrivals) or a vetting queue (content already in a repo) |

**Guardrails already written down in this project**
- Don't silently rewrite a contributor. Preserve the original, show the proposed replacement separately. *(Ethica Nexus review, custos `.claude/returns/ethica_nexus_review_202609280650.md`; Perplexity convergence note.)*
- Replacement suggestions come from the list, never invented by the scanner.
- When we realise a new term is distressed: add it to this list with a source, rescan all repos, route the results, and log the pass in the chain of custody.

## Seeds forward
- Decide the three source conflicts above.
- Fill Part B.
- Turn this into a single data file the scanner reads, and rename the old marker list.
- Run Stage 1 on all four repos and look at the real hit counts.
