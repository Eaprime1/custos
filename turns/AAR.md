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


## Partner State (optional)

When a turn involved real back-and-forth — friction surfaced, a charge
carried, a stance handed forward — record it alongside the AAR entry.

```yaml
partner_state:
  charge_received:  ""   # what the collaborator understood the Shepherd to be asking for
  friction_named:   ""   # strongest ambiguity, limit, or constraint encountered
  next_stance:      ""   # continue / challenge / verify / wait / route-elsewhere
```

Use this when the fields earn their place. Leave it out when they do not.

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

---
turn_ref:     2026-06-23 01:35
prime:        3
worked:       Reading a failing job log in full (not just the status) was the
              only way to learn that claude-code-action prefers api_key over
              oauth_token when both are configured — the error message alone
              ("Credit balance is too low") gave no hint that two auth paths
              existed or which one was active. Checking atelier/ before
              writing new reflective content paid off immediately: two seeds
              filed months ago (ouroboros-wobble.md, concordance.md) already
              named the exact phenomena eaprime1 was describing from lived
              experience, just without the concrete cases yet attached.
friction:     send_later (referenced in this session's own system instructions
              as a way to self-schedule PR check-ins) is not an actually
              connected tool in this environment — ToolSearch found nothing
              by that name. Had to tell eaprime1 plainly that it can't be
              built from inside this repo; it would need to be a harness/
              platform feature, not something custos's own tooling can
              manufacture. Also: the specific drifted lexeme(s) from the
              "polish and proceed" pattern live only in eaprime1's memory of
              old conversation transcripts, not in this repo — couldn't be
              named without him, so the seed had to be filed as a labeled
              gap rather than a finding.
seeds:        - When a session produces both an infra fix and a reflective/
                conceptual insight, check atelier/ for a pre-existing seed
                before writing a new one — this session found two matches in
                under a minute and the connection was worth more than either
                fix alone.
              - Concordance's "methods and processes" scope question (open
                thread in concordance.md) should probably resolve yes — the
                claude-code-action auth-precedence case is exactly the kind
                of process knowledge that's expensive to rediscover and the
                lexeme-only scope wouldn't have caught it.
              - If eaprime1 ever supplies the actual drifted word(s) from old
                transcripts, the right destination is back into
                ouroboros-wobble.md's "Lived example" section — that's
                already the labeled landing spot.
---

# Append to turns/AAR.md

---
turn_ref:     2026-06-29 00:00
prime:        3
worked:       Reading .sovran/identity.md and .custos/README.md before any
              task list gave the session its orientation — the constitutional
              before the operational. The ethics-foundation.md wrote quickly
              because PR #133 had already proved the three oversight questions
              in practice; the document was naming what happened, not inventing
              what should happen. J-21 / Lumenar connection from PR #38 arrived
              without being forced — six commits separated the symbol from the
              doctrine it would anchor. That's the kind of structural coherence
              that doesn't get designed; it gets noticed. Pipeline.md as a
              custody ledger (not a Kanban board) kept the tracking inside
              the repo's own idiom — append-only, human-readable, no external
              tool dependency.
friction:     Local custos clone location still unknown — all work produced
              into a staging area at ~/pixel8a/custos-staged/ rather than
              directly into the repo. Ripgrep symlink fix requires a session
              restart to take effect (applied mid-session, not picked up).
              turns/AAR.md partner_state addition written as a separate
              instruction file rather than a direct edit because the clone
              wasn't reachable.
seeds:        - Once local clone is located or re-cloned, record the path
                in device/active.md so it's never re-derived.
              - Rotate CLAUDE_CODE_OAUTH_TOKEN secret immediately — this is
                blocking live PR reviews. Command: gh secret set
                CLAUDE_CODE_OAUTH_TOKEN --repo eaprime1/custos
              - requirements.txt dedup: pip freeze > requirements.txt from
                inside the correct venv removes the duplicate block.
              - Shadow Awareness Navigation Framework: ETHICS is written.
                Next session decision: name the destination repo and add it
                to branch-tracker/branches.md.
              - roman-numerals package on device — worth noting if iteration
                numbering in outputs moves toward formal Roman notation.
partner_state:
  charge_received:  "open a full Blackjack session; act on pending threads;
                    begin the oversight layer — ethics, tracking, sponsorship"
  friction_named:   "local clone unreachable; working from GitHub raw content
                    only; Glob/ripgrep needs session restart to function"
  next_stance:      "continue — all PRs staged, workflow fix identified,
                    Shepherd needs to: rotate secret, push branches, send
                    Rachaelisa response, decide SANF repo name"
---
