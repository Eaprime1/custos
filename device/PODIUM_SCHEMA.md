# Podium Schema

A **podium** is any place custos work happens from — a device, an IDE, an
app, or a conversation/session on some platform. Append entries to
`device/podiums.md`.

```
---
podium_id:       [slug — referenceable id, e.g. "pixel8", "mulberry", "custos-web-jolly-bohr"]
name:            [human name, e.g. "Pixel 8 (Termux)", "Mulberry (Windows laptop)"]
type:            [device | conversation | app | platform-stream]
platform:        [termux | windows | vscode | claude.ai | console-api | claude-code-web | claude-code-cli | chatgpt | gemini | ...]
profile:         [account/stream this runs under, e.g. "Claude platform (eaprime@gmail.com)", "console/API"]
parent:          [parent podium_id, if this one runs on/inside another]
conversation_id: [session/conversation id, or the "pandora seed" — first message — if applicable]
role:            [what this podium is for]
status:          [active | dormant | retired]
notes:           [dialect, skills, field of vision — whatever makes this podium distinct]
---
```

## Why This Exists

Work on custos arrives from multiple podiums (devices, IDEs, conversations)
and multiple teams (the Shepherd plus various AI sessions). Each podium has
its own "dialect" — skills, field of vision, persistence model. Giving each
one a `podium_id` makes it a referenceable anchor: turns, carriers, and
install-log entries can point at *which* podium did the work, which makes
periodic review ("did anything get missed or change?") tractable.

## Filling It In

This is a living form — give a location (a device, app, conversation type)
and add an entry to `device/podiums.md` following the schema above. Not
every field applies to every podium; leave unknowns blank rather than
guessing. Entries can be extended later as more is learned about a podium.

## Rules

- Append only — never edit past entries except to update `status` or add
  `notes`.
- One entry per podium. If a podium's role changes significantly, add a new
  `notes` line rather than rewriting history.
