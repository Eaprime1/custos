# custos — Development Plan

*Deep dive plan for the custos repo. Living document — update as phases complete.*

---

## What We Are Building

custos is a prima terminal concept for the Pixel 8. Its job is to be the guardian layer for all work done from the device: receiving work, tending it across sessions, dispatching it to the right contributors, and remembering it faithfully.

The repo is the concept. The device branches (`pixel8`, future: `navigo`) are the live working state. The workflow system (missions and bounties) is how work flows through the Field.

---

## Phase 1: Concept Establishment ✓ COMPLETE

**Goal:** custos has an identity, a world, and a functional door.

- [x] Fork prima template
- [x] Fill `prima.yaml` (name: custos, slug: custos, theme: guardian)
- [x] Write `world/lore.md` (The Podium, the Field, the Flock)
- [x] Write `world/factions.md` (Scribes, Builders, Sentinels, Wanderers, Unexusi)
- [x] Rewrite `README.md` for custos
- [x] Add CLAUDE.md with codebase guidance
- [x] Create `.github/ISSUE_TEMPLATE/` for missions and bounties
- [x] Create `quests/missions/` arc (first 3 quests)
- [x] Establish convergence hub structure (atelier, vault, moav, prima-clock, returns, branch-tracker)
- [x] Quest 000 verified: `prima.yaml` is named — door is open
- [ ] Write first turn log entry in `turns/log.md`
- [ ] Advance `.prime` from 3 to 5

---

## Phase 2: Device + Hub Activation ← current

**Goal:** The Pixel 8 is a functional Podium. The convergence hub is routing work. The agent streams are live.

- [x] Write first turn log entry (`turns/log.md`) — mark the founding
- [ ] Advance `.prime` from 3 to 5
- [ ] Run `bash seeds/bootstrap.sh` on the Pixel 8 (at `~/pixel8/custos`)
- [ ] Organize `~/pixel8a` content into `~/pixel8` on the device; log migration in `turns/log.md`
- [ ] Populate `device/active.md` with real current work (replace placeholder entries)
- [x] Define the empty branches: `radix`, `mulberry`, `mandelbrot`, `main-to-radix`, `֍custos֎` — add each to `branch-tracker/branches.md` with suit/status/destination
- [ ] Open the external agent streams — commission first returns from Gemini, ChatGPT, Copilot into `returns/`
- [x] Log hub activation event in `prima-clock/registry.md`
- [ ] Advance `.prime` to 7

---

## Phase 3: Workflow System Live

**Goal:** The mission/bounty system is operational. At least one commission has been completed.

- [ ] Post first open mission issue (use template)
- [ ] Complete Quest: missions/001-first-commission
- [ ] Post first bounty issue
- [ ] Commission an AI faction member (Claude, Gemini, GPT, or Copilot) on a task
- [ ] Merge first externally-contributed PR
- [ ] Complete Quest: missions/003-ai-commissioning
- [ ] Advance `.prime` to 11

---

## Phase 4: Multi-AI Development

**Goal:** Multiple AI models are contributing to custos through the mission system.

- [ ] Define per-model commission prompts (what to tell Claude vs GPT vs Gemini)
- [x] Document multi-model workflow in `guides/multi-ai-workflow.md`
- [ ] Create `quests/scribes/` arc for Scribe faction missions (writing, docs, lore)
- [ ] Create `quests/builders/` arc for Builder faction missions (tools, scripts)
- [ ] Run a "round" — post 3 missions, commission 3 different models, review all PRs
- [ ] Advance `.prime` to 13

---

## Phase 5: Constellation

**Goal:** custos extends to navigo and potentially other devices. The concept scales.

- [ ] Create `navigo` device branch
- [ ] Add `device/navigo.yaml` manifest
- [ ] Define sync protocol between pixel8 and navigo working states
- [ ] Consider whether beasis concept connects to or extends custos
- [ ] Write `guides/constellation.md` — how multiple devices operate in the Field
- [ ] Advance `.prime` to 17

---

## Ongoing Conventions

**Reviewer for pixel8 branch:**  
All PRs from `pixel8` → `main` require Sentinel review. The Shepherd (eaprime1) is the default Sentinel. When commissioning AI models, the Shepherd reviews the result before it merges.

**Turn log cadence:**  
One entry per meaningful session boundary. Intent and contribution may differ — that is fine and expected. `resonance` is one honest word.

**Prime state:**  
Advance the prime when a phase completes. Do not advance it for partial work. The prime is a ceremony, not a counter.

**Missions vs bounties:**  
If you know exactly what needs doing, post a mission. If you know the problem but not the solution, post a bounty. Both are valid. Both are open to any faction.

---

*witnessed: 2026-05-30 | prime: 3 | entity: Claude | resonance: arriving*
