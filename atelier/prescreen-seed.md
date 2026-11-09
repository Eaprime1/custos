# Prescreen: a place for intentional, automated vetting before review (seed)

`prima-clock: 202611090933` (UTC)
`plank germ` · seed, held, not developed · origin: the Shepherd, chat on PR 514 follow-up, 2026-11-09

*Grows by addition. New material goes under "Added later" with a stamp.*

## What he said

Something contributors could use as a prescreen for issues: a location, a concept, where intentional and
automated pre-vetting stages can happen. It came up while a script for the Markdown blank-line rule was being
discussed: a small fixer that runs on updates and keeps count of what it fixed and how often it ran.

## Reading (mine, not his)

- The repo already has single-purpose checks that each do one job: `tools/scan_lexeme.sh`,
  `tools/scan_provenance.sh`, `tools/repo_hygiene_check.sh`, `tools/check_workflow_injection.py`,
  `tools/validate_json_yaml.sh`, and now `tools/fix_blank_lines.sh`. A prescreen could be the place that
  names them as stages, puts them in an order, and lets a contributor run all of them before asking for review.
- "Intentional" suggests each stage is chosen and written down, not whatever happens to be installed.
- Stages differ in kind: some only report, some fix. The fixers are the ones that need a record of what they changed.
- Existing habit to respect: checks are advisory and report-only unless stated, and CI does not commit back to
  the repo. Any record a stage keeps would sit with the contributor or in CI output, not in a bot commit.

## Not known

- Whether it screens issues, pull requests, or both, and at what moment (before an issue is filed, before work
  starts, before review).
- Where it lives: a folder, a name, or a workflow that calls the tools.
- Which stages are in it, in what order, and which are allowed to fix versus only report.
- What it keeps track of, and where that record goes, given the no-state-file habit.
- How it relates to the Latin review calls. A prescreen comes before them and does not replace them.

## Added later

(nothing yet)
