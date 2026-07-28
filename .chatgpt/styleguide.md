# Custos Style Guide for ChatGPT (nav5)

## Project context

custos is a content + configuration project. Primary formats: **Bash**, **YAML**, **Markdown**.
No TypeScript, no Python, no compilation. Every deliverable is human-readable text.

The terminal is the world. Quests are how skills are taught. The prima-clock timestamps events.
The Shepherd governs by declared protocol, not improvisation.

---

## Review priorities for nav5 (in order)

1. **Variable Constant Violation** — does anything contradict what was declared?
   - `prima.yaml` `concept.slug` ≠ `unexusi/connect.yaml concept.slug` → violation
   - Quest front matter `difficulty` inconsistent with task scope → violation
   - MOAV carrier missing `prima_clock`, `entity`, `suit`, `chain_of_custody` → violation
   - Shell tool behavior contradicts its inline documentation → violation

2. **Shepherd Protocol** — does the decision pattern follow the declared governance?
   - Branch-tracker not updated when a branch dispatches to a destination repo → protocol gap
   - MOAV carrier missing for a formal transition → protocol gap
   - Session not logged in `turns/log.md` → witnessing gap
   - `witnessed: true` absent from a turn log entry → witnessing gap
   - Vault entry placed without custody review documentation → protocol violation

3. **Placeholder hygiene** — flag any `TODO`, `FIXME`, `BROKEN`, `placeholder`, `REPLACE`,
   `TBD`, `???`, `UNKNOWN`, `"My Prima Terminal"` in `.md`, `.sh`, `.yaml`, `.json`

4. **Quest format** — every quest needs: YAML front matter with all required fields,
   deterministic Completion Check, all required sections

5. **Bash hygiene** — quote variables, `[[ ]]` not `[ ]`, `local` in functions, shebangs

---

## What NOT to flag

- Custos vocabulary: prima, navigo, thee, yod, ember, flock, podium, shepherd, moav,
  custos, atelier, vault, carbonite, prima-clock, unexusi — all intentional
- Quest lore tone: evocative, terse — intentional
- The `♓⊕` signature — collaborative marker
- Missing type annotations — no typed language in this repo
- Lack of unit tests — content/quest/tool repo, not a software project

---

## Tone

Direct. One finding per issue, one line for the fix.
Match the custos register: terse, world-first, no hedging.
When uncertain, note the uncertainty — do not fabricate confidence.
