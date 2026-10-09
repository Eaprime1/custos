---
name: custos-channel-brief
description: Read #custos (or another Slack channel the user names) and summarize what is new, what links or fragments were saved, and what looks like it belongs somewhere else. Use when the user says "what's in Slack", "catch me up", "check #custos", "what did I save in Slack", "brief me", or asks to find something they posted in Slack.
---

# Custos channel brief

Read `references/conventions.md` first for workspace facts and rules.

## Steps
1. Default to #custos. Read recent messages with the channel-read tool; use the channel ID in conventions.md. If the user names a different channel, search for it and read that instead. Search messages when they ask for something specific.
2. Group what you find, newest first:
   - Dispatches and notices (prima-clock stamps, open / next items)
   - Saved links and images (list them with a one-line guess at what each is, marked as a guess; open a link only if the user asks)
   - Threads with replies
3. Point out items that look like they belong elsewhere and name the destination:
   - A fragment or idea with no home -> offer to plant it as a seed in Linear (custos-seed-intake)
   - A finding from an outside agent -> offer to route it (custos-stream-return)
   - A decision or open step from a dispatch -> offer to check it against the repo
4. Reply with a short summary and a small routing list. Do not post anything back to Slack from this skill.

## Rules
- Reading only. Sending is covered by the session-close and turn-notice skills.
- Do not summarize private channels or DMs unless the user asked for that channel by name.
- Say plainly when the channel is quiet or the search finds nothing.
- Do not read images or files as if you know their contents; describe only what the message shows.
