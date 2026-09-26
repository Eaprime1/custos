# Plan: Rewards, Progression and Issue Flags

`prima-clock: 202609252039`
`suit: ♦️ Diamond — 1/3 plank. A plan for a fresh conversation to build.`
`author: nav1 (Claude) for the Shepherd, from the PR #343 session`

---

## How to use this plan

Start a new conversation on a branch cut from `main` after PR #343 merges, or from `claude/great-dirac-yp319k` if it hasn't merged yet.

1. Read the files in **Read first**.
2. Build **one phase per PR**. Keep each phase small.
3. When a phase needs a Drive document you can't open, stop and ask the Shepherd to paste it. Don't guess its contents.

The rule for all phases: **seed forward, don't over-build.** A file that names the shape and leaves room beats a finished system nobody asked for yet.

## Read first

- `CLAUDE.md`, and the **No bounties, no cash** note in Key Conventions
- `docs/issue-system.md` §4 (rewards and payment demands)
- `.github/workflows/claim-register.yml` and `.github/workflows/payment-demand.yml`
- `unexusi/connect.yaml` (the `xp` / `level` fields and the `xp_per_level` table)
- `tools/prime_check.sh` (the prime sequence already in use)
- `docs/sparstone/` (Sparstone as the earned, one-of-a-kind award)

## Shepherd decisions already made (202609252039)

| # | Decision |
|---|---|
| 1 | The word **bounty** is retired. For now the challenge type is called a **quest** ("something like quest, for now"). The Shepherd's working doc: https://docs.google.com/document/d/1MnmG2nW5_rLraKUIyZwCvvKSca8nZHa4jCfvVDD265s/edit |
| 2 | Progression is **59 levels**, with a **normal** progression and a **shadow** progression. The **60th is completion**. Several Drive documents describe it. |
| 3 | PRs that demand payment get a **warning label** (`payment-demand`), never auto-closed. The label's wording speaks to AI readers first. |
| 4 | Replacement names for "bounty" issue flags live on Drive: **🏷️ Replacements for "Bounty" (Issue Flags)** |
| 5 | custos pays **no cash**. Rewards are experience, badges and Sparstones. The first to complete a challenge earns its Sparstone or badge. |

## Phase 1: the challenge type name (small)

PR #343 renamed `bounty` to `sparstone-trial`. The Shepherd now leans toward **quest**.

- Ask the Shepherd for the Drive doc "🏷️ Replacements for 'Bounty' (Issue Flags)", or paste from it. Pick the final name from it.
- **Watch the collision:** `quests/` already holds RPG quest arcs. If the challenge type is also "quest", give it a distinct label, such as `quest-open` or the name from the Drive doc, so the two don't blur.
- Rename in one sweep:
  - `.github/ISSUE_TEMPLATE/sparstone-trial.yml`
  - the label in `.github/sovran-labels.yml` and `sovran-labels-sync.yml`
  - `claim-register.yml`, which checks labels
  - `docs/issue-system.md`, `CLAUDE.md` and `README.md`
- **Done when:** `grep -rn "sparstone-trial" .github docs CLAUDE.md README.md` returns nothing.

## Phase 2: the progression spec (document only)

Write `world/progression.md`. No code yet.

- **59 levels plus completion at 60**, for both the normal and the shadow progression. Pull the level names and meanings from the Shepherd's Drive documents. Ask for them; don't invent them.
- **How the two progressions relate.** Parallel tracks? Does the shadow track mirror the normal one, or trail it? Record the Shepherd's answer; if it isn't known, write the question down as an open question.
- **What earns a step.** Start small: claim, submission, merged PR, review, lexeme note. One step each until the Shepherd says otherwise.
- **Tie to the primes** only where the Drive docs do. `docs/issue-system.md` §4 has a nine-rung prime sketch; treat it as a seed, not a rule.
- **Done when:** `test -f world/progression.md && grep -q "60" world/progression.md`

## Phase 3: a minimal ledger

Only after Phase 2 is accepted.

- **Where it lives:** either extend `unexusi/connect.yaml`, or add `unexusi/ledger.yaml` with one row per contributor: `login`, `track` (normal/shadow), `level`, `steps`, `badges`, `sparstones`.
- **Who writes it:** the Shepherd, or a navigo, by hand in PRs at first. No bot commits; this repo prefers stateless workflows (see `prima-witness.yml`).
- **Done when:** the file exists, validates as YAML, and has one real row.

## Phase 4: claim reply names the real reward

Update `claim-register.yml` so its reply names the level-step reward from Phase 2, instead of the prime-rung wording. Keep the no-cash line.

## Phase 5: seeds to hold, not build

List these in `.shadow-well/` or `atelier/`. Don't implement them.

- Badges beyond the Sparstone: who designs them, and where their images live.
- Evaluations as an experience-like record for challenge submissions.
- The future "real value anchored to quality and anchors". The Shepherd named it as future work, with nothing to build now.

## Open follow-ups from PR #343

- Relabel #325, #235 and #187 from `bounty` to the Phase 1 name, if the Shepherd agrees.
- Apply `payment-demand` to #333 and #331. This session did it directly with the label.
- Bounty-platform aggregators may still list custos issues as paid. Consider a pinned issue or README line that says so plainly. The README already carries one line.
