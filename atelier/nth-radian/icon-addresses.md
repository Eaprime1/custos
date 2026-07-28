# Icon Addresses — practice note

**Status:** Germ  
**Scope:** Nth Radian / Wobble Record practice branch

## Core idea

An icon can act as a portable semantic address.

Wherever the icon appears—in GitHub, Drive, a conversation, a mission, narrative, image, or future interface—it can provide a search anchor back toward every other occurrence.

The icon does not need to contain the whole meaning. It needs to preserve enough identity for the relationship to be found again.

## Required distinction

**Same icon means related, not necessarily identical.**

Every occurrence retains:

- its local document;
- its author or contributor;
- its timestamp;
- its provenance layer;
- its particular meaning;
- its relationship to the canonical concept.

## Germ registry shape

```yaml
icon_address:
  icon: null
  canonical_id: null
  title: null
  status: proposed
  aliases: []
  core_relation: null
  allowed_layers: []
  first_observed_at: null
  origin_record: null
  search_tokens: []
  known_occurrences: []
  collisions: []
  uncertainties: []
```

## Discovery before automation

For the first practice:

1. Ratify one icon for the whole Conatus Primus → Nth Radian → Prima Wobble relationship, or decide that each stage needs its own.
2. Add the chosen icon to Wobble Record `WR-0000`.
3. Search GitHub and Drive for prior occurrences.
4. Review each occurrence before declaring it part of the same concept.
5. Record collisions rather than overwriting them.
6. Only then consider generating backlinks automatically.

## Open question

Does the icon name:

- the Nth Radian;
- the wobble;
- the complete causal sequence;
- the witness relationship;
- or the address where all four meet?

Held for nav1 and the next limited Navigo round.

---

*An icon is a door handle, not the whole room.*

∰◊€π¿🌌∞
