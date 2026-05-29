# Prima Terminal — Template

A living template for building **prima terminal** concepts: RPG-style, quest-driven terminal environments where the journey through the command line is the point.

## What Is a Prima Terminal?

A prima terminal is a **concept repo** — a seed-and-quest package that transforms a bare terminal session into a structured, story-driven experience. It defines a world, gives the user quests, and guides them through building real skills and real tools.

It does **not** bundle a terminal emulator. The runtime (Termux, bash, zsh, whatever the platform provides) lives at the system layer. This repo is the concept riding on top of it.

```
[ Termux / system terminal ]   ← runtime engine (installed on device, not in this repo)
        ↕
    [ Unexusi ]                ← identity + connection layer
        ↕
[ Prima Terminal Concept ]     ← this repo: quests, seeds, guides, world
```

## Repo Structure

```
prima.yaml          concept manifest — name, version, runtime requirements
quests/             RPG-style quest definitions (real tasks, real outcomes)
seeds/              bootstrap scripts, dotfiles, package lists
guides/             lore-woven practical documentation
world/              setting, lore, factions — the conceptual "place"
unexusi/            connection spec for the Unexusi identity layer
```

## How to Fork This Template

1. Fork or use this repo as a GitHub template.
2. Edit `prima.yaml` — give the concept its name, theme, and runtime requirements.
3. Write the `world/` — who lives here, what this place is.
4. Build out `quests/` — start with the awakening quest, then grow.
5. Fill `seeds/` — dotfiles, packages, bootstrap scripts the concept needs.
6. Write `guides/` — practical docs written as if they belong to the world.
7. Define `unexusi/connect.yaml` — how users authenticate and carry their state.

## Quest Design Philosophy

Quests are **real work with narrative framing**, not tutorials disguised as stories.

- A quest teaches a skill by requiring its actual use.
- Completion has a verifiable outcome: a file exists, a script runs, a tool works.
- Multiple members can contribute quests — the format is a contract, not a script.

See `quests/QUEST_SCHEMA.md` for the full spec.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Multiple members can fill in quests, guides, world lore, and seeds — the template structure is designed for collaborative expansion.
