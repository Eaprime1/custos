# Suit and Plank

*how a document or concept says where it is in its life*

**Prima-clock:** 202610091052 (UTC)
**Status:** proposal for Deck Master review. Written from Eric's project instructions and the existing `world/five-lakes.md`; nothing here replaces either.

---

## Suits

A suit names the lifecycle state of a document or concept. These are the same four suits as the Five Lakes (`world/five-lakes.md`), read as states instead of places.

| Suit | Name | Of Aces | Meaning |
|---|---|---|---|
| ♦️ | Seed | Diamond | Origin point. A developing entity. |
| ♣️ | Carbonite | Club | Working copies and active development. Any copy of a document is a Carbonite. |
| ♥️ | Aethereal | Heart | Permanent, interactive, living copies. |
| ♠️ | Pinnacle | Spade | The single authoritative master. Vault copy designated. |

## Planks

A plank names how far along a seed is.

| Plank | Meaning |
|---|---|
| Germ | Earliest concept state |
| 1/3 Plank | Work / germ |
| 2/3 Plank | Structure forming |
| 3/3 Plank | Ready for Prima Iteration |
| Crystallized | Formally entered; Pinnacle-ready |

A seed is described by one suit and one plank, for example "♦️ Seed, 1/3 Plank".

## Where this lives in Linear

Linear workspace Qrunexusiam, team QRU. Two label groups were created on 2026-10-09 (UTC):

- **Suit**: Seed, Carbonite, Aethereal, Pinnacle
- **Plank**: Germ, 1/3 Plank, 2/3 Plank, 3/3 Plank, Crystallized

Linear does not allow emoji in label names, so the suit emoji are kept in the label descriptions and in the issue header (`**Motion State:** ♦️ 1/3 Plank`).

Plank to Linear status (confirmed by Eric):

| Plank | Linear status |
|---|---|
| Germ, 1/3 | Backlog |
| 2/3 | Todo, or In Progress when actively worked |
| 3/3 | In Review |
| Crystallized, or extracted to its own repo | Done (with a comment recording the departure) |
| Superseded | Duplicate |
| Abandoned | Canceled |

## Prima-clock stamps are UTC

Eric's home time zone is Pacific; the official clock is UTC. Stamps are `YYYYMMDDHHMM` in UTC (`date -u '+%Y%m%d%H%M'`).

## Open questions for the Deck Master

1. **CLAUDE.md suit list.** It currently reads Spade = pinnacle/vault, Diamond = active development, Club = "sessions / operations", Heart = "reserved". `world/five-lakes.md` and the table above define Club as working copies and Heart as Aethereal copies. Which wording should `CLAUDE.md` carry? This PR does not edit `CLAUDE.md`.
2. **Two uses of suits.** `branch-tracker/branches.md` also uses suits and card ranks for branch roles (for example ♣️K main, ♥️A deploy). This document covers document lifecycle only. Are the two uses meant to stay separate?
3. **Stamp time zone.** `CLAUDE.md` says to generate stamps with `date '+%Y%m%d%H%M'` (local time of the machine). UTC is the official clock per Eric. Should `CLAUDE.md` and the tools move to `date -u`? Existing registry rows are not re-stamped.
