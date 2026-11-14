---
name: custos-stream-return
description: Route an external agent's findings into Linear. Use when the user pastes or references a "STREAM N RETURN", findings from Gemini, Perplexity, Copilot, ChatGPT, NotebookLM or Claude Code, or asks to "route this return", "log this stream", or "update the Reading Room".
---

# Custos stream return

Read `../custos-seed-intake/references/conventions.md` first.

## Steps
1. Read the return and extract the signal: what is new, what confirms existing work, what conflicts with it. Keep the sending agent's wording where terminology matters.
2. Identify which branch each finding belongs to by searching Linear for the matching issue.
3. For each finding on an existing branch, add a comment: source agent, stream number, prima-clock stamp, the signal in a few lines. Do not rewrite the issue description.
4. For a finding with no home, offer to plant it as a new seed (use the custos-seed-intake skill). Ask before creating.
5. If the return contradicts existing content, flag the conflict to the user rather than resolving it.
6. Reply with a short routing table: finding, destination issue, action taken.

## Rules
- Label unverified claims from external agents as unverified.
- Do not over-develop; extract and route.
- Stream state reports can also be logged against the Reading Room intake issue (QRU-31) when the user asks.
