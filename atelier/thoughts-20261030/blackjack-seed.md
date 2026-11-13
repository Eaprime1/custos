# Perpetual blackjack, and the next iteration pair

`prima-clock: 202610311240` (UTC)
`plank germ` · seed with a hunt and some arithmetic, not developed · origin: the Shepherd, thoughts of 20261030, filed in chat `set-jmdfqh`

*Grows by addition. New material goes under "Added later" with a stamp.*

## What he said

Every conversation hits a blackjack level of something, so the project is in a perpetual blackjack (`*` marks an interrupt). That looks like a sign that it is time to transition into the new Iteration pair. We are building turn by turn, step by step. He asked for details on blackjack: how many in a deck, and a blackjack hunt.

## How many in a deck

Computed, not recalled (a short run of the arithmetic):

| Fact | Value |
|---|---|
| Cards that make a blackjack with an ace | the 16 ten-value cards (10, J, Q, K in four suits) |
| Ace plus ten-value pairings | 4 × 16 = **64** |
| All possible two-card hands from 52 cards | 1,326 |
| Chance a two-card hand is a blackjack | 64 ÷ 1,326 = **4.83%**, about 1 in 20.7 |
| Most blackjacks one deck can make at once | **4** (it has only four aces) |
| Expected blackjacks if a whole deck is dealt out as 26 pairs | 26 × 4.83% = **about 1.26** |

## The hunt (repo and Jira, 202610311240 UTC)

- **62 files** in the repo mention it. By folder: `moav/` 11, `incoming/` 10, `atelier/` 8, `valuation/` 7, `pr-journeys/` 7, `dungeon-master/` 4, `docs/` 3, `world/` 2, `turns/` 2, `state/` 2, `tools/` 1, `prima-clock/` 1.
- **One branch** carries the name: `feature/session-202607-blackjack21`.
- **One file** is named for it: `atelier/blackjack_21_convergence.json`.
- **Jira:** no ticket in KAN or NEXUS mentions it yet.

What the repo already says about it, in its own words:

| Where | It says |
|---|---|
| `atelier/blackjack_21_convergence.json` | "21 is the perfect hand — not by force, by accumulation. Each card added was right. Stop here and the hand is won. Go further and it breaks." |
| `world/deck-master.md` | "The current iteration is 21 — Blackjack." The question is always whether a card brings the hand closer to 21 or busts. |
| `docs/issue-system.md` | "21 finishes the layer ('Blackjack')." |
| `world/symbols.md` | The `21` names the blackjack hand and the twenty-first iteration. |
| `state/STATE_SCHEMA.md`, `state/custos_state_202606242044.md` | A "blackjack event" is a moment significant enough to need real adjustment on the fly, named there as healthy stress. |
| `prima-clock/registry.md` | "Blackjack Iteration active", since 202605290028. |

## Reading (mine, not his)

- In the project's own terms, 21 is where you **stand**: the layer is finished, and going further breaks it. If every conversation now reaches a blackjack level, the layer may be full, and his sense that it is time to move on agrees with what the repo already says about 21.
- "Iteration pair" is not defined anywhere I found. One guess, held loosely: the pair of **primal** and **shadow**, since he has said the project is in shadow and primal is about to launch. It may be something else.

## Not known

- What the "new Iteration pair" is, and what the next iteration is called.
- Whether he wants a Jira record for it. I would add a thread **T15, "Next iteration pair after Blackjack 21"**, to `.claude/threads.md` once #503 has merged, so the two edits do not collide.

## Added later

(nothing yet)
