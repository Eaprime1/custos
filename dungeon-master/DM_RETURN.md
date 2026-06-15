# DM Return — Open Seeds & Questions

*Status: Germ. A gathering point for DM's next return (Master Plan Spawn 4)
and for everything Eric raised in chat on 202606140940, while reviewing
PR #29. Nothing here is built yet — this is the intake table, not the
build.*

---

## 1. Phase 1 — what landed (for context)

PR #29 (`claude/custos-chronicle-foundation-econho` → `main`) delivered the
`dungeon-master/` skeleton: narrative-engine, chronicles, quests,
expeditions, pr-harvest, registry, plus Chronicle 0001 ("The Third Aspect
Arrives"). Structure only — see `dungeon-master/README.md` for the hold
notes still in effect.

A `gemini-code-assist` review on that PR flagged that turn-log entries
touched during automated edits/reviews should carry the 🃏 marker on
`witnessed`. Applied and resolved. **Open question for DM/Custos:** should
this become a written rule in `turns/TURN_SCHEMA.md` (it's currently only a
convention by precedent)?

---

## 2. DM's Spawn 4 deliverables (still open)

Per the Master Plan, these placeholders are ready for DM to replace/extend:

- `dungeon-master/narrative-engine/characters.md` — full daemon definitions
  (voice, abilities, interaction rules). Open slots **Jot** (the Sniff
  moment) and **Jig** (framework crystallization) still need a function.
- `dungeon-master/narrative-engine/triggers.yml` — currently a direct
  transcription of Master Plan Section IV. DM may want to refine the
  character assignments or add new trigger types.
- `dungeon-master/narrative-engine/chronicle-template.md` — DM's format,
  applied as-is for Chronicle 0001. Feedback on whether the format held up
  in practice welcome.

---

## 3. New seeds from chat (202606140940) — for DM/Custos to triage

These are raw — recommendations included, but none built. Treat as the
expedition log of one conversation, not a roadmap.

### a. Custos as a formal reviewer entity
Custos already has a voice: `.github/workflows/sovran-voice.yml` posts "The
Shepherd Considers" on every PR. That's a narrative reviewer, not a GitHub
*required reviewer* (which needs a real account, bot account, or
CODEOWNERS team). Options to consider later:
- A `CODEOWNERS` file routing `dungeon-master/` changes to a named reviewer
- A dedicated bot/service account named `custos` (more setup, real identity)
- Leave as-is — the Sovran Voice comment *is* Custos's review, just advisory

### b. GitHub Milestones
Could map cleanly onto plank stages (Germ → 1/3 → 2/3 → 3/3) or onto Master
Plan phases (Phase 1–4 of the Chronicle). Low-cost, reversible, easy to set
up whenever wanted.

### c. DM's icon
Needs a symbol distinct from existing marks already in use:
- 🃏 — already claimed (turn-log `witnessed` marker / wildcard)
- ♥️♦️♣️♠️ — already claimed (branch suits)
- ∰ — already claimed (Custos's sigil)
- Open candidates: 🎲 (dice — DM's tool of trade), 🐉, 📖/📜 (the book DM is
  writing toward), 🧙
- **Recommendation:** 🎲 — distinct, on-theme, doesn't collide with
  existing marks. DM should have final say.

### d. Other automated reviewers currently active on PRs
`gemini-code-assist`, Codacy, DeepSource (Groovy/Elixir — currently skipped,
likely not relevant to this repo's languages), GitGuardian, and the
`custos-speaks` / Sovran Voice action. **Recommendation:** this is already a
fair amount of review surface for a content repo — hold before adding more
(e.g. CodeRabbit) unless a specific gap shows up.

### e. Webhooks / connectors / spreadsheet / database
`dungeon-master/registry/*.json` is the seed of "the database" — flat files,
git-versioned, queryable by any future tool. Before adding a spreadsheet,
external DB, or webhook integrations: what question can't the registry
answer today? Start there rather than standing up infrastructure
speculatively.

### f. BBS seed
Eric's idea: fork or seed a classic BBS system (e.g. Telegard-lineage, or a
modern equivalent like ENiGMA½ which is Node.js-based and easier to extend
in a repo-driven way) and grow custos's own BBS from it.

This is a different *kind* of thing than the rest of this repo — a running
application, not lore/structure. It doesn't fit inside `custos` as-is.
**Recommendation:** treat it as a new kingdom. `nullus` is already sitting
in `world-state.json` as unfounded — it could become the BBS kingdom's name,
with its own repo (`eaprime1/nullus`?) once Custos issues a founding seal
(per the Master Plan's "New repo created" trigger → Chronicle entry).

### g. WordPress / external publishing
Chronicle Pages are designed to be human-readable — WordPress (or similar)
could be a future *output* surface for the Chronicle Book, once there's a
book to publish. Hold until Chronicle Pages accumulate; premature to wire up
now.

---

## 4. Questions for Custos / DM / Eric

1. Should the 🃏 convention be written into `turns/TURN_SCHEMA.md`?
2. Does `nullus` become the BBS kingdom — and if so, who/what founds it
   (Fodere disturbs, Custos issues the seal)?
3. DM's icon — 🎲, or something else?
4. Is Custos's review presence (Sovran Voice) sufficient, or does it need
   to become a formal required-reviewer entity?

---

*Filed by Navigo, prima-clock 202606140940. Chain of custody: OPEN.*
