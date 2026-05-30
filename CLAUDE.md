# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

This is a **prima terminal concept template** — a seed-and-quest package that transforms a bare terminal into a structured, story-driven environment. It is not a software project with a build pipeline. There is no compilation, no test suite, no package manager. The deliverable is the content and structure itself: quests, world lore, shell tools, and config files that form a playable terminal experience.

```
[ Termux / system terminal ]   ← runtime engine (installed on device, not in this repo)
        ↕
    [ Unexusi ]                ← identity + connection layer (unexusi/connect.yaml)
        ↕
[ Prima Terminal Concept ]     ← this repo: quests, seeds, guides, world, tools
```

## Shell Tools

All tools run from the repo root. They are not build tools — they are gameplay and authoring utilities.

```bash
# Intake triad — receive, mark, warm a fragment
bash tools/thee.sh "your fragment"          # logs fragment to intake/incoming.md
bash tools/yod.sh "smallest true action"   # marks the first action
bash tools/ember.sh "fragment"             # keeps a fragment alive until next turn

# State inspection
bash tools/prime_check.sh                  # reads .prime and reports current/next prime state

# Authoring validation
bash tools/scan_lexeme.sh                  # finds unfilled placeholders (TODO, REPLACE, "My Prima Terminal", etc.)
bash tools/scan_lexeme.sh path/to/dir      # scan a specific subdirectory

# Environment bootstrap (idempotent)
bash seeds/bootstrap.sh                    # installs packages, deploys dotfiles, creates ~/.prima-env
```

**Quest 000 completion check:**
```bash
grep -q 'name: "My Prima Terminal"' prima.yaml \
  && echo "INCOMPLETE — name not set" \
  || echo "Quest 000 complete — THEE opened the door"
```

## Architecture

### `prima.yaml` — Central Manifest
Single source of truth. Declares the concept's name/slug/version, runtime requirements, and references every other component by path. When forking, this is filled in first.

### Quests (`quests/`)
RPG-style tasks with real, verifiable outcomes. Quests are organized into **arcs** (folders of 3–10 related quests). Each quest file follows the schema in `quests/QUEST_SCHEMA.md`:
- YAML front matter: `id`, `title`, `arc`, `sequence`, `xp`, `difficulty`, `estimated_time`, `requires`, `unlocks`, `tags`
- Sections: Lore, Objective, Tasks, Completion Check, Reward, Hints
- File naming: `quests/<arc>/<NNN>-slug.md`
- Completion check must be a deterministic bash command (file exists, command outputs X)

`quests/000-thee-the-door.md` is the initiation quest — it is always the first quest on a fresh fork and blocks all others until `prima.yaml` is named and `world/lore.md` has content.

### World (`world/`)
Narrative context for the concept: `lore.md` (setting, history, what the prompt represents, what players are), `factions.md` (groups in the world), `the-the.md` (supplemental lore). Lore should feel like a place, not a classroom.

### Seeds (`seeds/`)
Bootstrap layer: `bootstrap.sh` installs required packages via auto-detected manager (pkg/apt-get), deploys dotfiles from `seeds/dotfiles/`, and creates `~/.prima-env`. `packages.yaml` declares the package manager and required/optional packages.

### Unexusi Layer (`unexusi/connect.yaml`)
Defines what the external Unexusi identity service tracks per player: XP, level, quest completion lists, session timestamps. Also configures session lifecycle (on_connect/on_disconnect actions) and optional BBS features (leaderboard, message board). The `concept.slug` here must match `prima.yaml`.

### THEE / YOD / EMBER Triad (`tools/`)
A **listening practice** for capturing fragments before they have names:
- **THEE** — receives the unknown, logs to `intake/incoming.md`, asks "The what?"
- **YOD** — makes the smallest first mark
- **EMBER** — keeps a fragment alive until it has a next turn

This is not a ticketing system. It is a protocol for letting ideas arrive before forcing them to be useful.

### Prime State (`.prime`, `tools/prime_check.sh`)
Tracks concept progression via prime numbers (2, 3, 5, 7, 11, 13, …). The `.prime` file holds the current prime. `prime_check.sh` reads it and reports the next step. The template ships with `.prime` = `3`.

### Turns (`turns/log.md`)
Session memory. Every meaningful session appends one turn entry using the schema in `turns/TURN_SCHEMA.md`: timestamp, prime state, entity (who/what contributed), intent, contribution, resonance, and `witnessed: true`. Entries are never edited or deleted.

### Templates (`templates/`)
Starter files for creating new quests, guides, or other components.

## Key Conventions

**Forking this template:** Fill `prima.yaml` first (name, slug, tagline, theme, platform). Run `bash tools/scan_lexeme.sh` to find all remaining placeholders. `unexusi/connect.yaml` slug must stay in sync with `prima.yaml` slug.

**Writing quests:** Every quest must have a deterministic `Completion Check` bash command. Quests teach by requiring real use of a skill — no fake steps. Arc dependencies should be minimal; prefer quests that stand alone.

**Lore tone:** Short, evocative. The terminal is not a tool in this world — it is the world. Avoid classroom framing.

**Turn log:** Append only. One entry per meaningful session boundary. `resonance` is one honest word.

**Placeholder detection:** `scan_lexeme.sh` flags `TODO`, `FIXME`, `BROKEN`, `placeholder`, `REPLACE`, `TBD`, `???`, `UNKNOWN`, and `"My Prima Terminal"` across `.md`, `.sh`, `.yaml`, and `.json` files.
