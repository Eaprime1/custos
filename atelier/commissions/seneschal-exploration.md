# COMMISSION: THE SENESCHAL — RECONCILE AND PLACE THE ROLE

**Status**: Queued — awaiting contributor assignment
**Priority**: Medium — superseded in part; reframed below

---

## Update — the gap this commission was written for is already half-filled

While this commission was being drafted, eaprime1 landed `seneschal.md` and
`seneschal-v2.md` at the repo root, plus a working `tools/seneschal_audit.sh`
(commit `bcd7585`). The original question — "what does the Seneschal
actually do" — now has two answers instead of zero. The commission below is
rewritten to fit what's actually needed now: reconciling two drafts into
one, and placing the result where custos conventions expect lore to live.

## What already exists (read these first)

- `seneschal.md` — "Steward of the Custos Estate, First Voice of the
  Shepherd." Frames the Seneschal as orchestrator: Audit / Delegate /
  Present loop, delegating to named sub-entities (the Artesian,
  Quartermaster, Broker, Herald — the same Mulberry Initialization roles
  `world/unoiam-lifecycle.md` lists as "tracked but not built"). Ties the
  role to the THEE/YOD/EMBER triad directly.
- `seneschal-v2.md` — "System Daemon / Steward," Sentinel-aligned.
  Character/demeanor framing (meticulous, no creative ego) plus a
  different triadic pattern: Perceive (walk the directories) / Weigh
  (assess fragment weight) / Present (ledger for the Shepherd).
- `tools/seneschal_audit.sh` — a real, runnable audit script implementing
  v2's Perceive phase: scans `seep-artois/` and `atelier/` for untended
  items, greps the repo for `[COMMISSION-DRAFT]` and `[NEEDS-TENDING]`
  tags. This is the first Seneschal *function* with actual code behind it.
- `world/unoiam-lifecycle.md` (this session) — describes Seneschal
  functions in lore terms (atmospheric pressure, the Shadow Peers,
  five audit tags including `[SEED-ACTIVE]`, `[EOC-READY]`,
  `[BORN-YESTERDAY]` that neither root file nor the audit script
  currently checks for).

## The Question

Three independent descriptions of the Seneschal now exist — `seneschal.md`, `seneschal-v2.md`, and `world/unoiam-lifecycle.md` — written without reference to each other, in different places (root vs. `world/`), with different triadic patterns (Audit/Delegate/Present vs. Perceive/Weigh/Present vs. the lore file's looser function list) and at least one real gap between them: the audit script only checks for `[COMMISSION-DRAFT]` and `[NEEDS-TENDING]`, while the lore file lists five tags including three the script doesn't look for.

The commission: reconcile these into one canonical document, placed where custos convention expects it (`world/seneschal.md`, alongside `world/deck-master.md` — not at root, where the two current drafts sit), and bring `tools/seneschal_audit.sh` up to date with whichever tag set the reconciled document settles on.

## What's already established (don't redefine this — reconcile it)

- "The Seneschal is not a prison guard." — agreed across all three sources, in different words each time.
- Two different triadic patterns are proposed for the same loop. They may describe the same thing from different altitudes (Audit/Delegate/Present being the strategic loop, Perceive/Weigh/Present being what Audit looks like up close) rather than competing — that reading is worth testing before treating them as a conflict to resolve by picking one.
- `seneschal.md` names sub-entities (Artesian, Quartermaster, Broker, Herald) the Seneschal delegates to — these are the same Mulberry Initialization roles `atelier/commissions/message-to-the-commissioner.md` lists as undefined. `seneschal-v2.md` and `world/unoiam-lifecycle.md`'s Shadow Peers (Salt Merchant, Silt Dredger, Frost Carver) are a *different* set of sub-roles, oriented around the water-cycle metaphor rather than the estate-management metaphor. Whether these two sets coexist, overlap, or need reconciling is the central open question.
- The Chain of Custody Protocol's three standing questions (clean evaporation, appropriate context gathered, unbroken timestamp chain), from `world/unoiam-lifecycle.md`, aren't mentioned in either root draft — check whether they belong in the reconciled version.

## Research / Build Areas

### 1. Reconcile or Layer the Two Triads

Decide whether Audit/Delegate/Present (`seneschal.md`) and Perceive/Weigh/Present (`seneschal-v2.md`) are the same loop at two zoom levels, or genuinely competing models. Write the reconciled version so a reader doesn't have to hold both drafts in their head to understand the role.

### 2. Reconcile the Sub-Entity Sets

The Artesian/Quartermaster/Broker/Herald (estate-management framing) and the Salt Merchant/Silt Dredger/Frost Carver (water-cycle framing) both describe things the Seneschal delegates to or dispatches. Either show how both sets are active at once (e.g., one set handles intake/assignment, the other handles state-change residue), or make the case for one being the canonical set and the other being retired or folded in.

### 3. Bring the Audit Script and the Tag List into Agreement

`tools/seneschal_audit.sh` greps for `[COMMISSION-DRAFT]` and `[NEEDS-TENDING]`. `world/unoiam-lifecycle.md` lists five tags. Either extend the script to check all five, or revise the lore file's tag list down to what the script actually does — whichever direction the reconciliation goes, the two need to agree afterward.

### 4. Move the Files

`seneschal.md` and `seneschal-v2.md` currently sit at repo root. Every other character/role document in custos (`world/deck-master.md`, `world/factions.md`, `world/symbols.md`) lives in `world/`. Reconcile the two drafts into a single `world/seneschal.md` and remove the root-level originals once the canonical version is in place.

### 5. Where Pressure Comes From

"When a file sits too long... the Seneschal increases the pressure" (`world/unoiam-lifecycle.md`) — pressure from what, exactly? Time elapsed, open PR count, or a literal weather API per the still-unintegrated `Custos_Proposal__Hydrologic_StateChange_Architecture.md` Section IV idea (wave-machine and weather-pattern data feeding the system's "weather")? None of the three existing sources answer this. A strong answer ties the mechanic to something measurable, even if not yet automated.

## Deliverable Format

- `world/seneschal.md` — the reconciled canonical document, in the structural style of `world/deck-master.md`
- An updated `tools/seneschal_audit.sh` that checks whatever tag set the reconciled document settles on
- Removal of the now-superseded `seneschal.md` and `seneschal-v2.md` at root, once the canonical version lands
- A short open-questions section at the end, same convention as other world-files, for anything not resolved by the reconciliation

---

## Notes for the Contributor

This commission started as "define the Seneschal from nothing." It changed shape mid-draft because eaprime1 landed two real drafts of it independently, in the same window this commission was being written. That's a Lumenar moment in its own right — two intentions crossing without either having seen the other. Reconciling them honestly, rather than picking a favorite and discarding the other, is the actual work here.

Enjoy the journey.
