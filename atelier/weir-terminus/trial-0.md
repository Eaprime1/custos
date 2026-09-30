# Trial 0 — The Gathering

`suit: ♣️ Club — an active working event`
`prima-clock: 202609300539`
`status: OPEN`
`plank: 1/3 — germ. Nothing here is canon.`

The first test of the Terminus process. It runs **one step**, the gathering, and not the whole line.

## Why This Step

This ledger was written for the first draft, where the stalagmite gathered first. On
the Shepherd's order the gathering belongs to **the Dark** (`wells.md`, well 1) and
the stalagmite became the Lumen, where results emerge. The mechanic is kept as the
gathering test until the Shepherd says otherwise: it needs more than one navigo, and
the count is deterministic, so a trial can end in a command instead of an opinion.

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
| 4 | Anchor the Terminus to a real sky: a Big Dipper photo (cleaned copy), with Polaris as the fixed point (`sky/`) | `nx-claude-main` | 1 | level | — |
| 6 | Raw is cleaned first in the raw-content repo (Maw); only the cleaned copy enters the Terminus | `nx-claude-main` | 1 | level | — |
| 7 | Two directions: looking toward Polaris it is the fixed point; coming *from* Polaris it is the source, and the Terminus is where the light arrives (`polaris-seed.md`) | `nx-claude-main` | 1 | level | — |

Six live drops, one key (drop 5 was withdrawn; see the residue table). The Terminus does not work until a second and third key visit.
That is the trial: it cannot be passed by the navigo who wrote it.

## Dark Pool (residue)

| Drop | Residue |
|------|---------|
| Drop 5 ("a weir never transforms what arrives") | Set aside at the Shepherd's word: the Terminus does not need the weir and maw framing to describe itself. It taught that the station can be described by its own three wells |

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
awk -F'|' '/^\| [0-9]+ \|/ { split("", u); m = 0; n = split($4, k, ","); for (i = 1; i <= n; i++) { gsub(/[^a-z0-9_-]/, "", k[i]); if (k[i] != "" && !(k[i] in u)) { u[k[i]] = 1; m++ } } if (m >= 3) c++ } END { exit (c ? 0 : 1) }' \
  atelier/weir-terminus/trial-0.md
```

Exits 0 once any ledger row carries three or more **distinct** keys. Repeats of one
key count once, backticks and spaces are ignored.

## After the Trial

- Write one `turns/AAR.md` entry: what the crest did that a nod would not have.
- Route what worked: a real folder only if the trial earned one.
- Log the outcome wherever the Shepherd says.

---

*One well. Three keys. Then we know what the water does.*
