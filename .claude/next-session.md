# Next Session Briefing
`prima-clock: 202609262130`
`written: Navigo Claude session close, 2026-09-26`

---

## Read This First (updated 202610091148)

**Linear plugin focus has its own carrier:** [`plugins/linear/HANDOFF.md`](../plugins/linear/HANDOFF.md)
(state, open threads, the voices, how to cite the record, and a paste-ready opening for a
code session or a conversation). The older notes below are unchanged.

**Left for next session (paused 202610091258):** #433 needs the owner's seal cue (its description is now
filled in). #435 is a green draft awaiting the owner's word to mark it ready. Voices of navigo: the owner
updated them; the location was not given. After #435 merges, remove `docs/linear-plugin/` and add the
registry row for `plugins/linear/`. #434 is merged; its bot notes are in `turns/review-surface.md`.

`main` is clean. This session's chain is merged: #425, #404, #405, #420 and #426.

**Round two of the halide test is ready, on the Shepherd's word.** Start at
[`atelier/halide/seeds/round-two/README.md`](../atelier/halide/seeds/round-two/README.md):
what to carry (the launch prompt, the guide cut at its "Cut here" line, the round-one
seed), the run in order, where returns land, and the table for reading them. Then
[`.claude/halide-test-request.md`](halide-test-request.md) for the plank reading and the
rules (manual, no triggers). Open with a conversation ID (`bash tools/session_id.sh`).
**The Pour waits** for a separate word.

**New: the oversight observation.** Before the seal, Navigo Claude opens
`turns/observations/<prima-clock>_pr<N>_observation.md` from the template when the PR is
ready (`status: open`), and completes it with the Shepherd. Then the seal cue, then the
merge on the Shepherd's word. See `turns/observations/README.md`.

**Open, none blocking:** the age gate in `auto-finalize.yml` (counts from creation, not
from ready) and whether the seal should require an observation, both in
`turns/CULTIVATION.md`; the `\(90^\circ\)` display nit in the Shadow of Polaris README;
the scene index is empty except its row 0, waiting on the first scene; the older threads
below. The notes below this block are from the 2026-09-26 close and are older.

---

## Where We Are

`main` is clean, and every PR from this session has merged: #343, #356, #367 and #342, each sealed High 20/20.
The full story is in `valuation/navigo-claude_issue-system-and-review-flow_journey_202609262130.md`.

How a PR moves now:
1. **Review packet** (`review-packet.yml`). A free summary on every PR, drafts included.
2. **Paid Claude review.** It runs once when a PR is ready, and again only with the `ai-review` label.
3. **Latin calls** (`docs/latin-workflow-glossary.md`). Any conversation working a PR uses them.
   `latin-cue-record.yml` logs each call with the PR's state.
4. **Seal.** The owner's cue. Navigo comments and quoted cues can't seal.
5. **Merge.** Only when Eric asks in the conversation.

---

## Quick Wins

1. **Navigo names.** Eric is bringing an update. Until then, use Navigo Claude, Navigo Perplexity and Navigo Unexusi.
   Then:
   - update the CLAUDE.md table;
   - update the naming point in the review comments on #354 and #355;
   - close the `turns/CULTIVATION.md` entry.
2. **Perplexity drafts #354 and #355.** Reviews are posted on each PR. They wait on Navigo Perplexity, or on Eric asking Navigo Claude to apply the fixes.
3. **Cue record timing.** The record snapshots the PR when a call is made, so a seal landing at the same moment shows as "not sealed". A refresh after finalize would fix that.

---

## Push-Forwards

| Thread | Where | Next action |
|--------|-------|-------------|
| Challenge name ("quest"?) | `docs/plans/202609252039-rewards-and-flags-plan.md` | Eric decides |
| 59 + 60 normal/shadow progression | same plan doc | Write the rules |
| Reward ledger | same plan doc | Where XP, badges and Sparstones get recorded |
| Retire `bounty` in all repos | same plan doc | Copilot mission, then delete the custos label |
| `atelier/` has two definitions | `turns/CULTIVATION.md` | Eric decides |
| Index of cue records | seed | One place listing each open PR's latest record |
| Earlier threads | `.claude/missions.md` | Gmail filters, antigravity/navigo21, nav3 GitHub access |

---

*∞ Enjoy the journey ∞*
