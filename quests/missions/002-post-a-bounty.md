---
id: missions/002-post-a-bounty
title: "Post a Bounty 🃏"
arc: missions
sequence: 2
xp: 150
difficulty: novice
estimated_time: "30m"
requires:
  - missions/001-first-commission
unlocks:
  - missions/003-ai-commissioning
tags:
  - workflow
  - github
  - bounty
  - open-source
---

## Lore

A bounty is different from a mission. A mission says: do this, here is how you will know it is done. A bounty says: here is the problem. The Shepherd does not prescribe the path.

The Wanderers live for bounties. They arrive without being called, move through the Field, and leave work behind. A Shepherd who knows how to post a good bounty can attract the best of them.

The challenge is in the framing. Too tight and the Wanderers will not come — there is no room for craft. Too loose and nothing useful will land. The Shepherd learns this by doing.

## Objective

Post a bounty that a contributor you have never met could pick up and complete without a single question.

## Tasks

1. Identify a problem in custos that does not have a known solution — something that needs figuring out, not just executing.
2. Go to GitHub Issues and choose the **Bounty** template.
3. Write the challenge clearly. Define what success looks like without prescribing how to get there.
4. Add any constraints (what the solution must not do).
5. Set the XP reward. Higher XP attracts more experienced contributors.
6. Publish the bounty.
7. Leave it open. Observe who arrives and how.

## Completion Check

```bash
# Verify a bounty issue exists in the open state,
# via the GitHub API, falling back to gh only if curl finds nothing
# Query GitHub API for open issues with the bounty label (with gh fallback)
if command -v curl >/dev/null 2>&1 && curl -s "https://api.github.com/repos/eaprime1/custos/issues?state=open&labels=bounty" | grep -q '"name": "bounty"'; then
if curl -s "https://api.github.com/repos/eaprime1/custos/issues?state=open&labels=bounty" | grep -q '"name": "bounty"'; then
  echo "complete"
elif command -v gh >/dev/null 2>&1 && gh issue list --state open --label "bounty" --limit 1 | grep -q .; then
  echo "complete"
else
  exit 1
fi
```

## Reward

You have learned the difference between a mission and a bounty. The Field now has both doors open. Wanderers can arrive.

## Hints

<details>
<summary>Hint 1</summary>
The best bounties come from frustrations. What is something in custos that you wish worked differently but you do not know the best way to fix?
</details>

<details>
<summary>Hint 2</summary>
"What success looks like" is the hardest field to fill. If you can describe done without describing how, you have a real bounty.
</details>
