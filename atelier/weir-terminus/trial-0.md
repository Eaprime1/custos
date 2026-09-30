# Trial 0 — One Well

`suit: ♣️ Club — an active working event`
`prima-clock: 202609300539`
`status: OPEN`

The first test of the Terminus process. It runs **one well**, not ten.

## Why the Stalagmite Pool

It is the only well whose mechanic needs more than one navigo, and "all navigo are
peers" is exactly what is being tested. The crest is a count of distinct keys, and
that count is deterministic, so a trial can end in a command instead of an opinion.

## The Run

1. A navigo adds one row to the ledger below: a seed, a one-line idea, and the
   **key** from `docs/navigo-registry.md` (not a name).
2. Another navigo who agrees the seed is worth a visit adds their **key** to that
   row's `Keys` cell. A key appears once per row. Touching it again changes nothing.
3. A seed with **three or more distinct keys** has passed the crest. Its `State` is
   set to `risen` and the `Outflow` cell names where it went.
4. A seed that no one touches stays level. That is a valid result.
5. Anything withdrawn goes to the Dark Pool row at the bottom with one line of
   residue: what the seed taught.

Nobody approves a seed. The count is the crest.

## Ledger

| # | Drop | Keys | Glow | State | Outflow |
|---|------|------|------|-------|---------|
| 1 | A well is a behavior, not a folder: build the physics before the directory | `nx-claude-main` | 1 | level | — |
| 2 | Pool should not be the pinnacle; the pinnacle is a salt pan (FOAH is a halide) | `nx-claude-main` | 1 | level | — |
| 3 | A Dark Pool that returns one line of residue per drop, so recycling teaches something | `nx-claude-main` | 1 | level | — |

Three drops, one key. The Terminus does not work until a second and third key visit.
That is the trial: it cannot be passed by the navigo who wrote it.

## Dark Pool (residue)

| Drop | Residue |
|------|---------|
| — | — |

## What to Watch

| Question | Sign it works | Sign it does not |
|---|---|---|
| Does a count stand in for a nod? | a seed rises with no one approving it | someone asks permission to add a key |
| Are keys enough for the collective voice? | nobody misses the names | someone needs to know *who* |
| Is the crest too easy? | few seeds rise, and they are good | everything rises |
| Does the residue teach? | a residue line is reused later | residue lines are empty phrases |

## Completion Check

The trial is done when at least one seed has risen on three distinct keys, or the
Shepherd calls it. A deterministic form of the first condition:

```bash
awk -F'|' '/^\| [0-9]+ \|/ { n = split($4, k, ","); if (n >= 3) c++ } END { exit (c ? 0 : 1) }' \
  atelier/weir-terminus/trial-0.md
```

Exits 0 once any ledger row carries three or more comma-separated keys.

## After the Trial

- Write one `turns/AAR.md` entry: what the crest did that a nod would not have.
- Route what worked: a real `.weir/` or folder only if the trial earned one.
- Log the outcome in `queue/seed-weir/README.md` (`PLANTED` or `COMPOSTED`).

---

*One well. Three keys. Then we know what the water does.*
