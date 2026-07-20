---
id: missions/003-ai-commissioning
title: "Commission the Machine 🃏"
arc: missions
sequence: 3
xp: 200
difficulty: apprentice
estimated_time: "45m"
requires:
  - missions/002-post-a-bounty
unlocks: []
tags:
  - workflow
  - ai
  - multi-model
  - commissioning
---

## Lore

The Scribes and Builders do not sleep. They do not charge by the hour. They do not need to be onboarded. They need only to be asked well.

The Shepherd who knows how to commission an AI faction member is a Shepherd who can multiply the work of the Field without multiplying their own hours. But it is a skill. Vague asks produce vague results. Precise asks with clear completion checks produce work that lands.

The factions are ready. Learn to call them.

## Objective

Commission an AI model (Claude, ChatGPT, Gemini, or Copilot) to complete a mission in the custos repo and deliver a PR that passes the completion check.

## Tasks

1. Choose an open mission or bounty from GitHub Issues, or create a new one.
2. Choose an AI faction member (Claude Code, ChatGPT Canvas, Gemini, GitHub Copilot, or another).
3. Write the commission prompt. Include:
   - The repo URL and branch to work from
   - The exact mission objective
   - The files to read before starting
   - The completion check command
   - The PR template format (Intent, What Arrived, Resonance)
4. Run the commission in your chosen AI environment.
5. Review the resulting PR against the completion check.
6. Merge if it passes. Close the issue.

## Completion Check

```bash
# Query GitHub API or use gh CLI to verify a merged PR exists with AI contributor mentioned in the body
(curl -s "https://api.github.com/search/issues?q=repo:eaprime1/custos+is:pr+is:merged+Claude+OR+ChatGPT+OR+Gemini+OR+Copilot" | grep -q '"total_count": [1-9]' || (gh pr list --state merged --json body -q ".[].body" | grep -Ei "claude|chatgpt|gemini|copilot" | grep -q .)) && echo "complete"
# Verify a merged PR exists with an AI faction member mentioned in the body,
# via the GitHub API, falling back to gh only if curl finds nothing
# Query GitHub API for merged PRs and check if the body mentions an AI faction member (with gh fallback)
if command -v curl >/dev/null 2>&1 && curl -s "https://api.github.com/search/issues?q=repo:eaprime1/custos+is:pr+is:merged+Claude+OR+ChatGPT+OR+Gemini+OR+Copilot" | grep -q '"total_count": [1-9]'; then
  echo "complete"
elif command -v gh >/dev/null 2>&1 && gh pr list --state merged --json body -q ".[].body" 2>/dev/null | grep -Ei "claude|chatgpt|gemini|copilot" | grep -q .; then
  echo "complete"
else
  exit 1
fi
```

## Reward

You have operated as a multi-model Shepherd. The Field can now receive work from any AI faction. The workflow scales to navigo, pixel8, or any device in the constellation.

## Hints

<details>
<summary>Hint 1</summary>
The quality of the commission equals the quality of the result. Spend more time writing the commission than you think you need to.
</details>

<details>
<summary>Hint 2</summary>
Tell the AI which files to read first. A good starting set: <code>prima.yaml</code>, <code>CLAUDE.md</code>, and the specific quest or issue it is completing.
</details>

<details>
<summary>Hint 3</summary>
Different models have different strengths. Claude Code runs in the terminal and can edit files directly. ChatGPT and Gemini may need the content pasted in. GitHub Copilot works best inside an IDE. Match the model to the mission type.
</details>
