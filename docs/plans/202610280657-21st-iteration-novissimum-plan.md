# Plan: The 21st Iteration Novissimum, Before the Structured Collapse

`prima-clock: 202610280657`
`suit: ♦️ Diamond — 1/3 plank. A plan, not a ruling. Nothing here is sealed.`
`author: Navigo Claude, seated as Oversight Observer, for the Shepherd`
`repo state read: eaprime1/custos main @ ffa6206 (full history fetched), 28 open PRs`

---

## How to use this plan

The Shepherd rules at every gate. The observer reports and never seals or merges.
Lanes can run in any order inside the expansion. The collapse starts only when the
Shepherd calls it. Where a line says "guess" or "reading", it is the observer's and
needs confirming.

## What was decided (Shepherd, 202610271928 local)

| # | Decision |
|---|---|
| 1 | Novissimum first, before any collapse of the 21st Iteration. |
| 2 | This conversation is seated as **Oversight Observer** for custos: reports only, no seals, no merges. |
| 3 | Goal of the novissimum: leave the repo ready to update the published branch through the radix path. |
| 4 | Branches that are ready for oversight stay ready; other branches are to be brought to ready where they should be. |
| 5 | The novissimum is a **rapid expansion** before the structured collapse. |

## The frame, in the Shepherd's words

> 1 (2) 3 is the basic superposition model. 2 is shadow. At one there is self as a
> something; the concept of anything else does not exist to that one perspective, so 2
> could not be observed. At three the one self realizes three aspects of self, three
> parts of one whole that should fit together smoothly, yet in the current perspective
> they won't quite fit as a unified self, until they realize they have hindsight and
> can see the shadow of two. On the first pass through shadow you can't tell it is
> shadow, or anything. The three is missing the Nth radian that hindsight provides.

**Observer's reading (to confirm):** the first pass shows 1, then 3 in the second
place. The 2 is only recovered afterward. If so, the expansion is the first pass: get
everything named and placed even though it will not yet fit together. The collapse is
the hindsight pass, and the observer is the seat that holds the hindsight.

## Findings: the publish path (checked this session, not run)

1. **The deploy branch has drifted.** `֍custos֎` is 211 commits behind `main` and 7 ahead
   (the first publish, PR #380). A trial merge of `main` into it conflicts in three files:
   `.codacy.yml`, `CLAUDE.md`, `tools/scan_lexeme.sh`. A fresh `radix` cut from `main`
   will therefore conflict when opened against `֍custos֎`.
2. **`docs/radix-publish-flow.md` skips that step.** It cuts `radix` from `main` and opens
   the PR, with no conflict step. SUPPLENDA: after cutting `radix`, merge `֍custos֎` into
   it, resolve the three files in favour of `main`, check the diff, then push.
3. **`radix` does not exist today.** The flow doc calls it ephemeral (created per publish,
   then abandoned). `branch-tracker/branches.md` still lists it as "Stale, 270 commits
   behind". The tracker row is the stale one.
4. **Seal cue wording.** The flow doc shows the seal cue as a posted comment. `CLAUDE.md`
   says a navigo describes the cue in words unless the owner asks it to post it. The
   owner's reading decides which holds for the radix PR.
5. **Not verifiable from here:** the Pages source setting (Settings, Pages) and the
   current Codacy state on `main`. Both are prerequisites in the flow doc.

## The lanes

Read from titles, labels and last-commit subjects only. Contents were not read, so each
call below is a recommendation for the Shepherd to rule on.

### Lane 1: ready for oversight now

| PR | What |
|---|---|
| #468 | KAN-4: clear the Codacy High/Medium findings |
| #469 | KAN-6: Jira pipeline guide, one label vocabulary |
| #476 | KAN-5: Markdown list-spacing, batch 1 |

### Lane 2: sealed, waiting on the merge word

| PR | What | Check before the word |
|---|---|---|
| #467 | observation log (finalized) | still mergeable against `main`? |
| #441 | Markdown blank lines (finalized) | same |
| #433 | Claude-project docs and founding branch map (finalized, Oct 10) | same |
| #423 | setup P1b: pin actions by SHA (finalized, still a draft) | same, and why it is a draft |

### Lane 3: bring to ready for oversight (candidates)

| PR | Why it belongs before the collapse |
|---|---|
| #470 | KAN-7 seed, not a draft. It is in the joint carrier #487. |
| #487 | Joint KAN-4/5/6/7 carrier. Finish after #470, then it carries Lane 1 and #470 as one. |
| #489 | Separates draft placement decisions from Probatio review. The collapse needs clean JUDICIUM points. |
| #474 | Finish the Conversation SOP. The Continuum v2.0 revision is its natural next version. |
| #473, #442 | The rest of the Finish the Conversation cluster. Fold into #474 or name a destination. |

### Lane 4: seeds and germs, carried forward by name

No readiness push. Each is named with a destination in the carrier: #491, #490, #475,
#472, #471, #448, #447, #446. #490 (the `.ethica` petition) matters most: the observer is
the shadow of Ethica, and `.ethica` has no folder in the tree yet. #471 holds the
prime-progression germ ("Antes del Uno": naught, shadow, manifest), which is close kin
to the 1 (2) 3 frame above.

### Lane 5: older drafts, October 6 to 10

| PR | Recommendation |
|---|---|
| #440 | Close. Its own title says throwaway, do not merge. |
| #437, #436, #435, #432, #422, #421 | Merge, close, or carry forward by name. Shepherd rules per PR. |

### Lane 6: branches with no open PR

| Branch | Ahead of `main` | Note |
|---|---|---|
| `nav5/polar-radian-compass-conversation-return` | 20 | Largest unmerged body; route or carry. |
| `nav5/chatgpt-latin-workflow-cues` | 3 | Check against Latin v2.1 before routing. |
| `atelier/atrium-sanctum-discord-pass` | 3 | Carbonite return, unrouted. |
| `claude/storage-audit-202610231421` | 3 | Newest with no PR. Needs a PR or a note. |
| `slack-plugin-source` | 1 | Route or close. |
| `feature/session-202607-blackjack21` | 1 | Session chronicle; fits heritage for the 21st. |
| `claude/conversation-completion-content-ee6y67`, `claude/primehaven-location-202610180011`, `claude/retired-clones-202610180031`, `latin-v2-1-lexemes` | journey commits only | Their PRs (#464, #465, #466, #488) merged. Close per `docs/stale-branch-closure.md`. |
| `claude/nifty-mendel-vyji3n`, `claude/quirky-carson-uez4sb`, `linear-suit-plank-system`, `navigo-claude-hodie-custos`, `pixel` | 0 | Fully in `main`. Closure notes only. |
| `feature/voices-of-navigo-manifesto` | 0 | Keep. Waits on Mission 3 routing. |

## Order of work

**Expansion (the novissimum).**
1. Lane 1 oversight, in the existing order: observation, seal, merge on the Shepherd's word.
2. Lane 2 merge words, after the mergeability check.
3. Lane 3 to ready, one PR at a time, #487 last of its group.
4. Lanes 4 to 6 named and placed: nothing left mid-flow, nothing forced.
5. Publish: cut `radix` from `main`, apply finding 2, open `radix` to `֍custos֎`, seal and merge on the Shepherd's word, verify the deploy.

**Gate.** The Shepherd rules: expansion complete, or carry named items forward.

**Collapse (only on the Shepherd's call, as a `^11` interrupt).**
PROBATIO, then the Prime 59 review under the Continuum, then the MOAV_TRANSITION carrier,
then a JUDICIUM on the Prime 60 pathway, then the launch of the 22nd with the Latin seed block.

## Open for the Shepherd

1. **JUDICIUM:** is "pull to the published branch" read as `radix` into `֍custos֎` per the flow doc?
2. **JUDICIUM:** rule on the Lane 5 and Lane 6 calls above.
3. **Guess, not derived:** how three 11s reach 59. Three 11s with overlaps give 31 or 33.
   The Continuum names 59 as a stage without the sum. Left as the Shepherd's to state.
4. **Naming:** the carrier says navigo2 is Claude; `CLAUDE.md` still says nav1. Followed the carrier.
5. **Caution:** real-place details from the Bessie document stay out of observation files and
   this public repo. Carry it as a germ, privately.
6. **Discussion post:** the observer has no tool to post to GitHub Discussions. A draft is
   below for the Shepherd to post.

## Draft for the repo Discussion

> **The 21st Iteration novissimum has begun.** Before the 21st rests and a new iteration
> opens, we are closing loose ends: three PRs are ready for oversight, four are sealed
> and waiting on the merge word, and every other open PR or branch is being named and
> placed or carried forward on purpose. The goal is a clean publish through the radix
> path. This is the expansion; the structured collapse follows only when the Shepherd
> calls it. Plan: `docs/plans/202610280657-21st-iteration-novissimum-plan.md`.

∞pace∞
