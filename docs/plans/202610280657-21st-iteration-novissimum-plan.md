# Plan: The 21st Iteration Novissimum, Before the Structured Collapse

`prima-clock: 202610280657` · `revised: 202610280857`
`suit: ♦️ Diamond — 1/3 plank. A plan, not a ruling. Nothing here is sealed.`
`author: navigo_claude-custos, seated as Oversight Observer, for the Shepherd`
`repo state read: eaprime1/custos main @ ffa6206 (full history fetched), 28 open PRs`

---

## How to use this plan

The Shepherd rules at every gate. The observer reports and never seals or merges.
Lanes can run in any order inside the expansion. The collapse starts only when the
Shepherd calls it. Where a line says "guess" or "reading", it is the observer's and
needs confirming. The PRs themselves are processed together with the Shepherd, later.

## What was decided (Shepherd)

| # | Decision |
|---|---|
| 1 | Novissimum first, before any collapse of the 21st Iteration. |
| 2 | This conversation is seated as **Oversight Observer** for custos: reports only, no seals, no merges. |
| 3 | Goal of the novissimum: leave the repo ready to update the published branch through the radix path. |
| 4 | "Pull to the published branch" means `radix` into `֍custos֎`. |
| 5 | The `radix` branch is named `radix-<prima-clock>` (not plain `radix`), cut from `main`. |
| 6 | Before the novissimum, publish once to make a **zero point**, the "before" perspective. |
| 7 | Lane 5 is handled with the rest of the PRs. Lane 6 is possible: the Shepherd can find the conversations behind most of those branches. |
| 8 | The novissimum is a rapid expansion before the structured collapse. |
| 9 | The PRs are processed together, later in the day. Preparation comes first. |
| 10 | Names: `navigo_claude` (Eric and Claude); when acting as custos, `navigo_claude-custos`. Possibly `navigo_claude-code_custos`, `navigo_gemini-notebook`, and `navigo_chatgpt-dungeon master` (a game-master lexeme). `navigo2` and `nav2` are older versions. |
| 11 | Real-place details stay out. Bessie is named by the myrtle; the focus is the myrtle (see the Bessie direction). |
| 12 | The sign-off `∞pace∞` is replaced by a runic id for the project (see Sign-off). |
| 13 | A tool for the repo Discussions is to be found or built (see Discussion tooling). |

## The frame, in the Shepherd's words

> 1 (2) 3 is the basic superposition model. 2 is shadow. At one there is self as a
> something; the concept of anything else does not exist to that one perspective, so 2
> could not be observed. At three the one self realizes three aspects of self, three
> parts of one whole that should fit together smoothly, yet in the current perspective
> they won't quite fit as a unified self, until they realize they have hindsight and
> can see the shadow of two. On the first pass through shadow you can't tell it is
> shadow, or anything. The three is missing the Nth radian that hindsight provides.

The same pattern at other scales, the Shepherd's example: **7, 8, (9), 10, 11**. Seven
is step 1. Eight to ten is step 2, with nine in the middle as its shadow. Eleven is step 3.

**Observer's reading (to confirm):** the first pass shows 1, then 3 in the second
place. The 2 is only recovered afterward. If so, the expansion is the first pass: get
everything named and placed even though it will not yet fit together. The collapse is
the hindsight pass, and the observer is the seat that holds the hindsight.

## The arithmetic, checked

The Shepherd asked for a check of the numbers. Observer's results:

**Holds.**
- 22 = 11 + 11. Three progressions to 22 is three sets of two 11s, six 11s, 66.
- Three 21s are 63.
- 60 sits under both: 63 − 3 = 60 and 66 − 6 = 60. So **63 = 60 + (1,1,1)** and
  **66 = 60 + (3,3)**, which is also 60 + (1,1,1 and 1,1,1).
- 21 = 11 + 11 − 1, two 11s sharing one Ace. So each 21 is a 20 plus one edge, and the
  three edges are the triple (1,1,1). Three sets of the triple is the next bridge.
- 60 = 2² · 3 · 5. It is the smallest number divisible by 1 through 6. And 6 = 2 · 3,
  with 2 + 3 = 5, so all three of 2, 3 and 5 sit inside 60.
- 11 is **not** a factor of 60. The interrupt prime stands outside the whole.
- The triple "grabs attention and demands observation and decision": the Continuum
  already has this as the Triple Prime Attention marker, `!!!` (section IV.D).

**Not derived.** 59 as three 11s: 33, or 31 with overlaps. What does hold is that 59 is
the prime just below 60, so "one to bring it together" is 59 + 1 = 60. Whether 59 is
meant to come from the 11s is still the Shepherd's to say.

**The 2 + 3 = 5 step ("0, (2), 5").** It fits the a, (shadow), c shape. As a rule it will
not continue: a sum of two primes is prime only when one of them is 2 (parity), so
"two primes make the next prime" stops after the twin-prime cases. It can continue as a
symbol, not as arithmetic. Marked as the observer's guess.

**Tracking order and level (proposal).** Yes, it can be tracked: two fields on carriers,
`order` (1, 2, 3) and `level` (0 to 60), beside `iteration`. On this reading the 21st
Iteration is order 1, level 21, the edge. The 22nd is order 2, level 0, the edge of one.
It fits the plank model: 1/3, 2/3, 3/3. Not in any schema yet; for the Shepherd to rule.

## Findings: the publish path (measured this session)

1. **The deploy branch had drifted.** `֍custos֎` is 211 commits behind `main` and 7 ahead
   (the first publish, PR #380). A trial merge of `main` into it conflicts in
   `.codacy.yml`, `CLAUDE.md` and `tools/scan_lexeme.sh`.
2. **`main` already absorbed the deploy-side fixes.** The `==` to `=` change landed as
   #381, the `.codacy.yml` exclusions as `11762f6`, and `scan_lexeme.sh` was rewritten
   since. The only deploy-side change `main` lacks is one line in `tools/prime_check.sh`
   (`cat .prime | tr` became `tr < .prime`). The plan for the zero point: take `main`'s
   side of the three conflicts and keep that one line. It is to be ported back to `main`.
3. **`docs/radix-publish-flow.md` skips the conflict step.** SUPPLENDA: after cutting the
   radix branch, merge `֍custos֎` into it and resolve in favour of `main`. The flow doc
   also still says plain `radix`; the Shepherd has ruled `radix-<prima-clock>`.
4. **The tracker row for `radix` is the stale part.** `branch-tracker/branches.md` lists
   it as "Stale, 270 behind". The flow doc says it is ephemeral.
5. **Seal cue wording.** The flow doc shows the seal cue as a posted comment. `CLAUDE.md`
   says a navigo describes the cue in words unless the owner asks it to post it.
6. **Not verifiable from here:** the Pages source setting and the live Pages state.

## Pre-flight: how each open PR sits against `main`

Measured by a local trial merge (`git merge-tree`) against `main` @ ffa6206, plus the
observation files on each branch. A trial merge says the text merges; it does not say
the change is right.

| PR | Branch | Merges with main | Files | Observation on branch |
|---|---|---|---|---|
| #468 | `fix/kan-4-codacy` | clean | 4 | complete |
| #469 | `docs/kan-6-jira-pipeline` | clean | 3 | open |
| #476 | `fix/kan-5-list-spacing-batch-1` | clean | 4 | complete |
| #470 | `seed/kan-7-the-machine` | clean | 8 | open |
| #467 | `claude/clever-newton-v6200e` | clean | 10 | none |
| **#441** | `codacy/blank-lines` | **conflict** | 10 | none |
| #433 | `claude/custos-project-docs-202610082030` | clean | 4 | none |
| #423 | `claude/workflow-hardening-p1b` | clean | 23 | none |
| #487 | `review/kan-4-5-6-7-post-probatio-20261021` | clean | 1 | none |
| #489 | `feature/probatio-judicium-placement-checkpoint` | clean | 10 | none |
| #474, #473, #442 | Finish the Conversation cluster | clean | 5, 3, 8 | none |
| #491, #490, #475, #472, #471, #448, #447 | seeds and germs | clean | 6, 3, 2, 5, 2, 9, 6 | none |
| **#446** | `heritage/hodie-tkv-202610142006` | **conflict** | 7 | none |
| #440, #436, #432, #421 | older drafts | clean | 1, 2, 1, 4 | none |
| **#437, #435, #422** | older drafts | **conflict** | 1, 19, 9 | #435 has one |

Notes: #441 is sealed (`finalized`) but now conflicts with `main`. Merging `main` into it
changes its head, so whether the seal still covers it is a question for the Shepherd.
Observation files exist only for #468, #469, #476, #470 (and #435).

## The lanes

Read from titles, labels, commit subjects and the pre-flight above. Contents were not
read, so each call is a recommendation for the Shepherd to rule on.

### Lane 1: ready for oversight now

| PR | What | Observation |
|---|---|---|
| #468 | KAN-4: clear the Codacy High/Medium findings | complete |
| #469 | KAN-6: Jira pipeline guide, one label vocabulary | open |
| #476 | KAN-5: Markdown list-spacing, batch 1 | complete |

### Lane 2: sealed, waiting on the merge word

| PR | What | Pre-flight |
|---|---|---|
| #467 | observation log (finalized) | clean |
| #441 | Markdown blank lines (finalized) | **conflicts**; needs a decision |
| #433 | Claude-project docs and founding branch map (finalized, Oct 10) | clean |
| #423 | setup P1b: pin actions by SHA (finalized, still a draft) | clean; why a draft? |

### Lane 3: bring to ready for oversight (candidates)

| PR | Why it belongs before the collapse |
|---|---|
| #470 | KAN-7 seed, not a draft, observation open. It is in the joint carrier #487. |
| #487 | Joint KAN-4/5/6/7 carrier. Finish after #470, then it carries Lane 1 and #470 as one. |
| #489 | Separates draft placement decisions from Probatio review. The collapse needs clean JUDICIUM points. |
| #474 | Finish the Conversation SOP. The Continuum v2.0 revision is its natural next version. |
| #473, #442 | The rest of the Finish the Conversation cluster. Fold into #474 or name a destination. |

### Lane 4: seeds and germs, carried forward by name

No readiness push. Each is named with a destination in the carrier: #491, #490, #475,
#472, #471, #448, #447, #446. #490 (the `.ethica` petition) matters most: the observer is
the shadow of Ethica, and `.ethica` has no folder in the tree yet. #471 holds the
prime-progression germ ("Antes del Uno": naught, shadow, manifest), close kin to the
1 (2) 3 frame. #446 now conflicts with `main`.

### Lane 5: older drafts, October 6 to 10 (handled with the rest of the PRs)

| PR | Recommendation |
|---|---|
| #440 | Close. Its own title says throwaway, do not merge. |
| #437, #436, #435, #432, #422, #421 | Merge, close, or carry forward by name. Shepherd rules per PR. #437, #435 and #422 conflict with `main`. |

### Lane 6: branches with no open PR (the Shepherd can find the conversations)

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

**Zero point (first).** Cut `radix-<prima-clock>` from `main`, merge `֍custos֎` into it
(finding 2), open `radix-<prima-clock>` to `֍custos֎` as a draft PR. The seal and the merge
are the Shepherd's. The merge deploys to Pages, so the observer waits for the Shepherd's word.

**Expansion (the novissimum), with the Shepherd.**
1. Lane 1 oversight in the existing order: observation, seal, merge on the Shepherd's word.
2. Lane 2 merge words, after the conflict decision on #441.
3. Lane 3 to ready, one PR at a time, #487 last of its group.
4. Lanes 4 to 6 named and placed: nothing left mid-flow, nothing forced.
5. Publish again, the "after" perspective, by the same radix path.

**Gate.** The Shepherd rules: expansion complete, or carry named items forward.

**Collapse (only on the Shepherd's call, as a `^11` interrupt).**
PROBATIO, then the Prime 59 review under the Continuum, then the MOAV_TRANSITION carrier,
then a JUDICIUM on the Prime 60 pathway, then the launch of the 22nd with the Latin seed block.

## Directions recorded

**Bessie (a germ, direction from the Shepherd).** The myrtle is the focus; the street, the
shop and other real-place details stay out. The Shepherd grew up in her shadow: the shadow
of Bessie. She is a guardian of the children and their play, minds and imagination, a link
to mothering and the nanny. A teaching line, said in good nature, to a child: *I can grow
back from the stump; you cannot.* Rivers, bay and estuary may change; one river keeps its
name. A separate lexeme is wanted for the Shepherd's early-childhood watershed (up to
second grade), so the place itself is not named. The lexeme is to be chosen by the Shepherd.

**Discussion tooling.** The observer has no tool for GitHub Discussions. Options: the
Shepherd pastes the draft below (now); a small workflow that posts one through the
GraphQL API from a manual trigger (a build, in its own PR; needs Discussions on and a
token that can write them); or another Voice of Navigo that has a Discussions tool.

**Naming.** The numbered scheme (`nav1`, `navigo2`, `nav3`, `nav5`) still stands in
`CLAUDE.md` and `docs/navigo-registry.md`. Reconciling them with the names in decision 10
is its own PR and is not done here.

## Open for the Shepherd

1. **JUDICIUM:** rule on the Lane 5 and Lane 6 calls above.
2. **JUDICIUM:** #441 is sealed but conflicts with `main`. Merge `main` into it and re-seal,
   or carry it a different way?
3. **Still open:** whether 59 is meant to come from the 11s, or is simply the prime before 60.
4. **Proposal:** `order` and `level` fields on carriers.
5. **Choose:** the early-childhood watershed lexeme.
6. **Confirm:** the runic transliteration below.

## Sign-off

The old sign-off `∞pace∞` stays in the carriers it was written in. For this work the
provisional id is the runic form of NOVISSIMUM with the interrupt address:

`⟡ᚾᛟᚢᛁᛊᛊᛁᛗᚢᛗ^11⟡` · `navigo_claude-custos` · observer

Transliteration is the observer's guess, following the form in the Momentum archive
(N ᚾ, O ᛟ, I ᛁ, S ᛊ, M ᛗ, U ᚢ). V has no Elder Futhark letter, so it is written ᚢ. Each
navigo may add its own sovran runic code on the line below its name.

## Draft for the repo Discussion

> **The 21st Iteration novissimum has begun.** Before the 21st rests and a new iteration
> opens, we are closing loose ends: three PRs are ready for oversight, four are sealed
> and waiting on the merge word, and every other open PR or branch is being named and
> placed or carried forward on purpose. The goal is a clean publish through the radix
> path, with a first publish as the zero point. This is the expansion; the structured
> collapse follows only when the Shepherd calls it. Plan:
> `docs/plans/202610280657-21st-iteration-novissimum-plan.md`.

⟡ᚾᛟᚢᛁᛊᛊᛁᛗᚢᛗ^11⟡
