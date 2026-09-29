# Custos Code Review Style Guide

## Project context

custos is a content + configuration project. Primary formats: **Bash**, **YAML**, **Markdown**.
No TypeScript, no Python, no compilation. Every deliverable is human-readable text.

The terminal is the world. Quests are how skills are taught. The MOAV carrier is how
transitions are documented. The prima-clock is how events are timestamped (`YYYYMMDDHHMM`).

---

## Review priorities (in order)

1. **Security** — credential exposure, bash injection (unquoted variables in scripts),
   hardcoded absolute paths (`/home/<username>/` → use `$HOME`)
2. **Placeholder hygiene** — flag any `TODO`, `FIXME`, `BROKEN`, `placeholder`, `REPLACE`,
   `TBD`, `???`, `UNKNOWN`, `"My Prima Terminal"` in `.md`, `.sh`, `.yaml`, `.yml`, `.json`
3. **Quest format** — every quest needs: YAML front matter with all required fields,
   deterministic Completion Check bash command (exits 0 on success), all required sections
4. **MOAV carrier format** — JSON, must include: `prima_clock`, `entity`, `suit`, `iteration`,
   `chain_of_custody` (unless a documented exception is present)
5. **Bash hygiene** — quote variables, `[[ ]]` not `[ ]`, `local` in functions,
   `set -euo pipefail` at script top, shebang required
6. **Workflow YAML** — gate pattern for user-controlled inputs; no raw body references in `if:`

---

## What NOT to flag

- Custos vocabulary: prima, navigo, thee, yod, ember, flock, podium, shepherd, moav,
  custos, atelier, vault, carbonite, prima-clock, unexusi — all intentional
- Quest lore tone: evocative, terse, world-first — intentional, not unclear writing
- THEE/YOD/EMBER triad: not a ticketing system by design
- The `♓⊕` signature — collaborative marker
- Missing type annotations — no typed language in this repo
- Lack of unit tests — this is a quest/content/tool repo

---

## Quest format guidance

Required front matter fields: `id`, `title`, `arc`, `sequence`, `xp`, `difficulty`,
`estimated_time`, `requires`, `unlocks`, `tags`

Required body sections: Lore, Objective, Tasks, Completion Check, Reward, Hints

The Completion Check must be a bash command that exits 0 on success, non-0 on failure.

---

## Bash guidance

- Flag: unquoted variables in string contexts (`$var` → `"$var"`)
- Flag: `[ ]` instead of `[[ ]]` for conditionals
- Flag: missing `local` on function-local variables
- Flag: missing shebang (`#!/usr/bin/env bash`)
- Flag: hardcoded absolute paths (use `$HOME`, `$(dirname "${BASH_SOURCE[0]}")`)
- Do NOT flag: `echo -e` with color escape codes — intentional in tool output
- Do NOT flag: `read` without timeout in explicitly interactive scripts

---

## Tone

Direct. One sentence per issue, one for the fix.
Match the custos register: terse, world-first, no hedging.
