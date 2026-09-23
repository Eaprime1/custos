# State of the Constellation — 202609221628

*Act II setup session opening (nav1 · Claude). A snapshot of where the repos sit, so
gap-filling starts from what is actually there. Not a to-do list someone already started.*

Prima-clock: 202609221628

`breathe-ii: Act II` · `suit: ♣️ Club — working snapshot` · `plank: 1/3`

---

## Arrived this turn

- Custos PR #337 (eaprime1): Act II setup documents: the Polar Radian Compass /
  Sextant / Crystalline Metric architecture (`.md`), The Polar Radian System gap
  map (`.md`), and four `.docx` files. Two of the `.docx` are the naught drafts
  (`naught-CLAUDE`, `naught-repo-copilot-instructions`). One is the handoff
  (`handoff_to_code_session_naught_maw_nullus`). One is Custos Architecture
  Content Expansion. All six currently land at the **repo root**.
- The handoff names five items. Status after this turn:

| # | Handoff item | Status |
|---|---|---|
| 1 | Commit CLAUDE.md to naught | ✅ Eaprime1/naught#2 (draft). Template CLAUDE.md kept at `docs/origin/` |
| 2 | Review Copilot PR on naught for erasure | ✅ Review posted on Eaprime1/naught#1: 4 flags (details below) |
| 3 | Scaffold schema / intake / transit / outbound / open-questions | ✅ Already built by Copilot in Eaprime1/naught#1, not duplicated |
| 4 | Draft CLAUDE.md for nullus | ✅ Eaprime1/nullus#3 (draft, 1/3 plank) |
| 5 | Hold on maw | ⏸ Held. See the note on maw below |

## The repos

| Repo | State | Notes |
|---|---|---|
| custos | active hub, prime 3 | #337 open (clean). Four external bounty PRs on #325 (XDA entity) open: #331, #333, #335, #336 |
| naught | template + 2 PRs | #1 Copilot scaffold (24 commits, 120 comments, checks green); #2 CLAUDE.md |
| nullus | real canon, GERMINATION_PHASE | Charter, glossary, architecture, core/, protocols/, integration/. `prima.yaml` still unfilled |
| maw | cosmology docs merged | `maw/PRIMAL_COSMOLOGY.md`, particles/events/registry/sacred_pools/mobius_rings. Root README still the prima template |
| eternal_naught_space | README only | "The infinite dark of nothing". **Is this the Zero space repo?** Unconfirmed |
| radix | BBS UI + concepts | Untouched this turn |

## Seams found (owner decisions, not defaults)

1. **Maw's position.** The handoff chain puts Maw *before* Nullus (Unknowable → Maw →
   Known_naught → Nullus). `nullus/docs/architecture.md` puts MAW *after* NULLUS
   (ANTE-ESSE → THE/SPHINCTER → MAW → Canon). Maw's own README calls itself
   "principium territory: first cause", where material lands "after waterfall entry".
   Three readings, one pool. It could be scale-dependent.
2. **Maw isn't as thin as the handoff thought.** The handoff held maw as "a pool, what
   enters is transformed". The repo already carries a primal cosmology, charge tank
   mechanics and a particle table. That could be enough to draft from. The hold stands
   until eaprime1 says otherwise.
3. **Nullus's founding definition.** The handoff has "the state before something was ever
   a category". The nullus Charter has "the inversion threshold between -1K and +1K,
   not zero". The two don't contradict each other, but they haven't been joined yet.
4. **Zero space repo.** naught hands off to a "Zero space repo" that has no name.
   `eternal_naught_space` is the likely candidate.
5. **naught#1 intake overwrite.** Resolved in naught#1 `fe4ca76` (see review
   notes below).
6. **Skip-ahead re-entry** (`zero_polar_(any_level)`) is a hard rule in the naught
   CLAUDE.md, but the naught schema doesn't model it yet.
7. **#337 root placement.** Custos root is already crowded. The Act II documents may
   want a home, e.g. an `atelier/act-ii/` or the Weir. That's the Shepherd's call.
8. **Polar Radian gaps** (named in the doc itself): there's no 360° radian → Ka
   conversion table, and no damping equation for a usurped right angle recovering to
   90°. The declination/Polaris triangle is a known thread and hasn't been formalized
   yet.

## Drive map (Act II)

The folders are nested in this order:

- `🚥shadow_stream` → `marrowing_of_hope` → `breathe_II` (`drive:breathe-ii`)
- `breathe_II` → `act-II_from Polaris to the iceberg-placeholder` (`drive:breathe-ii-act-ii`) → `setup`

`setup` holds the handoff, the naught drafts, The Planck-Prime Manifestation Engine,
The forbidden fruit, The wolven of primal, and the `compass system/` and
`radix-notebook/` folders.

## naught#1 review notes — 202609221628

Three open Copilot-reviewer threads on the Copilot scaffold PR, worked at
eaprime1's request. Fix pushed to the PR branch as `fe4ca76`.

| Thread | Finding | Outcome |
|---|---|---|
| `schema/naught_intake.json` | Schema forced a lossy rewrite of the Custos `GERM_INTAKE` carrier. `additionalProperties: false` rejected `carrier_type`, `germ_intake_form`, `card_rank`, `destination_repo` and `polar_state`, and the URI pattern on `source` rejected free-text Custos sources | ✅ Fixed and resolved. The root is now `oneOf` carrier / bare form, and carrier fields pass through unchanged |
| `intake/README.md` | `tools/thee.sh` still writes THEE fragments into an `incoming.md` that had been turned into a custody register | ✅ Fixed and resolved. `incoming.md` restored byte-identical to `main`, and the README documents both flows |
| `README.md` | The root `CLAUDE.md` still gives prima-template guidance | ⏸ Open, pointing to naught#2, which holds the replacement. Resolves when #2 merges |

**What held strict:** `naught_state` lineage, `transit_type: gas_transfer`,
`closing_status: HOLDING`.

**Verification:**
- `jsonschema` accepts the Draft 2020-12 schema.
- The PR's own example passes.
- The real obsidian Sparstone carrier fails as-is, and only on its missing
  `naught_state`. That's expected, because it hasn't entered naught yet.
- The same carrier after gas transfer (`naught_state` added, transit/closing
  status set) passes with every carrier field kept.
- Lineage and `gas_transfer` violations are still rejected.
- `tools/validate_json_yaml.sh` passes.

**Still open from my earlier review:**
- Skip-ahead re-entry (`zero_polar_(any_level)`) is not modelled. A returning
  item can only come back as `unknown` with prior `naught_known`.
- Copilot instructions vs CLAUDE.md duplication, and the Maw position.

These are owner decisions.

**Order to merge:** naught#2 (CLAUDE.md) with or before naught#1.

---

*Polaris doesn't move. Start from the seams.*
