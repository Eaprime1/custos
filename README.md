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
quests/missions/    open missions and bounties for any contributor
world/              lore, factions, and the founding myth
seeds/              bootstrap scripts and dotfiles for new devices
device/             Pixel 8 device state — active work, manifests (pixel8 branch)
guides/             practical documentation written as world-native content
tools/              THEE / YOD / EMBER triad and state tools
intake/             the door where fragments arrive before they have names
turns/              session memory — append only
unexusi/            connection spec for the identity layer
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

## Workflow — Missions and Bounties

custos uses GitHub Issues as an open mission board. Any contributor — human or AI — can claim a mission.

- **Missions**: structured tasks with clear deliverables and completion checks
- **Bounties**: open challenges where the approach is part of the work

Browse [open issues](issues) and look for `mission` or `bounty` labels. Missions also appear as quests in `quests/missions/` for use inside the terminal.

## Device branches

Work on custos is organized by device:

| Branch | Device | Role |
|---|---|---|
| `main` | any | concept foundation |
| `pixel8` | Pixel 8 (Podium) | active device state, work-in-flight |

The `pixel8` branch carries `device/` files that track what is active, installed, and in progress on the Pixel 8.

## Multi-AI development

custos is built with multiple AI systems contributing: Claude, ChatGPT, Gemini, Copilot, and others. Each contributor is part of a faction (see `world/factions.md`). Work is commissioned, not assigned — any model can pick up an open mission and open a PR.
# CUSTOS


## THE/UNEXUS Convergence Hub


∰◊€π¿🌌∞


**Established:** 202605271650
**Motion State:** EXPANDING
**Chain of Custody:** OPEN
**Iteration:** 21 — Blackjack


---


Custos (Latin: guardian, keeper) is the convergence hub for THE/UNEXUS.
This is the negative mold. All repos emerge from branches here.


## Structure


| Directory | Purpose |
|-----------|---------|
| [/vault](./vault) | Origin molds — never directly edited |
| [/branch-tracker](./branch-tracker) | Active development map |
| [/prima-clock](./prima-clock) | Custody event timestamp registry |
| [/moav](./moav) | MOAV carrier packages (JSON) |
| [/returns](./returns) | Stream returns from external agents |
| [/atelier](./atelier) | Nursery — concepts before they have names |

See [CONTRIBUTING.md](CONTRIBUTING.md). The PR template in `.github/PULL_REQUEST_TEMPLATE.md` is the contract for all contributions — intent, what arrived, resonance, and ethics check.

---

*THEE opens. YOD marks. EMBER warms. custos keeps.*

## Known Repo Map


| Repo | Role |
|------|------|
| eaprime1/custos | This hub |
| eaprime1/nullus | Pre-system void preparation |
| eaprime1/the | Main system active development |
| eaprime1/diamond-reservoir | Seed pressure system |
| eaprime1/prima-clock | Temporal anchor registry |
| eaprime1/121 | Periodic table expansion |
| eaprime1/milkweed-vectors | Seeded vector templates |


---


*∞pace∞*
