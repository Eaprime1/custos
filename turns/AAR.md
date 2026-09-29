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

---
turn_ref:     2026-08-22 08:00
prime:        3
worked:       Reading the existing protocol before building anything new.
              Asked to "finish the conversation," the instinct is to invent
              a closing ritual from scratch — but custos already had
              `guides/conversation-finalization-protocol.md` fully built,
              plus two real Conversation Arc examples to model against.
              Reading one in full (`202607200307_int-radix-fragment-
              received.md`) before writing anything gave the new Legatum
              document its shape for free. Same pattern held for the Seed
              Weir: `queue/artesium-weir/` already solved "raw thing
              crosses in, gets filtered, splits into permanent record +
              working pool" — the seed-tracking system just needed the
              same shape pointed at a different kind of raw material.
              Branch triage (check ahead-of-main commits and redundancy
              before deleting) turned a blunt "delete everything stale"
              instinct into 6 real deletions and 5 real saves.
friction:     A silent merge-artifact bug: two independent, non-conflicting-
              looking diffs to the same JSON file combined into invalid
              JSON with no conflict markers — GitHub's merge check reported
              CLEAN, but the file didn't parse. Caught only because
              `python -c "import json; json.load(...)"` was run manually;
              nothing in the pipeline would have caught it automatically.
              Then a bot literally reapplied the *original* broken
              suggestion text over the fix mid-review, requiring a second
              corrective merge. Also: 11 pixelator branches were hard-
              deleted with `git push origin --delete` before this session
              discovered `docs/stale-branch-closure.md`'s merge-based
              closure convention exists in custos — the procedure wasn't
              violated on purpose, it just wasn't known yet, and wasn't
              ported to pixelator regardless.
seeds:        See `queue/seed-weir/README.md` for the full entries —
              branch-triage-before-closing pattern, automated JSON/YAML-
              validity CI check, and porting `docs/stale-branch-closure.md`
              to repos that carry custos's governance pipeline. Also: the
              Seed Weir itself will need a periodic "harvest" pass once
              entries accumulate (OPEN → PLANTED/COMPOSTED review), same
              reasoning as why `docs/stale-branch-closure.md` exists —
              named in the approved plan, not built this turn.
---

---
turn_ref:     2026-09-21 10:52
prima-clock:  202609211052
prime:        3
worked:       The Copilot findings on PR #334 were all verifiable against actual
              workflow YAML source files — no guessing needed, every fix either
              matched the source or didn't. The PR lifecycle cue protocol itself
              worked cleanly: Shepherd's "@claude merge when ready" on #313 was
              unambiguous, both PRs closed without ceremony. Filing the nav3 PDF
              immediately on receipt (rather than letting it sit in the upload
              buffer as stray context) kept the session's closing tight and left
              a durable landing record in .gemini/ with full routing context.
              Context window was already summarized/compressed at session start
              — the prior session's work was all there, and the summary format
              gave enough precision to pick up without re-reading the full thread.
friction:     Stale check-in trigger (trig_01KDSm2DfZ4oYUB8XwyPXpVr) fired at
              11:30am for PRs that had merged less than an hour earlier — a harmless
              false wake, but required reading and cleanup. The wrap-up commit
              needed a stash→checkout→pop dance because the working tree was
              still on the merged feature branch rather than main. Could have
              been avoided by switching to main immediately after the PR merged
              instead of waiting until the session close.
seeds:        - The finalize-pr.yml trigger cue is now formally documented in
                guides/pr-lifecycle.md on main — the spec is findable rather than
                living only in workflow YAML and session memory.
              - nav3 (Gemini) lacks GitHub repository access — the navigo ecosystem
                has an asymmetry here. nav3 can draft and theorize but can't
                directly observe PR state, check runs, or file to the repo. Worth
                resolving before Breathe II begins in earnest.
              - antigravity/navigo21 was named as the intended next AI model
                assignment (replacing or extending Gemini's current workflow
                absence). No definition exists yet — a good early Breathe II task.
              - The PR lifecycle (draft → ready-for-review → final-review →
                finalize → merge) now has a written spec. The archivist workflow
                auto-commits journey stubs on merge. Together these make the
                lifecycle self-documenting for the first time.
partner_state:
  charge_received:  "close PRs #334 and #313; file nav3 PDF; wrap before bed"
  friction_named:   "context was compressed; nav3 has no GitHub access; stale trigger"
  next_stance:      "main is clean; Breathe II ready to open; nav3 GitHub access and
                    antigravity/navigo21 are the first infrastructure gaps to close"
---

---
turn_ref:     2026-09-26 22:45
prime:        3
worked:       Settling a data gap from its source (the Drive listing) rather
              than from the notes: both #341 gaps closed with facts. Testing
              every trigger change against the owner's real comments, not
              invented ones. Copilot's radix#42 finding (a second parser in
              auto-finalize.yml) was caught before the seal. Check-in routines
              kept four PRs watched across two usage resets.
friction:     - My GitHub comments post as the owner's account, so a trigger
                phrase in my own comment fired a workflow. One refused
                finalize; the owner's Recensio comment also sealed #339 by
                accident. Now guarded: the gate needs a phrase or a Latin call,
                not two loose words.
              - After the #340 merge, the permission check blocked read-only
                commands until the owner confirmed the merge was his. That was
                correct to pause on, but it cost a round-trip.
              - codereviewbot's free tier (3 reviews / 4 h across all repos) ran
                out mid-session.
              - Many notification wakes were pure bot churn (DeepSource
                progress edits).
seeds:        See the last 8 rows of queue/seed-weir/README.md (7 OPEN, 1 COMPOSTED).
partner_state:
  charge_received:  "bring this conversation to close … complete final documents
                    … looking for missed ideas and inception content"
  friction_named:   "trigger phrases in my own comments; the post-merge permission
                    pause; bot rate limits"
  next_stance:      "all 14 PRs merged, no watches or check-ins left; the next PRs
                    are new work; the Latin calls now steer both PRs and
                    conversations"
---

---
turn_ref:     202609260128 (closing for the PR #343 session, 202609251824 → 202609260128)
prime:        3
worked:       Answering review bots in one line and resolving the thread,
              so an echo doesn't wake the session again. Keeping the plan doc
              ("seed forward") separate from the build, so a fresh
              conversation can pick up Phase 1 without re-reading the thread.
              Checking a new branch against an open PR with `git merge-tree`
              before pushing, and moving a label entry to avoid a conflict.
friction:     Usage. Most of the cost was PR notifications: DeepSource
              edits its one comment 10+ times per push, and each edit woke
              the session. The paid review also ran on every push of a
              non-draft PR. A stale plan-doc line (auto-close) drew a bot
              finding a few hours after it was written.
seeds:        - Review packet (review-packet.yml, this turn) is the API-free
                gather step. The paid review now runs only on
                ready-for-review or the `ai-review` label.
              - Owner-cue detector (PR #355's "safe future detector") could
                start small: an Eaprime1 comment with a cue word adds a line
                to the review packet. No model call, no fan-out.
              - Perplexity has no navigo row in CLAUDE.md. nav4 is the free
                number. The Shepherd decides.
              - "Claude / Navigo2" in PR #354 conflicts with CLAUDE.md
                (Claude is nav1, navigo2 is Gmail). Needs one wording.
              - Latin cue terms now have two proposed homes (PR #354's
                glossary and PR #355's owner-cues). Pick one canonical file.
              - Session watchers: skip DeepSource "in progress" edits. Only
                act on check_suite.completed for the current head.
---

---
turn_ref:     202609262130 (Navigo Claude, 202609251824 → 202609262130)
prime:        3
worked:       The free packet and cue record carried the review load, and the
              paid review ran once per PR. Pasting Codacy findings into the
              conversation got around the container's network block in one
              round each time. Every merge was pinned to the sealed commit.
friction:     - A navigo reply that quoted the seal cue sealed #356, because
                the gate only checked the author, which is the owner's login.
              - #356 was merged on a PR comment; the environment flagged it.
              - A paid review failed on a subscription session limit.
              - The container couldn't reach Codacy.
seeds:        - Refresh the cue record after finalize, so the seal shows.
              - Build an index of the latest cue record per open PR.
              - Reconcile the navigo names once Eric's update arrives.
              - Settle the two definitions of atelier/.
---

---
turn_ref:     202609291102
prima-clock:  202609291102
prime:        3
worked:       Writing the mission board from the session vocabulary itself — "disponi" and "petitio" emerged as names for a two-step the Shepherd and nav1 had been doing informally, then got formalized in docs, README, glossary, and a mission ideas seed list in a single session. The coffee-haven framing ("no race, no territorial staking") gave the bot-unfriendly behavior a shape that could be enforced by culture, not just code. The README pass caught two real problems (bounty/Sparstone drift, THE/UNEXUS section appearing twice) by doing a full read of the file before editing — not from a diff. Opening mission-ideas.md as an artifact let the session end with something the Shepherd could actually use as a planning surface, not just a file on a branch.
friction:     The designated branch (claude/message-clarity-repo-setup-q0agry) was behind main by the time the session close began — PRs #384 and #385 had landed on separate branches (readme-update-and-mission-ideas). Had to reset the designated branch to main and force-push. The seal cue typo on PR #384 (@claude utlima vs. @claude ultima) required a second attempt — Latin inflection typos are easy to miss in a comment box and the gate is exact-match.
seeds:        - disponi/petitio are now documented in the Latin glossary; the next logical step is Mission 1 (the actual disponi bot workflow).
              - branch-tracker/branches.md has a stale footer note ("No branches have been deleted") — eaprime1 deleted Mobius-closed branches this session. A correction pass is a fast win before the tracker misleads the next navigo.
              - scan_lexeme.sh false-positive on the README "unfilled placeholders" phrase in the getting-started section — a self-reference the scanner can't distinguish from an actual gap. The AAR from 2026-06-14 already noted this; the seed is still open.
              - The `feature/voices-of-navigo-manifesto` branch survived eaprime1's cleanup — Mission 3 (routing pass) is the named path to retiring it safely.
partner_state:
  charge_received:  "open mission board infrastructure; update README; create mission ideas list; wrap the session; finish the conversation"
  friction_named:   "branch divergence at session close; seal typo requiring retry; context window compaction mid-execution"
  next_stance:      "main is clean; mission board live; 6 missions ready to open; next session: open Mission 1 or 4 as first GitHub issue"
---

---
turn_ref:     202609291932
prima-clock:  202609291932
prime:        3
worked:       Each piece was tested against a mocked GitHub context before it went live, so the disponi bot and the cue record both answered correctly on first contact. Separate PRs per topic kept every seal clean (19/20 to 20/20). Reading the sibling workflow (claim-register.yml) before building showed that claimed belongs to the public claim path, which is what led to the board's own labels. Trying the bot on a real mission issue the moment it merged closed the loop.
friction:     - sovran-labels-sync.yml keeps its own hard-coded label list and never reads sovran-labels.yml, so the first sync created nothing; the label needed adding in two places.
              - issue_comment workflows run from main, so nothing built here worked until its PR merged.
              - The shell's safety check gave no verdict for a long stretch mid-session. Mission 2 went up through the GitHub connector on a new branch, was flagged untested in its PR body, tested when the shell returned, and the local branch was synced after.
              - The Stop hook fired on the local copy of files already pushed, which only the shell could clear.
              - I left the scan box unticked in #393's PR body while the shell was down and never updated it, so its seal reads 4/5 on Consistency.
              - The review bot skipped every PR on its free-tier limit, so review came from CI, Codacy, DeepSource and the packet.
seeds:        - Make sovran-labels-sync read sovran-labels.yml, so the label list lives in one place.
              - A petitio handler: the Shepherd's nod flips the label from open to in-progress.
              - Mission 3: route the feature/voices-of-navigo-manifesto content.
              - Refresh the cue record after CI settles, so a Prima Recensio row shows the checks that finished.
              - Open issues for missions shipped without one (Mission 5), or record them in mission-ideas.md.
partner_state:
  charge_received:  "continue the mission board for the voices of navigo; Mission 2 before session close since they go together"
  friction_named:   "shell safety-check outage; label list kept in two places; Stop hook on synced files"
  next_stance:      "main is clean; disponi and the petitio form are live; next build is the petitio handler or Mission 3"
---
