# Final Review and Codacy Triage

This repo uses a manual **Final Review Gate** workflow for last-mile validation before merge.

## Baseline Codacy findings (reference run 79266436570)

Source: https://github.com/Eaprime1/custos/runs/79266436570

| Category | Severity | File | Finding | Action |
|---|---|---|---|---|
| correctness/security | warning (blocking threshold in Codacy rule set) | `.github/workflows/claude-code-review.yml` | Third-party GitHub Action was not pinned to a full commit SHA | Fixed by pinning `anthropics/claude-code-action` to a full commit SHA |
| config noise | none in this run | n/a | n/a | Tightened Codacy exclusions for issue templates and non-code narrative directories |
| formatting/style | none in this run | n/a | n/a | No changes needed |

## Codacy scope strategy

Codacy scope is intentionally focused on files that can affect behavior or automation (workflows, scripts, and core config). Narrative and template-heavy paths are excluded to reduce non-actionable noise.

Updated exclusions include:

- `.github/ISSUE_TEMPLATE/**`
- `.github/PULL_REQUEST_TEMPLATE.md`
- `guides/**`
- `world/**`
- `templates/**`

## Markdown formatting Codacy flags most

In Markdown PRs the usual findings are two markdownlint rules:

- **MD022 blanks-around-headings**: one blank line above and below every heading.
- **MD032 blanks-around-lists**: one blank line before and after every list.

Why it matters beyond looks: some parsers (kramdown, for one) do not read a heading that has no blank line above it, and show it as plain text.

```text
## Good heading

Text starts after a blank line.

- a list also has a blank line above it
- and below it

## Next heading
```

Check a file before you push:

```bash
npx --yes markdownlint-cli@0.41.0 --disable MD013 MD033 MD041 MD036 -- path/to/file.md
```

Fix only these two rules automatically (nothing else in the file changes). Put this in a temporary file, for example `mdl-fix.json`:

```json
{ "default": false, "MD022": true, "MD032": true }
```

```bash
npx --yes markdownlint-cli@0.41.0 --config mdl-fix.json --fix -- path/to/file.md
```

Notes:

- Start new chronicles and conversation records from `dungeon-master/narrative-engine/chronicle-template.md` and `conversation-template.md`; both follow this rule.
- Older documents predate it. Fix them when you next edit them, not in a bulk sweep, so history stays readable.
- Paths listed under `exclude_paths` in `.codacy.yml` are not scanned, so the rule is advisory there.

## Final Review button (manual trigger)

Workflow file: `.github/workflows/final-review.yml`

Run it from the **Actions** tab using **Run workflow**.

Inputs:

- `target_ref` (optional): branch/tag/SHA to review
- `strict_mode` (`true`/`false`):
  - `true`: fail if no Codacy check run is present on the target commit
  - `false`: allow missing Codacy check run

Checks performed:

1. `bash tools/prime_check.sh`
2. `bash tools/scan_lexeme.sh`
3. Codacy check-run gate on the selected commit (fails on blocking Codacy conclusions)

## Merge readiness gate

Recommended merge criteria:

1. Final Review Gate workflow passes
2. No blocking Codacy findings on the target commit
3. Required repository checks are green

To enforce this, add the Final Review Gate check as a **required status check** in branch protection settings.
