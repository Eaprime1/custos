---
name: custos-session-close
description: Draft and post a session-close dispatch to #custos in Slack. Use when the user says "session close", "close out", "wrap up", "dispatch to Slack", "post the dispatch", "send the close message", or has just finished the turns/CLOSING.md checklist and wants the handoff post.
---

# Custos session close

Read `../custos-channel-brief/references/conventions.md` first for the post format, prima-clock rule, and sending rules.

## Steps
1. Gather what moved. Use the session itself, and the newest entry in `turns/log.md` if the repo is available. Do not invent files or outcomes.
2. Get the current time from the time tool and convert it to a UTC prima-clock stamp (YYYYMMDDHHMM).
3. Read `.prime` in the repo for the prime number. If the repo is not reachable, leave the prime out and say so.
4. Name the entity as the log does, for example `nav1 (Claude + eaprime1)`. Naming is under review in the repo (see `turns/CULTIVATION.md`), so use the wording the user used this session.
5. Draft the dispatch in the format in conventions.md: What moved, State snapshot, Open / next, then the resonance line. Keep each bullet to one line and point at a path, PR number, or Linear issue key instead of explaining.
6. Show the draft to the user. Flag anything held back (private locations, unconfirmed deliveries) so they can see what was left out.
7. Wait for a clear yes. Then post to #custos (channel ID is in conventions.md). If the user wants it parked, save it as a Slack draft instead.
8. After posting, reply with one line saying it went out, and note that `witnessed: true` was only set if the user confirmed it.

## Rules
- Close the loop on the record first. If the user has not run `turns/CLOSING.md`, mention it once and offer to continue; do not block the post.
- Mark unfinished or undecided items under Open / next, not under What moved.
- Never copy an old dispatch forward. Each one is built from this session.
