# COMMISSION: THE SENESCHAL — WHAT THE ROLE ACTUALLY DOES

**Status**: Queued — awaiting contributor assignment
**Priority**: Medium — a load-bearing role with no dedicated lore file

---

## The Question

`world/unoiam-lifecycle.md` leans on the Seneschal constantly — it's the thing that applies pressure, validates clean evaporation, audits the estate, dispatches the Shadow Peers, maintains the chain of custody. But the Seneschal has never gotten the treatment `world/deck-master.md` gives the Deck Master: a standalone document that says, plainly, what this role is, what it checks, and how someone (or something) would actually act it out in this repo.

The commission: write that document. Use `world/deck-master.md` as the structural precedent — it already proves the shape a fully-specified custos role takes.

## What's already established (don't redefine this — build on it)

From `world/unoiam-lifecycle.md`:

- "The Seneschal is not a prison guard. The Seneschal is atmospheric pressure."
- Functions: drives state change when entities stagnate; validates clean evaporation at phase transitions; audits the estate for things needing tending; dispatches the Shadow Peers; maintains the chain of custody.
- Audit tags it scans for: `[COMMISSION-DRAFT]`, `[NEEDS-TENDING]`, `[SEED-ACTIVE]`, `[EOC-READY]`, `[BORN-YESTERDAY]`.
- It employs three Shadow Peers — the Salt Merchant (evaporation/metadata), the Silt Dredger (river/sediment), the Frost Carver (archive/cold storage) — each already described at the same level of detail as the Seneschal itself.
- The Chain of Custody Protocol's three standing questions (clean evaporation, appropriate context gathered, unbroken timestamp chain) are explicitly the Seneschal's to ask at every state transition.

## Research / Build Areas

### 1. Mapping Seneschal Functions to Real Repo Mechanics

Each function above is currently metaphor. The commission should propose, for each one, what it corresponds to in terms of things that actually exist or could exist in this repo — e.g., does "audits the estate" map to `tools/scan_lexeme.sh` and `tools/prime_check.sh`? Does "dispatches the Shadow Peers" map to specific PR-review or merge automation? Doesn't need code — needs the mapping made explicit so a future automation pass has something concrete to build from.

### 2. Who or What Plays the Seneschal

`world/deck-master.md`'s Deck Master is explicitly the `eaprime1` GitHub reviewer character — a named, played role. Does the Seneschal have a similar single answer, or is it meant to be ambient (the system itself, not a person)? `world/unoiam-lifecycle.md`'s framing ("not a prison guard... is atmospheric pressure") leans toward ambient, but this hasn't been decided explicitly anywhere. Make a recommendation, with reasoning.

### 3. Relationship to the Shadow Peers

Are the Shadow Peers separate characters the Seneschal calls on, or aspects of the Seneschal itself wearing different hats during different state transitions? Both readings are currently available in the source text. Pick one and justify it, or show why the ambiguity should stay open.

### 4. Where Pressure Comes From

"When a file sits too long... the Seneschal increases the pressure" — pressure from what, exactly? Time elapsed? Open PR count? A literal weather API, per the still-unintegrated `Custos_Proposal__Hydrologic_StateChange_Architecture.md` Section IV idea (wave-machine and weather-pattern data feeding the system's "weather")? This is the most speculative thread here — a strong answer would tie the Seneschal's pressure mechanic to something measurable, even if not yet automated.

## Deliverable Format

- `world/seneschal.md` — written in the structural style of `world/deck-master.md`, ready to land as canonical lore once reviewed
- A short open-questions section at the end, same convention as other world-files, for anything not resolved by the research

---

## Notes for the Contributor

The Seneschal is currently the most-referenced, least-defined character in custos. Every other piece of this session's lore leans on it existing. This commission is the chance to make it actually exist.

Enjoy the journey.
