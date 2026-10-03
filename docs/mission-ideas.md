# Mission Ideas

`suit: ♦️ Diamond — active build`
`prima-clock: 202609291030`

A seed queue of mission candidates. The Shepherd reviews and opens missions from here. Each entry is a candidate, not a commitment. Items marked ✅ are done (session 202609291932); open items are 3, 6 and the candidates below.

---

## Ready to open

### 1. `disponi` bot — availability check workflow ✅ done (#388, PR #389)
**What:** A GitHub Actions workflow that responds to `@claude disponi` in a mission issue comment, reads the issue labels, and replies: open / in-progress / paused.
**Why:** The mission-board procedure exists; the automation does not. Without it, `disponi` is a manual check.
**Completion check:** `grep -r "disponi" .github/workflows/ | grep -q "issue_comment"` exits 0.
**Label candidates:** `mission`, `bot-friendly`

### 2. `petitio` scaffolder — plan template prompt ✅ done (#392, PR #393)
**What:** When `disponi` returns "open," the bot posts a comment with the petitio template pre-filled (Intent / Approach / Completion check fields visible), so the navigo fills in a form rather than writing from memory.
**Why:** Reduces friction. Keeps petitio submissions consistent.
**Completion check:** `grep -r "petitio" .github/workflows/ | grep -q "petitio_template"` exits 0.
**Label candidates:** `mission`, `bot-friendly`
**Dependency:** Mission 1 (disponi bot)

### 3. `voices-of-navigo-manifesto` routing pass
**What:** Review the `feature/voices-of-navigo-manifesto` branch, determine what each item is (atelier candidate, returns filing, queue item, or discardable), and route accordingly. Open missions for any items that deserve one.
**Why:** The branch has significant unmerged content — dungeon-master/, pandora/, seep-artois/, state/, Gemini journey docs, Portaque JSON files, PDFs, seneschal.md. It cannot be safely deleted without this pass.
**Completion check:** `! git branch -r | grep -q "voices-of-navigo-manifesto"` (exits 0 once the branch is gone, after routing).
**Label candidates:** `mission`, `voices-of-navigo`

### 4. Sovran labels sync — add mission board labels ✅ done (PR #387; also `in-progress` and `paused` in PR #389)
**What:** Add `voices-of-navigo` and `anchor-review` to `.github/sovran-labels.yml` so they exist as official labels in the taxonomy.
**Why:** `docs/mission-board.md` defines these labels; they need to be in the sovran registry to be created by `sovran-labels-sync.yml`.
**Completion check:** `grep "voices-of-navigo" .github/sovran-labels.yml` exits 0.
**Label candidates:** `mission`, `bot-friendly`

### 5. Mission issue template — disponi/petitio instructions ✅ done (PR #387, no issue)
**What:** Update `.github/ISSUE_TEMPLATE/mission.yml` to include a brief note in the body explaining the `disponi` / `petitio` two-step for navigo contributors.
**Why:** Right now a navigo reading a mission issue has no in-issue reminder of the flow. The instructions live in `docs/mission-board.md` but not at the point of contact.
**Completion check:** `grep "disponi" .github/ISSUE_TEMPLATE/mission.yml` exits 0.
**Label candidates:** `mission`, `upgrade`

### 6. `docs/` index
**What:** A lightweight `docs/INDEX.md` listing every file in `docs/` with a one-line description and the prima-clock stamp of each.
**Why:** `docs/` has grown. A reader landing there has no map.
**Completion check:** `test -f docs/INDEX.md && grep "mission-board" docs/INDEX.md` exits 0.
**Label candidates:** `mission`, `bot-friendly`

---

## Candidates (needs scoping)

### 7. Navigo naming resolution
The `turns/CULTIVATION.md` flags an open design conflict: numbered navigo table vs. Navigo Claude / Navigo Perplexity / Navigo Unexusi naming. The Shepherd needs to decide and the table needs updating.
**Note:** Waiting on eaprime1's update — flagged in CULTIVATION.md as of 2026-09-27.

### 8. seep-artois integration
`seep-artois/` appears in the convergence hub structure but is not documented in `docs/convergence-hub.md`. What is the current seep-artois pool state?
**Note:** Needs a review pass before a mission can be scoped.

### 9. Session test — run the full disponi/petitio flow live ✅ done (live run on throwaway issue #398: disponi, petitio, placet, disponi; placet handler #395, PR #396)
Once the disponi bot exists, run a live test session: Shepherd opens a small mission, navigo posts `@claude disponi`, bot responds, navigo posts petitio, Shepherd accepts, navigo builds and merges.
**Note:** Depends on Missions 1 and 2.

### 10. Finishing a routine (a type of mission)
**What:** A routine that is set up and runs, but whose output has nowhere to land. Each mission decides where the output goes, makes it arrive there, and closes the loop so something is done with it. One mission per routine.
**Instances:** the email management routine; the email idea-mining routine (management feeds the miner); the daily briefing routine. None has been taken past setup. They are the Shepherd's routines, and their prompts are not copied here.
**Why a type:** the same questions apply to each: where does the output land, who reads it, and what happens next?
**Link to the halide process:** a routine that gathers could be a dark feed, its output entering as seed documents (`atelier/halide/`). Not decided.
**Completion check:** not yet writable; it needs the landing place first.
**Label candidates:** `mission`
**Note:** added 202610030033, from the Shepherd's words that the routines are intentional and their output is not landing.

---

## On the .dotfolder question

Consolidating `.claude/`, `.gemini/`, `.chatgpt/` into a single `.dotfolders/` parent would break tool discovery — each AI tool looks for its folder at the repo root by convention. The navigo workspace folders also carry queue and source documents that tools index. Keep them at root.

If the goal is visual tidiness in a file browser, the dot-prefix already hides them in most views. No consolidation needed.

---

*This list is a seed, not a backlog. Open missions from it when the Shepherd judges them ready.*
