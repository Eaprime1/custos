# Quest Schema

Every quest is a markdown file following this structure. The schema is a contract — contributors can write quests independently as long as they follow it.

## File Naming

```
quests/<arc>/<NNN>-slug.md
```

- `arc` — a folder grouping related quests (e.g. `example`, `networking`, `scripting`)
- `NNN` — zero-padded sequence number within the arc (`001`, `002`, ...)
- `slug` — short kebab-case description of the quest

## Template

```markdown
---
id: arc/NNN-slug
title: "Quest Title"
arc: arc-name
sequence: NNN
xp: 100                    # experience points awarded on completion
difficulty: novice         # novice | apprentice | journeyman | expert | master
estimated_time: "15m"      # rough time for a capable player
requires:
  - arc/NNN-slug           # quest IDs that must be complete first (can be empty)
unlocks:
  - arc/NNN-slug           # quest IDs this opens when complete (can be empty)
tags:
  - filesystem
  - navigation
---

## Lore

Narrative framing. One or two paragraphs. This is the *why* — what is happening
in the world that makes this task matter. Keep it grounded in the concept's world.

## Objective

Plain language statement of what the player must accomplish.

> Accomplish X so that Y.

## Tasks

Numbered steps. Each step is a **real action** — a command to run, a file to
create, a tool to configure. No fake clicks. No "press the button."

1. Do the first real thing.
2. Do the second real thing.
3. ...

## Completion Check

How the player (or a future automation) verifies the quest is done.
This must be deterministic — a file exists, a command outputs X, a service responds.

```bash
# Example verification command
ls ~/my-output-file && echo "Quest complete."
```

## Reward

What the player gains. Can be narrative ("the terminal whispers its thanks"),
practical ("you now have git configured"), or both.

## Hints

Optional. Spoiler-tagged hints for players who are stuck. Don't give away the
whole solution — nudge.

<details>
<summary>Hint 1</summary>
The command you need starts with `man`.
</details>
```

## Field Reference

| Field | Required | Description |
|---|---|---|
| `id` | yes | Unique identifier matching the file path |
| `title` | yes | Display name |
| `arc` | yes | Arc folder this quest belongs to |
| `sequence` | yes | Order within the arc |
| `xp` | yes | Points awarded (10–500 typical range) |
| `difficulty` | yes | novice / apprentice / journeyman / expert / master |
| `estimated_time` | yes | Human-readable estimate |
| `requires` | no | List of prerequisite quest IDs |
| `unlocks` | no | List of quest IDs this opens |
| `tags` | no | Skill categories touched |

## Arc Design Notes

An arc is a cluster of 3–10 quests around one skill or story beat. Arcs should
be completable in a single session at their level. Cross-arc dependencies are
allowed but should be used sparingly — prefer quests that stand alone.
