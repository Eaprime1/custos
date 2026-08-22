# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

**custos** is a prima terminal concept for the Pixel 8 — a guardian/shepherd environment for tending all work done from the device.

- Not a software project with a build pipeline
- No compilation, no test suite, no package manager
- Deliverable: content and structure — quests, world lore, shell tools, device state, workflow configuration

```
[ Termux on Pixel 8 ]        ← the Podium (runtime engine, not in this repo)
        ↕
    [ Unexusi ]              ← identity + connection layer (unexusi/connect.yaml)
        ↕
    [ custos ]               ← this repo: quests, world, tools, device state
```

**Concept identity:** name=`custos`, slug=`custos`, theme=`guardian`, author=`eaprime1`, platform=`termux`.  
**Active branch for Pixel 8 device work:** `pixel8` (tracks `device/` files with live device state).

## Shell Tools

All tools run from the repo root.

```bash
# Intake triad — receive, mark, warm a fragment
bash tools/thee.sh "your fragment"          # logs to intake/incoming.md, asks "The what?"
bash tools/yod.sh "smallest true action"   # marks the first action
bash tools/ember.sh "fragment"             # keeps a fragment alive until next turn

# State inspection
bash tools/prime_check.sh                  # reads .prime, reports current/next prime state

# Authoring validation
bash tools/scan_lexeme.sh                  # finds unfilled placeholders across .md/.sh/.yaml/.json
bash tools/scan_lexeme.sh path/to/dir      # scan a specific subdirectory
bash tools/scan_provenance.sh origin/main  # checks new .md files for a Prima-clock stamp (advisory)

# Environment bootstrap (idempotent)
bash seeds/bootstrap.sh                    # installs packages via pkg/apt-get, deploys dotfiles, creates ~/.prima-env

# Location detection
source seeds/env_setup.sh                  # detects mulberry/pixel8/codespaces, loads .locations/<name>/config.sh
```

**Claude Code on Termux (Android):**
Claude Code does not distribute a native binary for `linux-arm64-android` (Termux's ABI, its Application Binary Interface). The `npm approve-scripts` + reinstall flow will fail with "Native binaries for linux-arm64-android are not available on this release channel."

Workarounds:
- **Use the web session** — claude.ai/code connects to the repo remotely; this is the primary path for device-side AI work
- **Use the Anthropic API directly** in Termux: `curl` or a Python script with the `anthropic` package
- **SSH to a remote Linux box** from Termux and run Claude Code there (full support on linux-arm64)

## Architecture

### `prima.yaml` — Central Manifest
Single source of truth. Declares concept name/slug/version, runtime requirements, and references every component by path. `concept.slug` must stay in sync with `unexusi/connect.yaml concept.slug`.

### Quests (`quests/`)
RPG-style tasks organized into **arcs** (folders of 3–10 quests). Schema in `quests/QUEST_SCHEMA.md`:
- YAML front matter: `id`, `title`, `arc`, `sequence`, `xp`, `difficulty`, `estimated_time`, `requires`, `unlocks`, `tags`
- Sections: Lore, Objective, Tasks, Completion Check, Reward, Hints
- File naming: `quests/<arc>/<NNN>-slug.md`
- Every Completion Check must be a deterministic bash command

`quests/000-thee-the-door.md` is the initiation quest — blocks all others until `prima.yaml` is named and `world/lore.md` has content.

`quests/missions/` is the workflow arc — quests for operating the mission/bounty commission system.

### World (`world/`)
- `lore.md` — The Podium (Pixel 8), the Field (terminal), the Flock (projects/repos), Shepherd (operator)
- `factions.md` — Scribes, Builders, Sentinels, Wanderers, Unexusi
- `the-the.md` — The founding myth of prima (do not edit)

### Device Layer (`device/`) — pixel8 branch only
Tracks live device state. Not on `main`.
- `pixel8.yaml` — Device manifest: installed packages, key paths, reviewer note, active sessions
- `active.md` — Work-in-flight: active repos, in-progress tasks, arriving fragments
- `install-log.md` — Append-only record of what was installed, where, and how. Use
  `bash tools/log_install.sh <item> <location> <method> [by] [notes]` to add an entry.

### Workflow System
- `.github/ISSUE_TEMPLATE/mission.yml` — Structured task template (clear deliverable + bash completion check)
- `.github/ISSUE_TEMPLATE/bounty.yml` — Open challenge template (problem defined, approach open)
- `.github/ISSUE_TEMPLATE/upgrade.yml` — Improvement template (target exists, contributor sharpens/extends it)
- Labels: `mission`, `bounty`, `upgrade`, `open` on GitHub Issues
- Contributors claim by commenting `claiming this` and opening a PR

### Convergence Hub Structure
custos is the origin mold for a constellation of repos. Branches in this repo develop into separate repos via a formal lifecycle.

**`branch-tracker/branches.md`** — Active development map: each branch has a suit, status, and destination repo.

**`prima-clock/registry.md`** — Formal custody log. Significant events are expected to get a prima-clock stamp (`YYYYMMDDHHMM`). Include the current prima-clock value when creating MOAV carriers or vault entries.

**`moav/`** — MOAV (Mother of All Vinegar) carriers. JSON files documenting formal transitions. Naming: `[entity]_moav_[event].json`. Each carrier is expected to include its prima-clock stamp and a `chain_of_custody` field, barring a documented exception.

**`vault/`** — Origin molds. Documents placed here have passed formal custody. Not directly edited outside a formal custody review — active work happens on Carbonite instances. `vault/spade-of-aces/` holds ♠️ pinnacle documents only.

**`atelier/`** — Nursery. Concepts before they have names. Nothing here is finished — that is the point. When the Shepherd judges a concept ready, custos routes it to the appropriate branch or repo.

**`returns/`** — External agent stream returns. Each stream directory receives findings from the assigned AI model:
- `stream-1-language/` — Gemini: Language/Fodere/Agnoscere
- `stream-2-emotion/` — Gemini: Emotion Architecture
- `stream-3-variables/` — ChatGPT: Variable Constant Violation
- `stream-4-shepherd/` — ChatGPT: Shepherd Protocol
- `stream-5-math/` — Copilot: Mathematical Backbone / prima-clock
- `stream-6-grok/` — Grok: Domain — TBD (assignment pending)
- `stream-7-perplexity/` — Perplexity: Domain — TBD (assignment pending)

### Suit System
Branches and documents carry suit designations:
- ♠️ **Spade** — Pinnacle / vault items. Passed formal custody.
- ♦️ **Diamond** — Active development. Working branches en route to destination repos.
- ♣️ **Club** — Sessions / operations. Active working events.
- ❤️ **Heart** — (reserved)

### Seeds (`seeds/`)
`bootstrap.sh` installs packages via auto-detected manager (pkg/apt-get), deploys dotfiles from `seeds/dotfiles/`, creates `~/.prima-env`. Idempotent.

`env_setup.sh` detects the current location (`mulberry`/`pixel8`/`codespaces`) and sources `.locations/<name>/config.sh` — see `.locations/README.md`.
- Ported/adapted from hodie's `.scripts/env_setup.sh`.
- Static topology only: paths, active branch, whether `device/` is reachable.
- Not live device state — that stays in `device/` on the `pixel8` branch as before.

### Unexusi Layer (`unexusi/connect.yaml`)
Tracks player XP, level, quest completion, session timestamps across devices. Configures session lifecycle. `concept.slug: custos`.

### THEE / YOD / EMBER Triad
A listening practice for capturing fragments before they have names. Not a ticketing system.

### Prime State (`.prime`, `tools/prime_check.sh`)
Concept progression via prime numbers. Current: `3`. Advance only when a development phase completes. Template ships with `3`.

### Turns (`turns/`)
Session memory, append only. Four files, distinct purposes:
- `log.md` — *what* a turn built. One entry per meaningful session. Schema in `TURN_SCHEMA.md`: timestamp, prime, entity, intent, contribution, resonance, `witnessed: true`.
- `CLOSING.md` — the checklist for ending a session: review what happened, file loose ends in `queue/artesium-weir/`, append to `log.md`, update `device/active.md`, run `scan_lexeme.sh`, commit/push, optionally write an AAR. Run this whenever asked to "wrap up", "finalize", or "close out."
- `AAR.md` — *how* the turn went (process/friction/seeds), not what it produced. Same append-only spirit as `log.md`, different lens. Not every turn needs one.
- `CULTIVATION.md` — cross-PR catalog of open design conflicts surfaced at closing time (e.g. competing naming systems introduced in separate PRs). Resolve or explicitly defer each entry when read; don't let it become an unread backlog.

### Queue (`queue/`)
Staging ground for what has crossed in from outside but hasn't found its place yet — nothing here is finished. `queue/artesium-weir/` is the filter between raw inbound material (e.g. a PDF export of a GitHub PR thread) and formal chain of custody; see `queue/artesium-weir/README.md` for the routine. Per-item subfolders (e.g. `queue/artesium-<contributor>/`) hold in-flight artifacts until the Weir routes them onward — close them out via the `turns/CLOSING.md` checklist rather than leaving them mid-flow.

### Review Gates
- **Sentinel review** (`world/factions.md`) — required on every PR from `pixel8` → `main`. Default Sentinel: eaprime1.
- **Deck Master review** (`world/deck-master.md`, `.github/CODEOWNERS`) — required for `vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/`, and `device/` changes, and for all PRs to `main` from device branches. Same person (eaprime1) currently holds both the Shepherd and Deck Master roles; the roles are conceptually distinct (lifecycle/structure review vs. device-branch review), not duplicates.
- **CI**: `.github/workflows/` runs:
  - `scan-lexeme.yml` — placeholder scan
  - `prima-witness.yml` — Prima-clock provenance scan on newly-added `.md` files. Advisory, ported/adapted from hodie's stricter `footer-witness.yml`. Unlike hodie's version, it's stateless: no bot commits, no accumulating state file.
  - `final-review.yml` / `finalize-pr.yml` — the "Custos — Final Review Gate" manual Action referenced in CONTRIBUTING.md
  - `claude-code-review.yml`
  - `dependency-review.yml`
  - `sovran-voice.yml`

  Resolve Codacy findings before merge — see `docs/final-review-and-codacy.md`.

## Key Conventions

**Branches:**
- `main` — concept foundation (quests, world, tools, workflow, convergence hub)
- `pixel8` — Pixel 8 device layer (adds `device/` files, device-specific state)
- All PRs from `pixel8` → `main` require Sentinel review (default: eaprime1)
- Feature/concept branches: develop here, then dispatch to destination repo per `branch-tracker/branches.md`

**prima-clock stamps:** Use `date '+%Y%m%d%H%M'` to generate. Include in MOAV carriers and prima-clock/registry.md entries.

**MOAV carriers:** Create one when: a branch reaches its destination repo, a concept moves from atelier to active development, or a vault entry is placed. Include `prima_clock`, `entity`, `suit`, `iteration`, `chain_of_custody` unless a documented exception applies.

**Navigo model — AI+eaprime1 teams:**
Each navigo is a paired team of one AI model and eaprime1. They are internal contributors with the same accountability as external contributors; the Shepherd can redirect any navigo.

| Navigo | Team | Workspace |
|--------|------|-----------|
| nav1 | Claude + eaprime1 | `.claude/` |
| nav3 | Gemini + eaprime1 | `.gemini/` |
| nav5 | ChatGPT + eaprime1 | `.chatgpt/` |

Each navigo workspace folder holds three types of content:
- Source documents returned from that AI's sessions, before formal custody
- A queue of what to pick up next session
- Stream-return materials pending filing

Raw exports land in the workspace first, get renamed `.md` once reviewed, then file to `returns/`, `incoming/pre-nullus/`, or `atelier/`.

**Commissioning AI models:**
When creating a commission prompt for Claude, ChatGPT, Gemini, or Copilot, always include:
1. The mission/bounty issue URL or description
2. Files to read first: `prima.yaml`, `CLAUDE.md`, relevant quest or guide
3. The exact completion check command
4. The PR template format (Intent, What Arrived, Resonance, Ethics Check)

**Writing quests:** Every quest must have a deterministic `Completion Check` bash command. Quests teach by requiring real use of a skill. Arc dependencies should be minimal.

**Lore tone:** Short, evocative. The terminal is the world, not a tool. Avoid classroom framing.

**Placeholder detection:** Run `bash tools/scan_lexeme.sh` before committing. Flags: `TODO`, `FIXME`, `BROKEN`, `placeholder`, `REPLACE`, `TBD`, `???`, `UNKNOWN`, `"My Prima Terminal"` across `.md`, `.sh`, `.yaml`, `.json`.

**Turn log:** Append only. One entry per meaningful session. `resonance` is one honest word.

**Development plan:** See `docs/custos-plan.md` for the phased roadmap and current status.

## Known Stray Content (untracked, not part of the concept)

These currently sit in the working tree but are not part of custos and should not be assumed to be in scope, referenced in lore, or committed without first checking with the Shepherd:

- `airavata-custos/` — an unrelated Apache Airavata "Custos" project (Go IAM service + Next.js web app, its own nested `.git`). Name collision only; do not merge its content with this repo's `custos` concept.
- `seneschal/scanner/New folder/` — empty, undocumented. Likely an in-progress drop that hasn't been named or routed through `queue/` yet.
- `queue/artesium-<contributor>/` item folders — in-flight Weir material (e.g. a PDF export of a contributor's PR thread). Route through `queue/artesium-weir/README.md` and close out via `turns/CLOSING.md` rather than leaving indefinitely.
