---
id: missions/001-first-commission
title: "First Commission"
arc: missions
sequence: 1
xp: 100
difficulty: novice
estimated_time: "20m"
requires: []
unlocks:
  - missions/002-post-a-bounty
tags:
  - workflow
  - github
  - missions
---

## Lore

The Field is open. The Flock has arrived. Now comes the first real act of the Shepherd: not building, not fixing — *commissioning*.

A commission is how work enters the Field with intention. It names what is needed, defines what done looks like, and opens the door for any faction to step through. The Shepherd does not do all the work. The Shepherd ensures the work gets done.

This is how the practice begins.

## Objective

Post a mission or bounty on GitHub Issues and receive a completed contribution.

## Tasks

1. Browse `quests/missions/` to understand the mission arc structure.
2. Identify something small that needs doing in the custos repo — a lore gap, a missing tool, an unfilled placeholder.
3. Go to [GitHub Issues](../../../issues/new/choose) and choose the **Mission** or **Bounty** template.
4. Fill in the objective, deliverables, and completion check. Be specific.
5. Submit the issue. It is now open to the Field.
6. Claim it yourself, or wait for a contributor.
7. When a PR arrives, review it against the completion check. Merge if it passes.

## Completion Check

```bash
# Query GitHub API for closed issues with mission or bounty labels
curl -s "https://api.github.com/repos/eaprime1/custos/issues?state=closed" | grep -q -E '"name": "mission"|"name": "bounty"' && echo "complete"
```

## Reward

You have opened the workflow. The Field now has a mechanism for receiving commissioned work from any faction — human, AI, or otherwise. Future missions can scale to any complexity.

## Hints

<details>
<summary>Hint 1</summary>
Start with something already visible: run <code>bash tools/scan_lexeme.sh</code> and pick one distressed lexeme as the subject of your first commission.
</details>

<details>
<summary>Hint 2</summary>
A well-written completion check is the most important part. If it can't be verified deterministically, the mission can't be closed cleanly.
</details>
