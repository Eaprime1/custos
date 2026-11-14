---
carrier_id: oxo-synth2-exploration
prima_clock: 202611092041
source_path: "pasted by the Shepherd in the conversation on 202611091233 (Shepherd's stamp); a navigo_gemini report on a Synthtopia news item"
found: 2026-11-09
chain_of_custody: OPEN
vault_copy: ""
status: weir
drawn_by: ""
drawn_date: ""
---

# Oxo Synth2: an exploration of possibilities

*An exploration, not a plan of record. The facts section is checked. The possibilities section is thinking.*

## Source

A report from navigo_gemini on a news item the Shepherd ran across: Synthtopia, "Oxo Synth2 Revives Classic
Synth1 As A Free, Open-Source Software Synthesizer", dated 2026-11-09
(<https://www.synthtopia.com/content/2026/11/09/oxo-synth2-revives-classic-synth1-as-a-free-open-source-software-synthesizer/>).

The report is kept beside this carrier, unedited: `oxo-synth2-gemini-report-202611091233.original.md`.
SHA-256 of the file as filed (the report text as pasted, in a Markdown file written here):

```
2fb52fa6778ff68cc1ae19a51c56357702d53a30bc14209c23830a4ab21aa362
```

## Checked Against the Article (202611092041 UTC)

The Synthtopia page was read in full by a fetch agent in this session. One source, published the same day. The
Oxo product page and the synth itself were not opened or tried.

| Claim in the report | Result |
|---|---|
| Recreation of Daichi Laboratory's Synth1 | Confirmed. The article says independent, and not affiliated with or endorsed by Daichi |
| Developed by François Chabloz | Confirmed. Released by Oxo Music |
| MIT license | Confirmed |
| About 3 GB of measurement data | Confirmed as the developer's own claim. Used to model the original's parameters one by one. The article adds that the engine was not intentionally changed |
| Two oscillators and a sub, five filters, 32 voices, 8-voice unison, arpeggiator, effects list | Confirmed |
| macOS 14+ (VST3, AU) and iPadOS 17+ (AUv3) | Confirmed. Windows VST3 in development. Linux left to community ports |
| `.sy1` patch and ZIP bank compatibility | Confirmed |
| **Nord Lead 2 lineage** | **Not in the article.** Synth1 is widely said to be Nord Lead 2-inspired, so likely true, but it came from the report's own knowledge. Unverified here |
| **"Official product page" link** | **Wrong.** The report's link is the Synthtopia article. The page the article names is `https://oxo-music.com/products/oxo_synth2` (not opened) |
| **"Inspect the repository"** | **No repo link** in the article, though it says the source is MIT-licensed |
| Versatility table (chiptune zap kicks, industrial leads) and "low CPU overhead" | **Not in the article.** The report's own inference. Plausible, untested |
| Limits (no wavetable, sample layering or MSEGs) | Not in the article. Inference from the feature list, which is consistent with it |

The article also lists items the report left out: MIDI Learn, built-in interface themes with a theme editor, and
host-tempo sync on the arpeggiator.

## Why It Matters

It might not matter much. The synth is not part of custos. It is filed because it touches several things the
project already cares about, and because the Shepherd found it and asked what it could mean for the project.

## Possibilities

Each of these is a way of looking at it, in order of how well it fits what the repo already holds. None has been
decided, and none is claimed as the Shepherd's view.

1. **A worked example of a faithful copy.** The method is the interesting part: measure the original's behavior
   (about 3 GB of it), model each parameter, change nothing about the engine, keep the old patches working.
   That is close to the Carbonite idea in `CLAUDE.md`: a copy that must stay recognizably the original, with
   the master holding the space for its versions. The `.sy1` compatibility is the same instinct as recording a
   Carbonite's differences from the master. Worth one honest paragraph in whatever document next treats copies,
   with the caveat that this is an analogy and the synth people never used these words.
2. **An answer to a hash-rule question.** The Armarium rule (SHA-256 of exact bytes, edits as amendments) is
   about proving a copy is the copy. Oxo Synth2 attacks the same problem with measurement instead of hashing,
   because the original's source was never open. Two ways to say "this matches the origin", for different
   kinds of origin: bytes you hold, and behavior you can only observe. Possibly useful wording for
   `atelier/heritage-pipeline/`. Not checked against that folder.
3. **Sound for the world.** `world/lore.md` says the terminal is the world. A tone for the Podium, the Field or
   the Flock would be a lore question, not a software one. Nothing needs to be built. This only notes that
   Nord-lineage subtractive synths are small, readable systems (oscillator, filter, envelope, LFO), the same
   shape as the triads the project already likes. Pattern-completing, named as such.
4. **The Pixel 8, plainly.** Nothing here runs on it. There is no Android or Linux build, only an invitation to
   port. If the Podium ever makes sound, the realistic route is a different open synth, or this one ported by
   someone else. Not a near-term path.
5. **The Shepherd's own use.** If the Shepherd makes music, this is a free instrument with tens of thousands of
   existing patches, on a Mac or an iPad. That is a personal use and not a repo matter. Noted so it isn't lost.
6. **A contributor-facing story.** An MIT project with open invitation to port is the same shape as the
   Sparstone Trial: a defined gap (Windows, Linux) with an open approach. It is a parallel worth citing in a
   guide, not a task for custos. No cash and no bounty framing in the comparison.
7. **The verify-first habit.** The report is a small proof that an assistant's summary needs checking against
   its source. Two errors found (a wrong link, an unsourced lineage claim) and a few inferences presented as
   facts. A real, local example for any guide on handling second-hand reports (compare the Valthraman carrier).

## Development Notes

- Nothing was downloaded or installed. No audio was heard. Claims about sound quality are the article's or the
  report's, not tested.
- The chiptune, industrial and "no DSP artifacting" statements in the report should not be quoted anywhere as
  fact.
- No private details were noticed in the report. No personal names other than the developer's, as published.
- The Shepherd's stamp 202611091233 is on the original's file name. This carrier's stamp is UTC, per
  `CLAUDE.md`.
- `oxo-synth2-gemini-report-202611091233.original.md` carries no prima-clock stamp on purpose: adding one
  would change the file and invalidate the SHA-256 above. The `prima-witness` advisory will keep
  flagging it for that reason.

## Plan

1. The Shepherd decides which possibility, if any, deserves a home: a paragraph in the copies or heritage
   material (1, 2), a lore note (3), a guide example (6, 7), or nothing.
2. If the Oxo product page is wanted as a source, open `oxo-music.com/products/oxo_synth2` and add what it says.
   Look for the repository link the article lacks.
3. If a possibility is taken up, the origin stays here, unedited, and the new document cites this carrier.

## Status

- [x] Reviewed at the Weir
- [ ] Origin mold copied to vault/
- [ ] Carrier page moved to seep-artois/
- [ ] Drawn for development
