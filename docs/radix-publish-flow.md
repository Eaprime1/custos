# Radix Publish Flow

`suit: ♦️ Diamond — active build`
`prima-clock: 202609290100`

The radix flow is how custos publishes a snapshot to GitHub Pages. It moves
content from `main` through an ephemeral capture branch (`radix`) into the
deploy branch (`֍custos֎`), which triggers `static-gh-pages.yml`.

```
main  ──snapshot──→  radix  ──PR──→  ֍custos֎  ──deploy──→  GitHub Pages
```

`radix` is ephemeral: created fresh for each publish run, merged, and abandoned.
`֍custos֎` is the sole trigger branch for the Pages deploy — nothing else should
push to it directly.

---

## Prerequisites

Before opening the radix PR:

1. **`main` is stable** — all in-flight PRs to main that belong in this publish are merged.
2. **`.codacy.yml` on `main` covers every path you need to exclude.** Codacy reads
   config from the default branch (`main`), not the PR head. A config gap on `main`
   will cause Codacy `action_required` on the radix PR even if `.codacy.yml` looks
   correct on `radix`. Fix the config on `main` first via a separate PR, then open
   the radix PR.
3. **GitHub Pages is set to deploy from `֍custos֎`** — confirm in Settings → Pages.
4. **Branch `֍custos֎` exists.** If not, create it from `main` before the first run.

---

## Steps

### 1. Create `radix` from `main`

```bash
git fetch origin main
git checkout -b radix origin/main
# optional: make snapshot-specific adjustments
git push -u origin radix
```

### 2. Open PR `radix → ֍custos֎`

- Title: `publish: <prima-clock> snapshot` (e.g. `publish: 202609290000 snapshot`)
- Body: fill in Intent, What Arrived, Resonance, Ethics Check before posting.
  Do not leave these empty — `finalize-pr.yml` requires all three before it will seal.
- Set base branch to `֍custos֎`, not `main`.

### 3. Let CI run

Checks that run on the radix PR:

| Check | What it tests |
|---|---|
| `scan` (scan-lexeme) | Distressed lexemes in `.md/.sh/.yaml` |
| `validate` (prima-witness) | New `.md` files without prima-clock stamps |
| `packet` (review-packet) | No-API diff summary |
| Codacy Static Code Analysis | Reads `.codacy.yml` **from `main`** |
| DeepSource | Shell, Secrets, and language analyzers |
| GitGuardian | Secrets scan |
| `dependency-review` | Dependency changes |

### 4. Resolve any Codacy findings

If Codacy returns `action_required`:

- Check `docs/final-review-and-codacy.md` for the standard resolution path.
- If the issue is a missing exclusion in `.codacy.yml`: open a **separate PR to `main`**
  to add the exclusion. Once that PR is merged, Codacy will automatically re-run on
  the radix PR using the updated `main` config — no re-push to `radix` needed.
- If the issue is a real code finding: fix it on `radix` and push.

### 5. Seal the PR

Once all checks are green and the PR body has Intent/What Arrived/Resonance filled:

Post a plain comment on the radix PR:

```
@claude ultima probatio
```

Rules for the seal cue:
- Exact spelling — `ultima` not `utltima`, not `ultima probtio`
- Plain comment — not inside a code block, not inside a quote
- No Claude Code footer (the gate ignores cues from the footer)
- Posted **after** the PR body has the required sections — a cue posted while the
  body is empty fails immediately and requires a re-post after the body is corrected

`finalize-pr.yml` checks for Intent, What Arrived, and Resonance in the PR body.
On success it adds the `finalized` label. On failure it posts what's missing.

### 6. Merge

Once `finalized` label is present and `mergeable_state: clean`, the navigo merges.
The merge to `֍custos֎` triggers `static-gh-pages.yml`, which deploys to Pages.

### 7. Verify the deploy

Check the Actions tab for `static-gh-pages.yml` run status. If it passes, the
site is live at the GitHub Pages URL configured for the repo.

---

## Bot-Opened PRs

If a bot (DeepSource autofix, Dependabot, etc.) opens a PR targeting `main` during
a radix cycle, its body will not have the custos template sections. Before sealing:

1. Update the PR body via API or the GitHub UI to add Intent, What Arrived,
   Resonance, and Ethics Check.
2. Only then post `@claude ultima probatio`.

Posting the seal cue before the body is updated will fail; the cue must be re-posted
after the body is correct.

---

## Completion Check

```bash
# Confirm ֍custos֎ advanced (replace SHA with the expected merge commit)
git fetch origin '֍custos֎'
git log --oneline origin/'֍custos֎' | head -3

# Confirm Pages deploy triggered (check Actions)
# gh run list --workflow=static-gh-pages.yml --branch='֍custos֎' --limit=1
```

---

## Known Gotchas

| Gotcha | Why it happens | How to avoid |
|---|---|---|
| Codacy `action_required` despite config on radix | Codacy reads from `main`, not PR head | Fix `.codacy.yml` on `main` first |
| Seal cue silently fails | Body sections empty when cue posted | Fill Intent/What Arrived/Resonance before posting the cue |
| Seal cue logs as wrong name | Typo in `ultima probatio` | Copy the exact phrase — one letter off produces a different cue name |
| Bot PR body missing required sections | Bot doesn't know custos template | Update body before sealing |
| `finalize-pr.yml` skips cue | Cue inside quotes/code, or has Claude Code footer | Post as plain comment with nothing wrapping it |
