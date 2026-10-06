# Peer Review Run 0: custos and pixelator

`prima-clock: 202610060744`
`status: DRAFT. A nursery record; nothing here is canon until the Shepherd says so.`
`process: docs/peer-review-process.md (v0, being tested by this run)`

Compared at custos `427e9dc` and pixelator `b166a30` (both `origin/main`). Pixelator's PR 13 (four workflows ported from custos) was open and is **not** counted below.

## 1. Facts

From `bash tools/peer_inventory.sh . ../pixelator@origin/main`:

| Area | Same | Differs | Only custos | Only pixelator |
|---|---|---|---|---|
| root files | 1 | 2 | 13 | 9 |
| `.github` | 1 | 3 | 0 | 1 |
| `.github/workflows` | 10 | 4 | 11 | 7 |
| `tools` | 1 | 2 | 13 | 0 |
| `docs` | 1 | 0 | 13 | 0 |

From `bash tools/repo_hygiene_check.sh <repo>` against the baseline manifest:

| Repo | Present | Missing |
|---|---|---|
| pixelator | 11 of 13 | `CLAUDE.md`, `LICENSE.md` (both already OPEN in `queue/future-forward/pixelator.md` since 2026-08-30) |
| maw | 5 of 13 | 8 |
| hodie | 3 of 13 | 10 |

The hygiene check calls pixelator's `scan_lexeme.sh` and `validate_json_yaml.sh` **present**. Both are out of date (see CP-1 and PC-1). Presence is not currency.

## 2. Lens: custos through pixelator (what custos or the project could gain)

| ID | Finding | Evidence | Disposition | Effort | Risk |
|---|---|---|---|---|---|
| CP-1 | Custos's `validate_json_yaml.sh` lacks two fixes pixelator has: a missing-root false negative, and YAML merge-key override handling (a local key overriding a merged-in key is valid YAML but custos's copy rejects it). Custos runs this as a **blocking** CI gate. | Diff of the two files; pixelator commit `3aefbf8` | **ADOPT** | XS | Low. Fixes a possible false rejection on valid YAML. |
| CP-2 | Pixelator's agent has safe-by-default habits worth borrowing for any tool that moves files: `--dry-run`, atomic JSON writes, custody-log rotation, collision-safe moves, a per-run cap ("one hertz"), a queue pressure report. Custos's `artesian_scan.sh` only lists; maw's arrival routine is manual. | `pixelator_agent.py` (`_atomic_save_json`, `_rotate_custody_log_if_needed`, `process_item`, `print_pressure_report`) | **ADAPT**, aimed at maw's arrival routine first | M | Low if dry-run is the default |
| CP-3 | Pixelator tests its code (283-line test file, flake8 and pytest in `python-app.yml`). Custos's shell tools have no tests; two of them already drifted. | `test_sample.py`, `python-app.yml` | **ADAPT** as fixture tests for `scan_lexeme.sh`, `validate_json_yaml.sh`, `repo_hygiene_check.sh`, `peer_inventory.sh` | M | Low |
| CP-4 | `document-lexeme-report.yml` counts sentences and lexemes per document and publishes an artifact. It could feed Stage 1 of the distressed-lexeme scanner, if made list-driven. | Workflow source; the compiled list (`atelier/lexemes/distressed-lexeme-list.md`) | **ADAPT** | M | Low. Artifact only, no repo writes. |
| CP-5 | `PERSPECTIVE_REQUEST_001` is a reusable shape for asking participants for views (why, who, numbered concepts with questions, immediate asks, log entry). Peer review needs exactly that. | The document's headings | **ADOPT** as `templates/perspective-request.md` | XS | Low |
| CP-6 | `termux_proc.sh` tracks multi-step procedures on a phone and prints a short verification certificate. It might back the session-closing checklist (`turns/CLOSING.md`) when working from Termux. Read only in outline so far. | Header and menu of the script | **ASK**, after a closer read | S | Not yet known |
| CP-7 | The routing ladder in `pixelate/ROUTING.md` covers where content goes. Custos's `incoming/`, `queue/` and `intake/` paths do not yet say how they map to it. | `ROUTING.md`; custos directory tree | **PROJECT-WIDE**, **ASK** | S | Low |
| CP-8 | `pr-journeys/final-reviews/` keeps a per-round record of final-review findings. Custos's journeys record the outcome, not the rounds. | `pr-journeys/final-reviews/README.md` (pixelator) | **ASK**, after a closer read | S | Not yet known |
| CP-9 | `label.yml` and `labeler.yml` label PRs by path. `summary.yml` summarizes new issues with a model. | Workflow sources | **SKIP** for now, with a note: custos has semantic labels and an issue form; the summary needs a cost decision | n/a | n/a |

## 3. Lens: pixelator through custos (what pixelator gains)

| ID | Finding | Evidence | Disposition | Effort | Risk |
|---|---|---|---|---|---|
| PC-1 | Pixelator's `scan_lexeme.sh` does not scan `.yml` files, has a duplicated `--include` line, and lacks custos's grep fix and per-pattern exclusion. Its CI `scan` check therefore never reads workflow files. | Diff of the two files | **ADOPT** | XS | Low |
| PC-2 | Four governance workflows, ported and adapted in pixelator PR 13: `finalize-pr`, `latin-cue-record`, `review-packet`, `witness-pr`. | PR 13 | **ADAPT** (done, in review) | S | Low. Cannot be exercised until merged. |
| PC-3 | Pixelator has no `CLAUDE.md`. A new conversation in the repo has no orientation file. | Hygiene check; already filed OPEN | **ADAPT**: a pixelator-specific file, not a copy | S | Low |
| PC-4 | `pixelator_config.py` hard-codes `BASE = "/storage/emulated/0/pixel8a"` and the `Q` and hodie paths under it. Custos solved the same problem with `.locations/` and an `env_setup.sh`. The phone has four roots; `ROUTING.md` maps only one. | `pixelator_config.py`; `.locations/` and `seeds/env_setup.sh` in custos | **ADAPT**: location-aware paths | M | Medium. Changes where the agent reads and writes. |
| PC-5 | Issue forms: pixelator has `bounty`, `mission`, `upgrade`. Custos has `feedback`, `lexeme`, `mission`, `sparstone-trial`, `upgrade`, and its CLAUDE.md says `sparstone-trial` replaced `bounty`. The `lexeme` form is what the "a lexeme turns out to be distressed" process needs. | `.github/ISSUE_TEMPLATE` in both | **ADAPT** `lexeme`; **ASK** about the rest and about retiring `bounty` | S | Low |
| PC-6 | Labels and PR template: custos has `ai-review` and issue-system labels, and a Sense Check section. Pixelator's PR 13 dropped Sense Check on purpose, since pixelator's template has none. These belong with PC-5. | `sovran-labels.yml` and `PULL_REQUEST_TEMPLATE.md` diffs | **ADAPT** together with PC-5 | S | Low |
| PC-7 | Pixelator's `claude-code-review.yml` runs on every push (about 4 minutes each). Custos runs the paid review once when a PR is ready, and again only on the `ai-review` label. | Workflow triggers; one run of 4 min 9 s on PR 12 | **ADAPT** | S | Low |
| PC-8 | No custody registry or session log. `ROUTING.md` says to record each crossing in the chain of custody log, but pixelator has none beyond the agent's own JSON log. Custos has `prima-clock/registry.md` and `turns/`. | `ROUTING.md`; maw has `maw/registry/custody_log.md` | **PROJECT-WIDE**, **ASK** | M | Low |
| PC-9 | `LICENSE.md` | Hygiene check; already filed OPEN | **ASK** (Eric's call) | XS | n/a |
| PC-10 | `prima-witness.yml` provenance scan (custos adapted it from hodie). | Workflow source | **SKIP** for now. Revisit after PR 13 settles. | S | Low |

## 4. Lens: the hub (custos reviewing both)

| ID | Finding | Disposition |
|---|---|---|
| H-1 | **Shared files drift both ways** (CP-1 against PC-1). A presence-only baseline cannot see it. | **PROJECT-WIDE**: make the check compare content; record which files are meant to be identical and which are adapted, with a source commit. |
| H-2 | **Prima-clock timezone.** The seal on custos #406 read `202610060704` (UTC); the cue record for the same minute read `202610060004` (Pacific). Two conventions are live in one repo. | **ASK**: choose one, and put the stamp in one small shared script. |
| H-3 | **Branch naming drift in custos.** `CLAUDE.md` and `.locations/README.md` say the device branch is `pixel8`; it is `pixel`. `.locations` says `device/` lives on that branch only, but `device/` is on `main`. `.locations/pixel8/config.sh` assumes one clone path. | **ADAPT** (custos housekeeping), tied to PC-4 |
| H-4 | **Sister repos are far from the baseline.** maw is at 5 of 13 and hodie at 3 of 13. Neither has the Latin-cue workflows. | **PROJECT-WIDE**: pairs after this run are custos with maw, custos with hodie, then pixelator with maw. |
| H-5 | **A Claude session cannot seal.** With the footer guard (now in pixelator PR 13), a comment carrying the Claude Code footer never seals, even under the owner's login. Pixelator #12 was sealed by such a comment at Eric's explicit instruction, under the old rules. | **Noted.** The owner posts the seal cue from now on. |
| H-6 | **The "distressed lexeme" name is used for two things:** word markers in `scan_lexeme.sh`, and the weighted words in the compiled list. | **ASK**, already raised in the list. Suggest "unfinished markers" for the first. |

## 5. Ideas added by this review

| ID | Idea | Why |
|---|---|---|
| I-1 | An `adapted-from: <repo>@<commit>` line in every ported file (PR 13 already carries the repo and file name) | A drift check then knows what each copy started from |
| I-2 | A second column in the hygiene manifest: **identical** or **adapted**; for identical files compare blob ids | Turns "present" into "current" (H-1) |
| I-3 | A tiny `tools/prima_clock.sh` that prints the stamp in the chosen timezone | Ends the UTC and Pacific split (H-2) |
| I-4 | Make the compiled lexeme list the single canonical copy, and let other repos' scanners read it by path or URL | Answers the open question in `ROUTING.md` about one list |
| I-5 | After the next two runs, a scheduled, report-only workflow that runs `peer_inventory.sh` and opens an issue when files meant to be identical differ | Catches quiet drift without a person remembering |
| I-6 | Trial reusable workflows on one stable workflow (finalize) before deciding on the wider approach | Tests the sharing option with real evidence |

## 6. Pixelator housekeeping found on the way (its own, not from custos)

| Item | Evidence | Disposition |
|---|---|---|
| `README.md` tells you to clone `github.com/devicehaven/pixelator`; the repo is `eaprime1/pixelator` | README setup section | **ASK** (is the org name still wanted?) |
| `blank.yml` and `terraform.yml` run on branch `claude/restructure-pixel8a-architecture-8TCj4`, which does not exist (`main` is the only remote branch). Terraform apply needs a Cloud token. | Workflow headers; `git ls-remote` | **ASK** (retire or repoint) |

## 7. Tally

25 findings: 9 custos through pixelator (CP), 10 pixelator through custos (PC), 6 from the hub (H). Counted from the tables above by script, not by hand.

| Disposition | Count |
|---|---|
| ADOPT | 3 (CP-1, CP-5, PC-1) |
| ADAPT | 10 |
| PROJECT-WIDE | 4 |
| ASK | 8 |
| SKIP | 2 |

Three findings carry two dispositions (CP-7, PC-5, PC-8), so the counts add to 27. H-5 is a note with no disposition. The housekeeping table in section 6 is not counted.

## 8. What Run 0 taught the process

- **The script found the files; reading found the meaning.** The inventory listed the two divergent tools in seconds, but only reading showed which side was newer and in which way. The process already separates facts from judgment; keep it.
- **Two findings came from the hygiene routine's blind spot,** not from either repo being mistaken. That blind spot is the strongest argument for H-1 and I-2.
- **The lenses overlap less than expected.** Custos through pixelator gave mostly tools and habits; pixelator through custos gave mostly governance and conventions.
- **Some findings need a closer read** (CP-6, CP-8). The record should say so, as it does, and not guess.
- **Counting needs a rule** for findings with two dispositions. The first draft of the tally was written from memory and was incorrect; counting by script fixed it. Count by script from now on.
- **The new inventory tool failed the repo's own lint on its first push.** DeepSource Shell flagged three findings in `tools/peer_inventory.sh` (two `==` in tests, which the repo already fixed once in #381, and backticks inside single quotes). ShellCheck was not installed in the working environment, so it was not run before pushing. Fixed with output verified identical; the lesson for the process is to run ShellCheck on any new tool before the first push, which is also a small argument for CP-3 (tests and lint for tools).
- **The lexeme list works as a test, and it showed a gap.** Scanning this record and the process doc against the compiled list matched an overloaded word in plain prose (fixed) and the word "system" inside the file name `docs/issue-system.md`. A scanner needs a rule for path-like text, or it will flag names it should leave alone. Add that to the Stage 2 triage in the list.

## 9. Proposed next steps (none started)

1. ADOPT items as three small PRs: CP-1 into custos; PC-1 into pixelator; CP-5 into custos.
2. Shepherd rulings on the ASK rows, in `queue/future-forward/`.
3. Run 1: custos with maw.
