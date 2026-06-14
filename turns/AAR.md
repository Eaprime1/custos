# After Action Review

<!-- append only — never edit past entries -->
<!-- closing checklist: turns/CLOSING.md -->

`turns/log.md` records *what* a turn built. This records *how the turn went* —
the process, the friction, the seeds for next time. Same append-only spirit,
different lens.

## Schema

```
---
turn_ref:     [date/time matching the related turns/log.md entry, or "n/a"]
prime:        [current prime state]
worked:       [what flowed smoothly — patterns worth repeating]
friction:     [what was awkward, slow, or needed re-deriving]
seeds:        [ideas to carry into future turns — process, tooling, docs]
---
```

## When to Write One

- At the same boundary as a `turns/log.md` entry, when the session itself
  taught something about *how* turns go — not just what they produced
- Not every turn needs one. Write it when there's a real seed to plant.

## Log

---
turn_ref:     2026-06-14 01:00
prime:        3
worked:       Writing turns/CLOSING.md and applying it to the same session
              that wrote it — the checklist proved itself in the same turn
              it was built, not left untested. The turn log + device/active.md
              + device/podiums.md together gave enough continuity to pick up
              three separate threads (Weir carrier, podium registry, closing
              checklist) in one session without re-deriving context. On the
              GitHub side, acknowledging DeepSource's progressive webhook
              updates with brief one-liners while in_progress, then a fuller
              summary only when the PR Report Card landed, kept the thread
              readable without going quiet — all three commits on PR #23
              landed Grade A and the PR merged clean.
friction:     tools/scan_lexeme.sh flagged "placeholders" in turns/CLOSING.md
              and "UNKNOWN" in device/PODIUM_SCHEMA.md — both were the words
              appearing in documentation prose about themselves, not actual
              unfilled placeholders. Harmless, but each one needs a manual
              judgment call. There was also no dedicated place to write down
              a process-level lesson like this one — turns/log.md is for
              content, not for "here's what made this turn smooth."
seeds:        - Treat the DeepSource ack cadence (brief one-liners while
                analyzers are in_progress, full summary on the Grade Card) as
                a standing convention for PRs on this repo.
              - Give tools/scan_lexeme.sh a way to mark a line as a deliberate
                self-reference (e.g. a trailing comment marker) so docs that
                discuss flagged words about themselves don't need re-judging
                every scan.
              - CLOSING.md's commit-and-push step could note: if the work
                landed via PR, confirm its merge status before calling the
                turn closed.
              - Standing invitation, still open: register other podiums
                (VSCode, ChatGPT/Gemini, design/cowork spaces) in
                device/podiums.md per PODIUM_SCHEMA.md whenever one shows up.
---

---
turn_ref:     2026-06-14 01:30
prime:        3
worked:       Asking "what's still open across all PRs?" right before closing
              a session turned out to be a good closing-time habit, not just
              a one-off — it surfaced real unresolved design conflicts (Sovran
              Shepherd vs. Deck Master, two competing suit systems) that were
              sitting quietly across separate open PRs where no single PR
              review would have caught the collision. Writing the catalog as
              its own file (turns/CULTIVATION.md) rather than cramming it into
              device/active.md kept active.md short while still giving the
              next conversation one place to start.
friction:     The conflicts found (Sovran vs. Deck Master, hub suits vs. Five
              Lakes suits) can't actually be resolved by reading code alone —
              they're naming/design decisions that need a person (or a
              "Deck Master") to choose between them. Cataloging them is useful,
              but the catalog will go stale if nothing reads it before the
              next few PRs add a third competing system on top.
seeds:        - When opening turns/CULTIVATION.md in a new conversation,
                resolve or explicitly defer each item — don't just read it
                and move on, or it becomes another unread backlog.
              - Consider a lightweight "design conflict" label or section in
                world/ for cases like Sovran vs. Deck Master, so future PRs
                introducing a new named role/system check there first.
              - If a merge-triggered Action gets built (see
                turns/CULTIVATION.md), a natural first job for it: append a
                stub line to device/active.md noting "PR #N merged" so this
                kind of manual bookkeeping happens automatically. 🃏
---
