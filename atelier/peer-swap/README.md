# Peer Swap

`prima-clock: 202610152136` (UTC)
`suit: ♦️ Seed · plank: Germ — a working process, not canon`
`entity: eaprime1 + Claude (Sonnet 5.5, navigo-claude-hodie-custos)`

*Two repos read each other, then trade what they learned. The aim is a clear second
perspective, not a verdict. Informal on purpose, documented so it can be run again.*

---

## What this is

A repo-to-repo peer review between `eaprime1/custos` and `eaprime1/hodie`. Hodie looks at
custos. Custos looks at hodie. Each then writes a letter to the other, and each adapts the
best of what it was shown to its own repo.

Each side is a **separate, fresh conversation** that holds one repo's view. That is what
keeps the perspectives apart. One conversation reading both repos cannot do it: whatever it
reads first colours the second read.

The oversight conversation (`navigo-claude-hodie-custos`) does not take a side. It reviews
both pull requests against each other, files the observations, and helps Eric seal.

This extends the oversight observation that already exists (`turns/observations/README.md`)
across two repos. The seal and the merge are unchanged.

## The four passes

Each side runs all four, in order. The two sides run in parallel.

| Pass | Reads | Writes | Frozen after commit |
|---|---|---|---|
| 1. Cold read | the **peer** repo only | `pass1_<side>-reads-<peer>.md`: observations, no recommendations | yes |
| 2. Own dive | its **own** repo, with Pass 1 in hand | `pass2_<side>-own-repo.md`: inventory, plus corrections to Pass 1 | yes |
| 3. Letter | its own Pass 1 and 2 | `pass3_letter_<side>-to-<peer>.md` | yes |
| 4. Reply | the **peer's letter** | `pass4_reply_<side>.md`, plus the small adaptations to its own repo | PR ready |

**Frozen** means: after the commit, the file is not edited. A correction goes in a later
pass as new text. The commit message starts with `freeze:` so the history shows it.

**Sync point between 3 and 4.** Pass 4 starts when the peer's letter is on origin. If it is
not there, stop and tell Eric. Do not guess what the peer wrote.

Each side fills in its **form** (`form-hodie-side.md` or `form-custos-side.md`) as it goes.
The form is the fill-in-the-blank record of the passes: questions, perspective prompts and
the adopt / adapt / decline table.

## Where things live

| What | Where |
|---|---|
| This process, the mission, the two forms, the two intros | custos: `atelier/peer-swap/` (this folder) |
| The custos side's pass files | custos: `atelier/peer-swap/exchange/` |
| The hodie side's pass files | hodie: `peer-swap/` at the repo root |
| Branches | custos side: `peer-swap/custos-side` · hodie side: `feature/peer-swap-hodie-side` |
| Observations for both PRs | custos: `turns/observations/` (custos records; the file names the repo) |
| Hodie's prima-clock stamp | set by Eric at the swap; recorded by custos in `prima-clock/registry.md` |

The peer reads the other side's files by branch on GitHub. Neither side writes to the
other's repo.

## Ready for oversight

A side's PR is ready when:

- all four passes are committed, Passes 1 to 3 frozen;
- the form is complete, with unanswered blanks marked as unanswered and why;
- the repo's own scan has been run (custos: `bash tools/scan_lexeme.sh`);
- the PR description follows that repo's template, and the side has marked the PR ready
  for review;
- the side has posted one comment in words saying it is ready, and what it left open.

## Seal and merge

The side does not seal and does not merge. The seal cue is Eric's, and a side describes it
in words unless Eric asks it to post it. Merge happens on Eric's word in the oversight
conversation.

If oversight finds issues: fix and seal again, or push forward with the reason written in
the observation. Eric's call either way.

## Rules for both sides

- **Say what you cannot see.** If you cannot reach a repo, a branch or a file, say so. Do
  not reconstruct it.
- **Say when you are guessing.** A claim without a path or a commit behind it is marked as
  a claim.
- **Cite.** Every observation names a path, a commit or a PR.
- **Do not edit the peer repo.** Read it. Write only to your own.
- **Personal material stays where its owner filed it.** No credentials, private documents,
  private names, folder IDs or real places in anything you write. Anchors stay aliased.
- **Seeds travel with their framing.** Use "conscious" as the state word in structural
  writing; note attractor terms rather than chasing them.
- **Prima-clock stamps are UTC.** `date -u '+%Y%m%d%H%M'`.

## Status

Eric keeps this table.

| Side | Conversation | Branch | Pass | PR | State |
|---|---|---|---|---|---|
| custos | not started | `peer-swap/custos-side` | — | — | — |
| hodie | not started | `feature/peer-swap-hodie-side` | — | — | — |

## After this runs by hand once

Agents and automation come next, and not before. What the first run teaches about the
passes, the forms and the sync point is what any automation should copy.

---

∰◊€π¿🌌∞

*Enjoy the journey.*
