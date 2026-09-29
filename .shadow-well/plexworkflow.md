# Custos concept workflow drop-in

This document proposes a GitHub-ready concept workflow for `Eaprime1/custos` that turns pull request language into a growing concept system, while separating automated extraction from curated knowledge development [1]. The design treats the concept as the primary unit, not the surface word, and uses a registry to track first picks, duplicate random hits, and definition status over time [2].

## Goals

The workflow is meant to do four jobs at once: discover concept candidates from pull requests, avoid repeated development of the same concept, generate structured reports for underdeveloped concepts, and build a deployable concept graph with internal links and related entries [2]. It also supports a Google Drive companion workflow by keeping the repository as the versioned canonical knowledge base while allowing Drive to hold draft material and source notes [3][4].

## Recommended branches

Two branches keep the work clean and reviewable [2].

| Branch | Purpose |
|---|---|
| `feature/concept-workflow` | Adds extraction, random concept selection, duplicate tracking, registry updates, and GitHub Actions automation [2]. |
| `feature/concept-system` | Adds glossary pages, related-link logic, concept templates, deployment-facing navigation, and definition curation [2]. |

## Suggested repo layout

A compact repository layout keeps machine data, human writing, and automation separate [2].

```text
.github/
  workflows/
    concept-report.yml
    concept-gap-scan.yml
scripts/
  extract-pr-concepts.js
  normalize-concepts.js
  pick-random-concept.js
  generate-concept-report.js
  scan-definition-gaps.js
  update-related-links.js
data/
  concepts-registry.json
  concept-aliases.json
  concept-memory.json
  metrics/
    duplicate-hits.json
concepts/
  binary-superposition.md
  sparstone.md
reports/
  2026-07-19-pr-185-binary-superposition.md
templates/
  concept-entry-template.md
  concept-report-template.md
site/
  concepts-index.json
  related-map.json
```

## Registry model

A JSON registry is easier than CSV for aliases, relations, and evolving fields. The registry should track one conceptual entity per record even if several lexemes point to it [2].

### `data/concepts-registry.json`

```json
[
  {
    "concept_id": "binary-superposition",
    "canonical_label": "binary superposition",
    "aliases": ["superposed binary state", "binary overlap state"],
    "status": "draft",
    "definition_level": "stub",
    "first_seen_pr": 185,
    "first_seen_at": "2026-07-19T00:00:00Z",
    "times_randomly_selected": 1,
    "times_skipped_as_duplicate": 3,
    "times_observed": 7,
    "source_paths": ["docs/specs/concepts.md"],
    "related_concepts": ["superposition", "state-model", "binary-logic"],
    "report_paths": ["reports/2026-07-19-pr-185-binary-superposition.md"],
    "concept_entry_path": "concepts/binary-superposition.md",
    "last_reviewed_at": "2026-07-19T00:00:00Z"
  }
]
```

### `data/concept-aliases.json`

This file helps the system collapse different labels into a single concept bucket before random selection [2].

```json
{
  "binary superposition": "binary-superposition",
  "superposed binary state": "binary-superposition",
  "dual-state overlap": "binary-superposition",
  "sparstone": "sparstone"
}
```

## Metrics model

Three metrics are especially useful because they measure different realities in the concept space [2].

| Metric | Meaning |
|---|---|
| `times_randomly_selected` | How often the concept won the selection process [2]. |
| `times_skipped_as_duplicate` | How often a selected candidate mapped to an already-developed concept [2]. |
| `times_observed` | How often the concept or one of its aliases appears in PRs or scanned content [2]. |

This lets the project measure not just novelty, but conceptual centrality and taxonomic pressure around recurring ideas [2].

## Workflow behavior

The concept workflow should run on pull request events or manual dispatch, then proceed through a fixed series of steps [2].

1. Pull PR title, body, changed-file diff summary, and optional labels.
2. Extract candidate terms and noun phrases.
3. Normalize candidates into concept IDs using aliases and rules.
4. Randomly pick one concept candidate from the normalized set.
5. If the concept already has a mature entry, increment duplicate metrics and either stop or pick again.
6. If the concept is new or underdeveloped, generate a report draft and concept stub.
7. Commit updates to a branch and open a pull request for review [2].

The selection rule should prefer underdeveloped concepts, but still record duplicate hits when mature concepts are chosen first, because those duplicate hits are one of the intended metrics [2].

## GitHub Actions draft

The workflow below is a practical starter for `feature/concept-workflow`. It assumes Node-based scripts and commits generated artifacts back into the repo for review.

### `.github/workflows/concept-report.yml`

```yaml
name: Concept report from PR

on:
  pull_request:
    types: [opened, synchronize, reopened, labeled]
  workflow_dispatch:
    inputs:
      pr_number:
        description: "PR number to analyze"
        required: false

permissions:
  contents: write
  pull-requests: write

jobs:
  concept-report:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Install deps
        run: npm ci

      - name: Resolve PR context
        run: node scripts/extract-pr-concepts.js
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          PR_NUMBER: ${{ github.event.pull_request.number || inputs.pr_number }}

      - name: Normalize concepts
        run: node scripts/normalize-concepts.js

      - name: Pick concept and track duplicates
        run: node scripts/pick-random-concept.js

      - name: Generate concept report and stub
        run: node scripts/generate-concept-report.js

      - name: Update related links
        run: node scripts/update-related-links.js

      - name: Commit generated files
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
          git checkout -B automation/concept-report-${{ github.run_id }}
          git add data/ concepts/ reports/ site/
          git commit -m "Add concept report from PR context" || echo "No changes to commit"
          git push --set-upstream origin automation/concept-report-${{ github.run_id }}

      - name: Open PR
        uses: peter-evans/create-pull-request@v7
        with:
          branch: automation/concept-report-${{ github.run_id }}
          title: "Add concept report from PR context"
          body: |
            This automated PR adds a concept report, registry updates, and related-link data generated from pull request content.
```

## Definition-gap scan

A second workflow can scan changed files, concept notes, and reports for undefined concepts like the `binary superposition` example discussed earlier, then open issues or stubs when no concept record exists yet [2]. That makes the system proactive instead of waiting for a random pick alone [2].

### `.github/workflows/concept-gap-scan.yml`

```yaml
name: Concept gap scan

on:
  push:
    branches: [main, feature/concept-system]
  workflow_dispatch:

permissions:
  contents: write
  issues: write

jobs:
  gap-scan:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Install deps
        run: npm ci

      - name: Scan for definition gaps
        run: node scripts/scan-definition-gaps.js

      - name: Commit concept stubs
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
          git add concepts/ data/
          git commit -m "Add concept stubs for uncovered concepts" || echo "No changes to commit"
```

## Script responsibilities

Each script should have one clear responsibility so the system stays debuggable [2].

| Script | Job |
|---|---|
| `extract-pr-concepts.js` | Pulls PR text and changed-file content, then extracts candidate terms and phrases. |
| `normalize-concepts.js` | Maps candidates to canonical concept IDs using alias rules and future semantic logic [2]. |
| `pick-random-concept.js` | Picks one concept, records duplicate-hit metrics, and avoids repeated development of mature concepts [2]. |
| `generate-concept-report.js` | Produces a detailed report and concept stub from the chosen concept [2]. |
| `scan-definition-gaps.js` | Detects concept mentions that have no registry record or definition entry [2]. |
| `update-related-links.js` | Rebuilds deployable related-entry and hyperlink data for the site layer [2]. |

## Concept entry template

### `templates/concept-entry-template.md`

```md
---
concept_id: "{{concept_id}}"
canonical_label: "{{canonical_label}}"
status: "draft"
definition_level: "stub"
related_concepts: []
source_prs: []
report_paths: []
---

# {{canonical_label}}

## Definition

A working definition goes here.

## Why it matters

Explain how the concept interacts with the wider Custos system.

## Interactions

- Related mechanism:
- Neighbor concepts:
- Constraints:
- Open questions:

## Notes

- First detected in:
- Aliases:
- Status:
```

## Concept report template

### `templates/concept-report-template.md`

```md
---
concept_id: "{{concept_id}}"
canonical_label: "{{canonical_label}}"
source_pr: {{source_pr}}
generated_at: "{{generated_at}}"
---

# Concept report: {{canonical_label}}

## Overview

Describe the selected concept in plain language.

## PR context

Explain where the concept appears in the pull request and why it may matter.

## Interactions

Describe how the concept could interact with architecture, data, content, language, workflow, or deployment.

## Related concepts

- Neighbor concept 1
- Neighbor concept 2
- Neighbor concept 3

## Development notes

- Definition maturity:
- Needed follow-up:
- Candidate hyperlinks:
- Open questions:
```

## Deployment layer

The deployed version should not just expose a flat glossary. It should use generated files such as `site/concepts-index.json` and `site/related-map.json` to create hyperlinks between concept pages, reports, PR references, and neighboring concepts [2]. This fits the earlier goal of making the archive navigable through internal links and relationship paths rather than isolated entries [2].

A concept page should ideally display the canonical label, aliases, current definition, related concepts, source PRs, report history, and links into other parts of the project. That turns the knowledge base into a living conceptual map [2].

## Google Drive role

Google Drive still fits well, but as a companion system rather than the canonical version history. A practical arrangement is draft notes and raw source material in Drive, while normalized concept entries, metrics, workflow outputs, and deploy-linked artifacts live in GitHub where they are reviewable and versioned [3][4].

`KireinaHoro/DriveSync` is relevant mainly as an example of a local-folder-to-Google-Drive synchronization approach built in Go, not as the core mechanism for this GitHub Actions concept workflow [3][4]. If synchronization with Drive is later desired, it should be a separate publishing or mirroring step rather than part of the core concept-picking logic [3].

## Recommended implementation order

This order keeps risk low while producing visible value quickly [2].

1. Add the registry, aliases file, and templates.
2. Add `extract-pr-concepts.js`, `normalize-concepts.js`, and `pick-random-concept.js`.
3. Enable `concept-report.yml` on manual dispatch first.
4. Add report generation and commit-back behavior.
5. Add `concept-gap-scan.yml`.
6. Add deployed hyperlinks and related maps.
7. Add optional Google Drive mirroring only after the repo-native workflow is stable [2][3].

## Starter PR text

### PR for workflow branch

```md
## Purpose
Adds a concept workflow that extracts candidate concepts from PR context, normalizes them to canonical concept IDs, randomly selects one underdeveloped concept, generates a report draft, and tracks duplicate-hit metrics.

## Included
- Concepts registry
- Alias mapping
- Report and concept templates
- GitHub Actions workflow for PR-driven concept development
- Scripts for extraction, normalization, random selection, and metrics

## Why
This gives Custos a repeatable way to turn active development language into a growing concept system.
```

### PR for concept-system branch

```md
## Purpose
Adds the deploy-facing concept system that turns generated concept entries into a linked knowledge space.

## Included
- Concept entry rendering
- Related concept links
- Concepts index data
- Gap scanning for undefined concepts
- Internal hyperlinks from reports to concept entries

## Why
This turns isolated reports into a navigable internal concept graph.
```

## Notes for extension

A later version can replace rule-based alias matching with embedding-based similarity or a curator-reviewed semantic merge queue, but the first version should stay simple and reviewable [2]. The most important thing is to preserve the distinction between lexical variation and conceptual identity, because that is the heart of the metric and the quality of the system [2].
