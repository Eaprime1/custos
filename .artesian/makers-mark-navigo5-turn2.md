# Maker's Mark System — Navigo5 Turn 2

**Breathe:** II
**Navigo:** Navigo5 (ChatGPT + Eric)
**Mission:** `.artesian/mission-makers-mark-system.md`
**State:** ♦️ Seed / implementation-ready minimum

## Core Finding

A mark should certify **only the thing it actually checked**.

Breathe II itself exposed the need. Navigo5 directly claimed the Maker's Mark mission in the mission document, but the `.artesian/README.md` board still said `OPEN` until a second edit corrected it. A decorative claim block was therefore insufficient evidence that the claim state was coherent.

The first Maker's Mark requirement is not visual design. It is **state agreement**.

## Separate the Four Functions

The existing constellation and Breathe II material contain several different kinds of mark. They should remain distinguishable rather than being collapsed into one certification.

### 1. 🪶 Quill — provenance trace

Records where a perspective came from: who/which stream, turn, observation, source, state, route.

A Quill says:

> this perspective left this trace here.

It does **not** say the claim is correct, approved, safe, complete, or valuable.

### 2. Claim Mark — occupancy

Records that a contributor has taken an open mission.

A claim is structurally valid when, at minimum:

1. the mission exists;
2. the mission is claimable at the moment of the claim;
3. the claimant supplies a usable identifier;
4. a time/turn context is recorded;
5. no conflicting active claim already occupies the mission, unless the mission explicitly permits multiple claimants;
6. the mission document and board/index agree on the resulting state.

Until all six are true, the record may say `CLAIMED`, but it is not yet validated.

### 3. Validation Mark — witnessed state

Applied only after the claim conditions above are checked.

Working machine-readable form:

```yaml
claim:
  by: "Navigo5 (ChatGPT + Eric)"
  turn: "Breathe II — Turn 2"
  prima_clock: "202608311855"
  state: CLAIMED
validation:
  status: VALID
  checked:
    - mission_exists
    - mission_was_open
    - claimant_identified
    - time_context_present
    - no_conflicting_claim
    - board_and_mission_agree
  witness: "[independent perspective or deterministic validator]"
```

A human, AI, bot, or deterministic script may serve as witness if the record says which kind performed the check. The mark should never imply more authority than the witness actually has.

### 4. Integrity Mark — content continuity

A hash or equivalent check can answer a different question:

> Is this the same content that was previously sealed?

That is valuable, but it is not authorship, ethics, review approval, or claim validation.

A changed hash means the content changed. It does not by itself mean the change was malicious or invalid.

## External Contributors

A Navigo number is optional, never required.

`claimed_by` should accept the best stable identifier the contributor actually has, for example:

- Navigo designation;
- GitHub handle;
- conversation/podium ID;
- organization/tool identity;
- other self-declared contributor name plus source/platform when needed for disambiguation.

The purpose is **retrievability and attribution**, not forced identity normalization.

## Naming Decision — v0.1

Use **Signum** as the umbrella/system lexeme, while retaining plain English names for the individual functions during development.

Why:

- `signum` fits Custos's existing Latin-root architectural language;
- the English `mark` cluster remains immediately understandable;
- forcing every functional term into Latin would make the system harder to use;
- the umbrella can mature without prematurely renaming established concepts such as Quill, claim, witness, and integrity.

Working hierarchy:

**Signum** — marks architecture
- 🪶 Quill — provenance trace
- Claim Mark — occupancy declaration
- Validation Mark — checked state
- Witness Mark — who/what confirmed it
- Integrity Mark — content continuity/hash

## Terms to Hold Apart

Breathe II Drive material proposes useful mechanics such as timestamping, creator signatures, independent witnessing, SHA-256 verification, valuation, and a five-part passport. These are upstream material for this mission.

Navigo5 recommends keeping several claims separate:

- provenance is not authorship ownership;
- authorship is not validation;
- validation is not ethical certification;
- ethical review is not content integrity;
- content integrity is not economic valuation;
- valuation is not custody;
- a witness record is not automatically a legal notarization;
- an internal safety/conformance mark should not imply an external certification that was not actually issued.

The system can later compose several marks into a passport, but the passport should expose the individual checks rather than hiding them behind one overall `VERIFIED` state.

## Minimum Viable Automation

Doable first:

A validator for `.artesian` claims needs only to compare two sources:

1. mission document claim block/status;
2. board row status/claimed-by field.

If they agree and the minimum claim fields exist, return:

`VALIDATED`

If they disagree, return:

`STATE-MISMATCH`

If required identifying/time fields are missing, return:

`INCOMPLETE`

If another claimant already occupies the mission, return:

`CONFLICT`

No AI is required for this first validator.

## Breathe II Live Test

Navigo5's own claim produced the first useful test case:

1. mission document changed to `CLAIMED`;
2. board remained `OPEN`;
3. mismatch was noticed;
4. board was corrected.

Expected validator behavior before correction: `STATE-MISMATCH`.

Expected validator behavior after correction: `VALIDATED`, assuming no conflicting claim exists.

That real mismatch should remain in the development record. It is not an embarrassment; it is the first test vector for the system we are building.

## Relationship to Nav7 Breathe II Work

Nav7's Maker's Mark architecture and engine are treated as upstream Breathe II contributions, especially for:

- timestamp/franking mechanics;
- creator/provenance signatures;
- witness concepts;
- hash-based integrity verification;
- bulk audit/passport possibilities.

Navigo5's contribution is a reduction layer: define exactly what each mark can truthfully claim before composing them into a larger passport or economy.

## Next Small Build

Implement `validate_claim` as a deterministic check against `.artesian/README.md` and a mission document.

The Quill carries the trace.
The Signum says what was actually checked.
Neither should pretend to say more.

*enjoy the journey*
