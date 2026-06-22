---
id: missions/004-automate-verification
title: "Automate Verification 🃏"
arc: missions
sequence: 4
xp: 150
difficulty: apprentice
estimated_time: "30m"
requires:
  - missions/003-ai-commissioning
unlocks: []
tags:
  - workflow
  - tooling
  - missions
---

## Lore

The Field grows, and the Shepherd must ensure the Flock remains aligned. Inline `curl` commands scattered across quest files are brittle, susceptible to the shifting winds of API responses. To maintain the integrity of the commission workflow, verification logic is centralized.

## Objective

Verify mission completion using the centralized script at `tools/check_mission.sh` instead of inline `curl` commands.

## Tasks

1. Run `bash tools/check_mission.sh <mission-name>` for a mission you believe is complete (e.g. `ai-commissioning`).
2. Confirm it reports `complete` for a mission with a merged PR mentioning an AI faction member, and `incomplete` otherwise.
3. If you have a `GITHUB_TOKEN` set, confirm the script picks it up for authenticated requests.

## Completion Check

```bash
test -x tools/check_mission.sh && bash tools/check_mission.sh ai-commissioning
```

## Reward

Stability for the Field and a cleaner, more professional commission workflow.

## Hints

<details>
<summary>Hint 1</summary>
The script depends on <code>jq</code> for JSON parsing. Install it via <code>pkg install jq</code> (Termux) or your platform's package manager.
</details>

<details>
<summary>Hint 2</summary>
Unauthenticated GitHub API search requests are rate-limited. Set <code>GITHUB_TOKEN</code> if you're checking missions frequently.
</details>
