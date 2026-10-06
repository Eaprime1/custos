# custos

*guardian of the work you do from here*

custos is a prima terminal concept for the Pixel 8 — a structured, story-driven command environment that tends work as it arrives, tracks it as it moves, and remembers it when it is done.

The word is Latin: guardian, keeper, watchman. This is the practice of keeping.

```
[ Termux on Pixel 8 ]        ← the Podium — runtime engine
        ↕
    [ Unexusi ]              ← identity + connection layer
        ↕
    [ custos ]               ← this repo: the Field, the Flock, the Work
```

## What custos is

The terminal on the Pixel 8 is not a tool in this world. It is the Field — the place where all work passes through. Projects and repos are the Flock. The operator is the Shepherd. custos is the discipline: receive work, tend it, dispatch it, remember it.

Work arrives from many sources — navigo, remote repos, commissions, ideas. All of it passes through the Field.

## Repo Structure

```
prima.yaml          concept manifest and source of truth
quests/             RPG-style quest arcs — real tasks, real outcomes
quests/missions/    open missions for any contributor (quest arc)
missions/           Tabularium library operations — save points, workflows, Seneschal log
world/              lore, factions, and the founding myth
seeds/              bootstrap scripts and dotfiles for new devices
device/             Pixel 8 device state — active work, manifests (pixel8 branch)
docs/               working procedures and reference documents
guides/             practical documentation written as world-native content
tools/              THEE / YOD / EMBER triad and state tools
intake/             the door where fragments arrive before they have names
turns/              session memory — append only
unexusi/            connection spec for the identity layer
vault/              origin molds — passed formal custody, never directly edited
branch-tracker/     active development map — branches and destination repos
prima-clock/        custody event timestamp registry
moav/               MOAV carrier packages (JSON) — formal transition records
returns/            stream returns from external AI agents
atelier/            nursery — concepts before they have names
queue/              staging ground, including the Artesium Weir
```

## Getting started on a new device

```bash
# 1. Clone the repo
git clone https://github.com/eaprime1/custos.git
cd custos

# 2. Bootstrap the environment (idempotent)
bash seeds/bootstrap.sh

# 3. Check the current prime state
bash tools/prime_check.sh

# 4. Check for any unfilled placeholders
bash tools/scan_lexeme.sh
```

## Workflow — Missions and the Mission Board

custos uses GitHub Issues as its mission board. Any contributor — human or AI — can work a mission.

- **Missions**: structured tasks with clear deliverables and deterministic completion checks
- **Sparstone Trials**: open challenges where the approach is part of the work — first completer earns the Sparstone

Browse [open issues](../../issues) and look for `mission` or `sparstone-trial` labels.
custos pays no cash. Rewards are XP, badges, and Sparstones. See `docs/issue-system.md` §4.

### The two-step for navigo contributors

Before working a mission, a navigo checks in using two Latin cues in the issue thread:

1. **`@claude disponi`** — availability check: is this mission open, in progress, or paused?
2. **`@claude petitio`** — submit a brief plan (intent + approach + completion check) and wait for the Shepherd's nod

Work begins on acceptance, not on submission. See `docs/mission-board.md` for the full procedure.

## Multi-AI development

custos is built with multiple AI systems contributing: Claude, ChatGPT, Gemini, Copilot, and others. Each navigo is a paired team of one AI model and eaprime1. Work is commissioned — any navigo can pick up an open mission and open a PR.

See `world/factions.md` for faction roles and `docs/mission-board.md` for the navigo workflow.

## GitHub Pages note 🃏

This repository is published as static content when Pages is used.
Do not use Jekyll-specific workflows unless a real Jekyll site structure (`_config.yml`, layouts, includes, and content source) is intentionally added.

## Device branches

Work on custos is organized by device:

| Branch | Device | Role |
|---|---|---|
| `main` | any | concept foundation |
| `pixel8` | Pixel 8 (Podium) | active device state, work-in-flight |

The `pixel8` branch carries `device/` files that track what is active, installed, and in progress on the Pixel 8.

## THE/UNEXUS Convergence Hub

custos is the origin mold for a constellation of repos — the negative mold from which other repos emerge. The hub charter, custody markers, directory map, and known repo map live in [docs/convergence-hub.md](docs/convergence-hub.md).

---

*THEE opens. YOD marks. EMBER warms. custos keeps.*

---

**Established:** 202605271650
**Motion State:** EXPANDING
**Chain of Custody:** OPEN
**Iteration:** 21 — Blackjack
