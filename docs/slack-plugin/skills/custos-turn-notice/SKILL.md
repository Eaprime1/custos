---
name: custos-turn-notice
description: Post a short turn-opens or turn-closes notice to #custos. Use when the user says "announce the turn", "open a turn", "turn notice", "heads up in Slack", "note to self in Slack", or wants a quick one-to-three-line orientation post rather than a full dispatch.
---

# Custos turn notice

Read `../custos-channel-brief/references/conventions.md` first.

Slack is for the handoff moment, not the record. A turn notice is the small version of a session-close dispatch: a few lines that keep everyone oriented in real time.

## Steps
1. Ask which kind it is only if unclear: turn opens, or turn closes.
2. Compose at most three lines:
   - Opens: which turn, who is in it (entity and, if relevant, which navigo), one line on the intent.
   - Closes: which turn, one line on what landed, a pointer to where the record lives (PR, `turns/log.md`, Linear key).
3. Add the UTC prima-clock stamp from the time tool in backticks at the start of the first line.
4. Include a capability line only when it affects the next pick, for example whether this navigo can touch a repo directly. Do not add it by default.
5. Show the draft, wait for a clear yes, then post to #custos.

## Rules
- Keep it short. If the user has more than three lines to say, offer the session-close skill instead.
- Never post a turn as closed unless the user says it is closed.
- Use Slack mrkdwn, not Markdown.
