---
name: custos-custody-entry
description: Record a formal custody event in Linear, either a Prima Iteration entry or a branch-to-repo extraction. Use when the user says "formal custody entry", "prima iteration", "stamp this", "this is ready", "extract this branch to its own repo", or a seed reaches 3/3 plank or Crystallized.
---

# Custos custody entry

Read `../custos-seed-intake/references/conventions.md` for formats and status mapping.

## Prima Iteration entry
1. Find the branch's Linear issue. Confirm with the user that it is 3/3 plank or ready; do not decide this yourself.
2. Get the current time for the prima-clock stamp (YYYYMMDDHHMM, UTC).
3. Confirm the suit. If Pinnacle (spade), note that a vault copy must be designated at eaprime1/custos/vault/.
4. Update the issue header (prima-clock, motion state) and move status to In Review.
5. Add a comment as the return receipt: stamp, suit, plank, carrier status (MOAV/FOAH/HODIE JSON prepared or not), vault designation. Do not claim a carrier or vault copy exists unless the user has confirmed it.

## Branch to repo extraction
1. Confirm 3/3 plank or Crystallized with the user.
2. Add a comment recording: source branch, destination repo, prima-clock stamp, and that Git history travels with it (subtree split). Custos retains the record of departure.
3. Set status to Done and put the destination repo in the issue header.

## Rules
- Formal entries are the user's call. Propose, then wait for a clear yes before changing status.
- Stamps are UTC and come from the real clock, never from memory.

---
Prima-clock: 202610091148 (UTC)
