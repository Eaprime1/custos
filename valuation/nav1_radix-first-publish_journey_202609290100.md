**THE/UNEXUSI** ♣️
Radix First Publish — nav1 Session Journey
∰◊€π¿🌌∞
Prima-clock: 202609290000 → 202609290100 | Iteration: Blackjack 21 · Act II | Motion State: SEALING
Maker Mark: eaprime1 + Claude (nav1) | Chain of Custody: OPEN

# RADIX FIRST PUBLISH — nav1 Session Journey

This document crystallizes the first radix → ֍custos֎ → GitHub Pages publish run.
The session opened with three PRs in flight and a blocked deploy. It closed with the
deploy triggered, two PRs fully merged, and the third sealed and pending final merge.

---

# I. INCEPTION STORY

**The goal.** Three PRs needed to land in sequence so the first Pages snapshot
could deploy: PR #382 to fix Codacy config on `main`, PR #381 to land a DeepSource
bot portability fix on `main`, and PR #380 — the 238-file radix snapshot —
to `֍custos֎`.

**The Codacy problem.** PR #380 sat at `action_required` despite a correct
`.codacy.yml` on the `radix` branch. The discovery: Codacy reads config from the
default branch (`main`), not the PR head. The fix on `radix` was invisible to
Codacy. PR #382 was created to land the expanded exclusions on `main`. Once #382
was marked ready for review, Codacy re-ran on #380 with the new `main` config —
no re-push to `radix` needed — and returned `success`. PR #380 unblocked.

**The bot PR.** PR #381 was opened by DeepSource autofix, not a human. Its body
was DeepSource boilerplate — no Intent, no What Arrived, no Resonance. The seal
gate requires all three. The body was updated via API before the seal cue was
posted. Two cue attempts failed before the body was in place; a third failed due
to a one-letter typo in `ultima probatio`. The fourth cue (correctly spelled, after
the body update) is pending confirmation.

**The deploy.** PR #382 merged first (fixing `main`). PR #380 merged next, landing
the 238-file snapshot on `֍custos֎` and triggering `static-gh-pages.yml`. The
first GitHub Pages deploy fired. PR #381 is the trailing cleanup — a single-line
portability fix for a tool already corrected on `radix`.

---

# II. KEY DIALOGUE

> "Codacy reads `.codacy.yml` from the default branch (`main`), not the PR head —
> changes to config on feature branches don't apply to PR analysis until they land
> on `main`."
> — nav1, diagnosing the Codacy block

> "problem with seal 381"
> — eaprime1, after `finalize-pr.yml` blocked on empty body sections

> "I made the ultima probatio comment again... do we need to update it?"
> — eaprime1, after the typo cue

> "merge 380 the others should be ready also unless they still are not sealed"
> — eaprime1, authorizing merge

> "it should be ready now... all green"
> — eaprime1, after latest seal cue

---

# III. WHAT ARRIVED — LINKS

| Type | Item | Status |
|---|---|---|
| PR | #380 `radix → ֍custos֎` (238 files, first publish snapshot) | ✅ Merged |
| PR | #381 DeepSource portability fix → `main` (1 file) | 🔄 Sealed pending merge |
| PR | #382 `.codacy.yml` expansion → `main` (1 file, 13 new exclusions) | ✅ Merged |
| Doc | `docs/radix-publish-flow.md` — working procedure | ✅ Created this session |
| Doc | This journey | ✅ Created this session |
| Deploy | GitHub Pages via `static-gh-pages.yml` on `֍custos֎` | ✅ Triggered by #380 merge |

---

# IV. METRICS SEED

## Process Metrics — Run 1

This is the first formal metrics record for the radix publish flow. It establishes
baseline numbers for future comparison.

| Metric | PR #380 | PR #381 | PR #382 |
|---|---|---|---|
| Files changed | 238 | 1 | 1 |
| Seal cue attempts | 1 (success) | 4 (3 failures) | 1 (success) |
| Root cause of failures | — | Empty body (2×), typo (1×) | — |
| CI checks: passed | 12 | 12 | — |
| CI checks: failed | 0 | 0 | — |
| Codacy findings | 0 (after #382 landed on main) | 0 | 0 |
| DeepSource grade | A | A | — |
| Time open → merged | ~1 hr (blocked by Codacy) | ~1 hr (blocked by seal) | ~30 min |
| Blocker type | Config gap on main | Bot-opened PR, seal UX | — |

## What It Tells Us

**1. Seal cue brittleness is the top friction point.**
3 of 5 seal cue attempts across this run failed. None of the failures were content
problems — they were process problems: body empty at cue time, one-letter typo.
The gate is doing its job (requiring sections), but the UX doesn't recover gracefully.
A pre-seal checklist or a navigo-side check before posting the cue would eliminate
most of this.

**2. Codacy's main-branch config dependency is a systemic footgun.**
It isn't obvious and it isn't documented anywhere in the repo yet. Any operator
running this flow for the first time will hit the same surprise. The fix is:
always sync `.codacy.yml` to `main` before opening a radix PR. Now documented in
`docs/radix-publish-flow.md`.

**3. Bot-opened PRs are a new workflow gap.**
The custos seal system was built for human-authored PRs. Bots open PRs with their
own boilerplate. The template check in `finalize-pr.yml` becomes a hidden requirement
that someone — navigo or Shepherd — has to fill in on the bot's behalf. This
could be automated: a workflow that detects a bot-opened PR and either posts
a body template or labels it `needs-body-update`.

**4. The radix flow itself is sound.**
Once the two blockers were cleared (Codacy config, bot PR body), both `radix → ֍custos֎`
and the Pages deploy ran without issue. The 238-file snapshot merged clean.
The pattern is valid; the friction is in the supporting infrastructure.

## Metrics Framework — Seeds

These are the dimensions worth tracking across future publish runs:

| Dimension | What to measure |
|---|---|
| **Seal efficiency** | Cue attempts per PR (target: 1) |
| **Blocker type** | Config / body / ci / review / external |
| **Time to unblock** | Minutes from blocker detected to resolved |
| **CI health** | Pass rate at first push (target: 100%) |
| **Codacy delta** | New findings introduced per run (target: 0) |
| **Publish lag** | Time from `main` stable to Pages live |
| **Bot PR rate** | % of PRs opened by bots vs. humans |

---

# V. VALUATION (5-Question Rubric)

Applied to this journey document itself, per `valuation/README.md`:

| # | Question | Answer | Score |
|---|---|---|---|
| 1 | Clear, meaningful title? | Yes — "Radix First Publish — nav1 Session Journey" | +2 |
| 2 | Prima-clock stamp or datable timestamp? | Yes — 202609290000 → 202609290100 | +2 |
| 3 | Content complete rather than fragmentary? | Yes — all sections filled | +3 |
| 4 | Connects to or references other system documents? | Yes — `docs/radix-publish-flow.md`, PRs #380–382, `֍custos֎`, `static-gh-pages.yml` | +2 |
| 5 | Assigned to a destination repo or lake? | No — pending Deck Master routing | +0 |

**Score: 9 → Rank: King** (Active Stand-alone — session is closed and operating as a record)
**Suit (Hub system): ♣️ Club** — sessions/operations
**Suit (Five Lakes): TBD** — Deck Master to assign

---

# VI. FORMAL CUSTODY ENTRY

| Field | Value |
|---|---|
| Document Name | Radix First Publish — nav1 Session Journey |
| Prima-clock Open | 202609290000 |
| Prima-clock Close | 202609290100 |
| Iteration | Blackjack 21 · Act II |
| Motion State | SEALING |
| Chain of Custody | OPEN |
| Suit Assignment (Hub) | ♣️ Club — sessions/operations |
| Suit Assignment (Five Lakes) | TBD |
| Valuation Score | 9 → King |
| Plank Status | At plank — session closed |
| Destination Repo | custos |
| Vault Candidate | No |
| Author/Maker | eaprime1 + Claude (nav1) |
| Source Conversation | claude.ai/code/session_01H1Lcw4YATAJEcBYxZNEv7g |
| Verification Anchors | PRs #380, #381, #382 · `static-gh-pages.yml` run on `֍custos֎` |

---

# VII. NOTES FOR NEXT ITERATION

- **Seal pre-check**: before posting `@claude ultima probatio`, confirm PR body
  has Intent + What Arrived + Resonance. Takes 5 seconds and avoids a failed run.
- **Codacy sync check**: before opening any radix PR, verify `.codacy.yml` on
  `main` covers all paths present in the radix snapshot. Run
  `git diff origin/main -- .codacy.yml` from the radix branch.
- **Bot PR automation**: consider a workflow that fires on `pull_request` opened
  by known bots (DeepSource, Dependabot) and posts a body template comment so
  the navigo has a template to fill rather than authoring from scratch.
- **PR #381**: still pending final merge. Body is correct, seal cue outcome TBD.
  One clean `@claude ultima probatio` confirms the seal; then merge.
- **Metrics baseline**: these Run 1 numbers are the baseline. Track seal efficiency
  and publish lag on the next run to see if the procedure reduces friction.
