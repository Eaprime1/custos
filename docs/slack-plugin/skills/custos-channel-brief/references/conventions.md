# Custos / THE-UNEXUS — Slack conventions

## Workspace facts (read from Slack)
- Workspace: prime-dyb9931.slack.com
- Home channel: #custos (public, ID C0BMY6VU116), created 2026-07-31 by Eric Pace (eaprime). Only member so far is eaprime.
- Current use: Eric's own notes-to-self channel. Session-close dispatches, links he wants kept, and the occasional image. It is not yet a team channel, so write for a reader who is Eric, not an audience.
- Check Slack for newer channels before relying on this list.

## Role of Slack in the system
Slack is for the handoff moment, not the record. The record lives elsewhere: GitHub (eaprime1/custos) for work and custody, Linear (team QRU) for seeds and technical backbone, WordPress (unexusi.com) for public publication, Drive for turn documents. A Slack post points at the record; it never replaces it.

## Post format (match the 2026-07-31 session-close dispatch)
Slack mrkdwn, not Markdown: `*bold*`, `_italic_`, `` `code` ``, bullets with `•`, arrows with `→`, dividers made of dashes, emoji as `:clubs:`.

```
_custos · session close dispatch_
`prima-clock YYYYMMDDHHMM` · `prime N` · <entity, e.g. nav1 (Claude + eaprime1)>

-------------------------

*What moved this session*

• `path/to/file` — what changed, in one line.

-------------------------

*State snapshot*

_Healthy:_ ...
_Gap:_ ...

-------------------------

*Open / next*

→ next step
→ next step

-------------------------

`resonance: current` · `witnessed: true` :clubs:
```

Resonance values follow `turns/log.md`: current, delivered, infused, orienting. `witnessed: true` only if Eric confirmed it.

## Prima-clock
YYYYMMDDHHMM in UTC. UTC is the official clock. Eric's home time zone is Pacific, so convert any local time he gives. Get the current time from the time tool; never guess it. The `prime` number comes from `.prime` in the repo or the last turn in `turns/log.md`; if you cannot see it, leave it out and say so.

## Rules
- Sending is the user's call. Draft first, show the draft, and send only after a clear yes. Prefer a Slack draft when the tool offers one.
- Default destination is #custos. Ask before posting anywhere else, and before any direct message.
- Hold back private details: home or personal locations, names of people who have not agreed to be named, anything Eric marked as held. The July 31 dispatch held back a location on purpose; keep that habit.
- Do not post credentials, tokens, or anything from a private channel into a public one.
- Do not claim something is done, merged, or delivered unless Eric said so or the record shows it. Mark unverified items as unverified.
- Slack canvases are fine for a longer working note, but the record still goes to the repo.
- Slack automations (reminders, workflows) are configured in Slack itself. Suggest candidates; do not claim to have set them up.
