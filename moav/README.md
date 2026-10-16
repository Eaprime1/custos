# MOAV CARRIERS


MOAV (Mother of All Vinegar) — transformation/fermentation path.


JSON carriers live here. Each carrier documents a formal transition:
content moving between iteration states, suit assignments,
branch extractions, and vault designations.


Naming convention: [entity]_moav_[event].json; each carrier must include its prima-clock stamp in the JSON payload.


## Existing Carriers

Index checked against the 13 files in `moav/` at stamp 202610160100 (UTC). Columns are read from each
file's own fields; nothing here is a judgment. "Note" is blank where I had no description from the file name or the earlier list.

| Carrier | prima_clock | motion_state | chain_of_custody | Note |
|---|---|---|---|---|
| custos_moav_founding.json | 202605271650 | EXPANDING | OPEN | origin carrier |
| five_lakes_valuation_moav_bridge.json | 202606112205 | EXPANDING | OPEN | Five Lakes Valuation System bridge |
| custos_moav_journey001.json | 202606132130 | EXPANDING | OPEN | first journey/valuation carrier |
| custos_moav_external_submission001.json | 202606190012 | EXPANDING | CLOSED | first external contribution merged (PR #38) |
| custos_moav_intake_prenullus001.json | 202606190952 | WITNESSED | OPEN | |
| custos_moav_intake_prenullus002.json | 202606301027 | WITNESSED | OPEN | |
| custos_moav_intake_prenullus003.json | 202606301128 | WITNESSED | OPEN | |
| custos_moav_delivery_clubofjacks001.json | 202607010209 | WITNESSED | OPEN | |
| custos_moav_sparstone_handoff.json | 202607051456 | (none) | list | sparstone/spectrum/radix handoff, chat to code |
| custos_moav_keeper_seed_launch.json | 202607060200 | (none) | list | |
| custos_moav_transfer_conceptgrain001.json | 202607150601 | COMPLETE | CLOSED | first cross-repo custody transfer |
| praevium_moav_sparstone-nomination.json | 202607212328 | (none) | list | |
| custos_moav_prsweep_202607290523.json | 202607290523 | CLEARING | OPEN | |

`chain_of_custody` has three shapes today: the string `OPEN` (8 files), the string `CLOSED` (2), and a list (3).
No rule written in this repo says what makes a carrier `CLOSED`; the two that are closed record a finished event
(a merged contribution, a completed transfer). Whether `OPEN` should stay on a carrier whose `motion_state` is
`COMPLETE` is an open question, raised by hodie's Pass 3 letter (peer swap, `atelier/peer-swap/exchange/`).
