# Contributing

Thank you for your interest in contributing.

## How to Contribute

1. Fork the repository.
2. Create a feature branch from the default branch.
3. Make focused, small changes with clear commit messages.
4. Open a pull request with a clear summary of:
   - what changed
   - why it changed
   - any follow-up work

## Where Content Goes (read this before writing code)

This is the most common way a well-built PR goes nowhere. Two different kinds of work live in this repo, and they belong in different places:

1. **Concept / lore / routing-definition entities** → `world/` (e.g. `world/<name>.md`).
2. **Executable shell/tooling behavior** → `tools/` (or other issue-specified runtime path) only when the issue describes real behavior the codebase executes, not a naming, definition, or taxonomy problem.

If an issue is defining what something *is* — a concept, a category, a routing split, a naming distinction — it belongs in `world/`, not `tools/`, even when the language sounds technical ("routing," "priority," "sub-streams"). Test: would a `.md` definition file or a `.sh` runtime file actually resolve the "Problem" stated in the issue? That answer tells you where the PR belongs.

## Pull Request Guidelines

- Keep pull requests scoped to one logical change.
- Update relevant documentation when behavior changes.
- Ensure checks/tests pass before requesting review.
- For final merge readiness, run **Custos — Final Review Gate** from Actions (manual trigger).
- Review Codacy findings and resolve blocking issues before merge. See `docs/final-review-and-codacy.md`.
- Reference the issue you're addressing: `Fixes #NNN` or `Closes #NNN`.
- Nothing auto-merges. A PR sitting unreviewed isn't a rejection — it's in a queue.

## Key Reference Points

- `pandora/germs/` holds the original raw idea captures that most `mission`-labeled issues are drawn from. If an issue references a "germ" or a prior PR by number, read that PR's description for fuller context before assuming the issue text alone is complete.
- `.artesian/` = formal open missions. `.shadow-well/` = unrouted, unvetted, pre-custody material. `atelier/` = named-but-nursery concepts. `vault/` = passed custody — not directly edited.
- `guides/` holds deeper workflow-specific reference docs.

## For Automated and Bounty-Platform Contributors

- Check for existing open PRs on the issue first. Multiple submissions on one issue (especially `bounty`-labeled ones) are expected and are triaged together, not auto-rejected — but a submission that ignores an existing PR and starts from scratch is less likely to land than one that builds on it or explains a divergence.
- State your reasoning for content location (`world/` vs `tools/`) in the PR description. One sentence is enough, and it's the fastest signal for review.
- If the issue text is genuinely ambiguous about content type, say so in the PR instead of guessing silently.

## Reporting Issues

When opening an issue, include:

- expected behavior
- actual behavior
- steps to reproduce
- environment details (OS, versions, etc.)

## Questions

If anything is unclear, open a discussion or issue before starting large changes.
