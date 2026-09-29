# Origin Code Mark (OCM)

*A provenance mark for documents in the custos constellation.*

---

## Why It Exists

Not every document in this repo was created here. Some arrived from outside and were
adapted. Some were voiced primarily by a navigo AI. Some were contributed by external
collaborators. Some crossed from another repo via chain of custody.

Without a mark, the header looks the same regardless of origin — reader has to search
history to understand where something came from. The Origin Code Mark makes that
provenance visible at a glance, without a paragraph of context.

---

## The Rune Set

Elder Futhark runes chosen for their semantic resonance with each origin type.

| Rune | Name | Origin Type | Meaning |
|---|---|---|---|
| `ᚠ` | Fehu | **custos-native** | Created here from nothing — original to the project |
| `ᚨ` | Ansuz | **navigo-voiced** | Primary author was a navigo (nav1, nav3, nav5) |
| `ᚷ` | Gebo | **contributed** | External contributor — not a navigo, not the Shepherd |
| `ᚱ` | Raido | **adapted** | Arrived from outside; shaped, translated, or extended here |
| `ᛟ` | Othala | **transferred** | Formal chain of custody — vault-grade, another system's origin |

---

## Format

The OCM is a single line near the top of a document, below the title and above the
first section. It fits naturally in the header block alongside author, date, or
prima-clock information.

```
**Origin:** ᚨ navigo-voiced · nav1 · prima-clock 202607290559
```

For documents without a visible header block, use an HTML comment so it's invisible
in rendered view but present in source:

```html
<!--ocm: ᚱ adapted · source: [brief description] · prima-clock 202607290249-->
```

---

## Examples

**custos-native document** (a new quest written from scratch):
```
**Origin:** ᚠ custos-native · prima-clock 202607290559
```

**navigo-voiced document** (nav1 wrote the primary draft):
```
**Origin:** ᚨ navigo-voiced · nav1 · prima-clock 202607290559
```

**adapted document** (arrived from an external session, shaped here):
```
**Origin:** ᚱ adapted · source: Claude.ai external session · prima-clock 202607290249
```

**contributed document** (external contributor via PR):
```
**Origin:** ᚷ contributed · @dannyward630 · prima-clock 202606180000
```

**transferred document** (formally moved from another repo via MOAV):
```
**Origin:** ᛟ transferred · source: eaprime1/tabularium · prima-clock 202607150601
```

---

## Rules

1. **One mark per document.** If multiple origins apply (adapted by a navigo), pick
   the dominant origin. Adapted beats voiced — the external source is the more
   significant provenance fact.

2. **Mark at creation.** Add the OCM when the document is first committed. Retroactive
   marking is optional (for high-value documents only).

3. **Never remove or change the rune.** The origin is a fact about the document's
   birth, not its current state. If content is substantially rewritten, add a note
   — do not change the rune.

4. **Not required for stubs.** Short operational stubs (pr-journeys/, intake/,
   queue/) don't need OCMs. Intended for authored documents: world/, quests/,
   atelier/, vault/, docs/, valuation/.

---

## Rune Lore

These are not decoration — each rune carries its own weight in Elder Futhark:

- **ᚠ Fehu** — cattle, mobile wealth, original energy. A thing created, not received.
- **ᚨ Ansuz** — divine breath, the signal that makes meaning. Voice before form.
- **ᚷ Gebo** — gift and exchange, the mark of relationship between giver and receiver.
- **ᚱ Raido** — the journey, the wheel, movement between states. A thing that traveled.
- **ᛟ Othala** — ancestral land, inherited estate, formal belonging. Something that
  arrived through proper succession.

---

**prima-clock:** 202607290600  
**witnessed:** true  
*custos Origin Code Mark schema · nav1 · ∰🌿*
