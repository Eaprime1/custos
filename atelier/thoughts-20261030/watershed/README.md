# Watershed (seed): staple foods as streams

`prima-clock: 202610311240` (UTC)
`plank germ` · seed with a runnable toy model, not developed · origin: the Shepherd, thoughts of 20261030, filed in chat `set-jmdfqh` · Jira NEXUS-17

*Grows by addition. New material goes under "Added later" with a stamp.*

## What he asked

Watch a few key indicators (milk, bread, hamburger, eggs, and more) because their price, supply and demand are anchors: milk stands for health and growth, and it carries data, history and a stake in tomorrow. Break each down to its core structures. Bring matching structures together into streams, merging them in a triadic pattern, like merging a PR. Keep going until it is a small watershed, then watch the flow. What happens when the vitamin D stream dwindles, when milk is shut off, when an intermittent energy-drink feed arrives (a "biological flash flood")? What does the effluent carry? Let price, supply and demand adapt and see whether it looks like natural growth. What happens to a body when vitamin A is taken out, physically and emotionally? Quantify almost anything this way. Later: gasoline, oil and fuel, and a used car's value, which falls steeply when new and then settles.

He asked me to pick a couple of items. I picked **carrot** (vitamin A needs a plant source, or the vitamin A stream is nearly empty) and **gasoline** (the energy stream under all the others). Eggs were his own.

## The basket and its core structures

Rounded from general nutrition tables, **not checked against a cited source**. See "What is not known".

| Item (serving) | Vitamin D (µg) | Vitamin A (µg RAE) | Protein (g) | Energy (kcal) |
|---|---|---|---|---|
| Milk (1 cup) | 2.9 | 100 | 8 | 150 |
| Egg (1 large) | 1.1 | 75 | 6 | 70 |
| Beef (3 oz cooked) | 0.1 | 0 | 22 | 210 |
| Bread (1 slice) | 0 | 0 | 3 | 80 |
| Carrot (½ cup cooked) | 0 | 650 | 1 | 40 |

He guessed that milk's vitamin D is shared by "the others likely". Partly true: eggs carry some (in the yolk), beef only a trace, and bread none unless it is fortified.

Gasoline is not in the table. It is an input to every row: farm machinery, fertilizer (made with natural gas), trucking and refrigeration. That part is general knowledge, not checked here.

## Streams, and how the tributaries merge

Per person per day on the model's baseline diet:

| Stream | Total from the basket | Tributaries |
|---|---|---|
| Vitamin D | 3.7 µg | milk 78%, egg 21%, beef 2% |
| Vitamin A | 478 µg RAE | carrot 68%, milk 21%, egg 11% |
| Protein | 33 g | beef 40%, milk 24%, bread 22%, egg 13%, carrot 1% |

Each confluence is written in the PR's own triad: **Intent** (what the stream is for), **What arrived** (who supplies it, in what shares), **Resonance** (what the shape says).

- **Vitamin D.** Intent: keep the body's D store topped up. Arrived: milk 78%, egg 21%, beef 2%. Resonance: one tributary dominates, so the stream is fragile at the source.
- **Vitamin A.** Intent: fill a large, slow store. Arrived: carrot 68%, milk 21%, egg 11%. Resonance: two tributaries and a store, so it is steady and slow.
- **Protein.** Intent: daily repair, no store. Arrived: four real tributaries. Resonance: the most resilient stream in the basket.

Only the three streams above are in the model. A fast "sugar" stream is in as a toy, for the flash flood.

## What the runs showed

Full output is in `RESULTS-model.txt`. These are the toy model's, not the world's.

1. **The baseline holds.** Prices stay at 1.00 and the D status stays at 30, which is the check that the model is not drifting by itself.
2. **Milk stops on day 30.** The milk price pins at the cap at once. The egg price climbs about 7.6 times, because the model's supply is rigid and its demand is not very elastic. D intake falls from 15.0 to 12.1 µg. The body's D status drifts from 30 down to about 24 over the next 90 days and settles, never below the "low" line of 20. The body hardly notices what the market notices on day one.
3. **Why the body barely notices:** the model assumes 75% of the baseline D comes from sun, supplements and other food, set so the baseline is balanced. If that share is smaller in life, the drop would bite sooner. This is the assumption to test first.
4. **Milk off for 30 days, then back.** The milk price is still 14.8 when it returns on day 60 and takes about 30 more days to come most of the way down (1.4 on day 90). The D status dips to about 25.6 and climbs back to 29.4 by day 119, and about 19 servings go unsold while the price is still high. That unsold milk is a piece of effluent made by the price lag.
5. **All vitamin A removed on day 30.** Nothing shows for 200 days, then the reserve runs out at day 229. The stream is slow, so the signal comes late. If only the A in milk and eggs is removed, the reserve lasts until about day 1079.
6. **Energy drink feed.** Two 50 g drinks a day raise the peak of the fast stream about 1.8 times and the area under it about 1.5 times, against meals alone. A flash flood in this toy, though a modest one.

## What the effluent carries (qualitative)

| Where | What comes out |
|---|---|
| Body | Water-soluble vitamins past need, nitrogen from protein past need (the model tallies protein over need), undigested fibre |
| Household and shop | Unsold or spoiled food, as in run 4 |
| Farm | Nitrogen and phosphorus runoff from fertilizer, methane from cattle (general knowledge) |
| Market | Price signals, unmet need, the lag itself |

## What this cannot say

- **Emotional systems.** The model has none. The effects of vitamin A deficiency that are well established are physical (trouble seeing in low light, more infections), and for vitamin D, bone disease. A link to mood is not settled, and it is left here as an open question, not a finding.
- **Real prices.** All market numbers are invented.
- **Quantify almost anything.** The method is general: stocks, flows, lags, reserves, prices. The numbers are not.

## Plinko, the consideration engine

`plinko.py` turns the concepts in his thoughts into slots on a plinko board and drops chips until one slot holds three. The randomness is a pattern (the Rule 30 automaton, started from digits such as a prima-clock), so the same seed always gives the same game. `RESULTS-plinko.txt` has the runs.

Two things the first runs showed, both fixed or stated:
- Short seeds sat in one slot because the pattern needs time to grow in from the edge. A warm-up now skips that stretch.
- **A real plinko board favours the middle.** Over 3,000 games, "one simple contribution per navigo" won 37% and "watershed model" 36%, while "hat narrator" and "effluent ledger" almost never win, and that is the board, not their merit. `--flat` makes every slot equally likely, about 12% each. Use plinko for the feel of it and `--flat` when fairness matters.

With his own stamp `202610310526` as the seed, the plinko board picks the watershed model. With `20261030` it picks fuel and vehicle-value streams. It suggests, and he decides.

## What is not known

- Whether he wants the model to stay a toy, or to take real data. If real, which source for prices, and who checks the nutrient table.
- The nutrient numbers themselves, which need a cited source.
- A first target for the planned validation system (NEXUS-14, thread T14): this input table is a small, honest candidate. A script can check its internal consistency, and a person can check it against a source.
- Fuel, oil and vehicle value are named, not modelled. A vehicle's value could be a slow stream: a steep fall at first that levels off to a floor.

## Files

| File | What |
|---|---|
| `model.py` | The stocks-and-flows toy. Standard library only. `python3 model.py` |
| `plinko.py` | The consideration engine. `python3 plinko.py [--flat] [seed ...]` |
| `RESULTS-model.txt`, `RESULTS-plinko.txt` | Saved runs, 202610311240 UTC |

## Added later

(nothing yet)
