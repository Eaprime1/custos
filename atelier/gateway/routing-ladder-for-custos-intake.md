# The routing ladder, mapped onto custos's intake folders

`Prima-clock: 202610060920`
`status: DRAFT proposal. Nothing here is applied; every mapping is the Shepherd's to correct.`
`origin: peer review Run 0, finding CP-7. Starting point: pixelator's routing ladder (pixelator pixelate/ROUTING.md, a contribution to custos), adapted.`

## Two axes, not one

Pixelator's ladder answers a question about **condition**: how much attention does this content need before it enters the live stream?

| Condition | Route (from the ladder) |
|---|---|
| Clean and vetted; small cosmetic or clarity edits allowed | Fast track |
| A distressed word or another small problem; a simple fix resolves it | Fix in place, in a review folder, with a note |
| Polluted or in extreme distress | maw (`eaprime1/maw`) |
| Needs a real overhaul plus the fix | hodie |
| Unsure | maw (the most conservative option) |

Custos's intake folders answer a different question about **stage**: where does this wait, and who has it, until it moves on?

| Folder | Stage |
|---|---|
| `intake/` | A fragment before it has a name (THEE, YOD, EMBER). Nothing needs to be finished or understood. |
| `.shadow-well/` | Pre-custody material not yet named, claimed or routed. |
| `queue/artesium-weir/`, `queue/seed-weir/` | The filters between raw material and chain of custody (PDF prints; process and skill seeds). |
| `incoming/pre-nullus/` | Witness copies, ahead of the vault. Filing is not acceptance. |
| `.claude/`, `.gemini/`, `.chatgpt/` (navigo workspaces) | Raw exports from one voice's sessions, before formal custody. |
| `returns/` | Findings returned by external agent streams. |
| `atelier/` | The nursery: concepts before they have names; not finished by design. |

So the two do not compete. The proposal is that the ladder is a **gate applied at one point**, when something leaves its waiting place for the live stream, and the folders stay as the places things wait.

## Proposed mapping

1. **Fragments never meet the ladder.** `intake/` and `.shadow-well/` take anything, unfinished. The ladder applies only when a fragment is promoted out of them.
2. **The gate sits at the exit of each waiting place**, in the step each folder already has (the Weir's review, a workspace's rename-to-`.md` review, the Shepherd's acceptance into the vault). It adds one question to that step: *which rung is this?*
3. **Fast track** is the existing path with nothing added: carrier written, content filed where its carrier points.
4. **Fix in place** needs a review folder. Pixelator's draft leaves its name open. Proposal for custos: `queue/review/<prima-clock>_<slug>/`, holding the file as it arrived, the fixed version, and one note saying what changed and why. Both stay in git.
5. **Send to maw** needs a handoff. Proposal: a short carrier in `queue/` naming the item, the reason, and the destination (`eaprime1/maw`), then removal from the live stream once maw's own custody log records the arrival. How content physically gets to maw is not built; pixelator's draft says the same.
6. **Overhaul (hodie)** follows the same carrier-and-handoff shape as maw, with `eaprime1/hodie` as the destination.
7. **Unsure goes to maw.** This is pixelator's rule and custos's own habit (hold, do not guess), stated once.
8. **Record each crossing.** Custos already has the registry (`prima-clock/registry.md`) for significant events. Proposal: a send to maw or hodie is a significant event and gets a row; fast-track and fix-in-place get a line in the carrier only.

## For the Shepherd to decide

- Is the gate at the exit of each waiting place the right shape, or should there be one gate for all of them?
- Does the review folder belong in `queue/`, or in `atelier/`?
- Where does "polluted or extreme distress" begin? Pixelator's draft leaves it open too; it needs a rule (the severity grades in `atelier/lexemes/distressed-lexeme-list.md` are the candidate source).
- Should navigo workspaces (`.claude/`, `.gemini/`, `.chatgpt/`) apply the gate themselves, or only at the point their files move on?
- The roots, the maw handoff and the hodie handoff are unbuilt on both sides.

## What this document is not

It changes no folder, no script and no workflow. Pixelator's ladder is itself a draft that its phone-side conversation has not reviewed, so this inherits that uncertainty.
