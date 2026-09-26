# The Issue System

*How work is posted, claimed, submitted and closed in custos, for humans and bots alike.*

`prima-clock: 202609251844`
`suit: ♦️ Diamond — operating manual, 2/3 plank (structure forming; the Shepherd confirms the open decisions marked below)`

---

## 1. Four kinds of issue

Every issue carries **exactly one** type label.

| Type | Template | What it is | Good for bots? |
|---|---|---|---|
| `mission` | `mission.yml` | Clear deliverable and a deterministic bash completion check. The approach is mostly fixed. | Yes, when it carries a Bot Brief |
| `bounty` | `bounty.yml` | The problem is defined but the approach isn't. Creative or open-ended. | Only with a submission block (see #235 for the pattern) |
| `upgrade` | `upgrade.yml` | Something exists; make it sharper. | Sometimes |
| `lexeme` | `lexeme.yml` | Develop a named concept or term from a citable source. Also the **fallback** for any mission that can't be done as written (§6). | Yes, it's designed for it |

## 2. Labels

Labels are defined in `.github/sovran-labels.yml`. Comment `@claude sync-labels` on any issue (owner, member or collaborator only) to apply them, or push a change to that file on `main`.

**State: one at a time, moving left to right.**

```
open ──► claimed ──► submitted ──► (closed: completed)
  │                      │
  └──► needs-shepherd ◄──┘        (blocked on a decision, a device, or an outside system)
```

| Label | Set when | Set by |
|---|---|---|
| `open` | issue posted, nobody on it | template |
| `claimed` | someone comments a claim | Shepherd or navigo on triage |
| `submitted` | a PR or submission is linked | Shepherd or navigo on triage |
| `needs-shepherd` | work can't proceed without the Shepherd, the Pixel 8, or an outside system | anyone |

**Modifiers (add as many as apply).**

| Label | Meaning |
|---|---|
| `bot-friendly` | The issue carries a Bot Brief (§5), so automated submitters have what they need |
| `anchor-review` | A claim touching lore or custody has no anchor. See `guides/anchor-review.md` |
| `held` | Deliberately paused; the decision lives in a separate conversation |

The `prima` label marks issues raised from review comments (the "Originally posted by @claude" issues). It isn't a type. Triage gives those issues a type or folds them into one.

## 3. Claiming

- **To claim,** comment `claiming this`. `/claim` and `/attempt` are read the same way.
- **A claim is not a lock.** Several people can claim one issue, and #187 had three. The Shepherd reads every submission. A claim says *I'm working on this*, not *nobody else may*.
- **Submitting** means opening a PR that says `Closes #N` or `Refs #N` in its body. A claim with no PR is intent, not a submission.
- **Protected issues.** An issue with a claim comment or a linked PR from someone outside the navigo teams isn't closed or rewritten during cleanup. It waits for the Shepherd's review.
- **Stale claims** *(proposed default, Shepherd to confirm)*: after 21 days with a claim and no PR, the issue returns to `open`. The claim stays in the thread as history. Returning a claim is not a failure (`.artesian/` convention).

## 4. What a custos bounty pays

> **Custos bounties pay in XP, credit and recognition, not cash.** *(Stated from the templates and every bounty posted so far, all of which name XP only. Shepherd to confirm.)*

- **XP** is the number in the issue's *XP reward* field. It's recorded in the contributor's claim ticket and in `unexusi/connect.yaml`.
- **Credit** means the contributor is named in the PR Journey, the registry row and any MOAV carrier that records the work.
- **Recognition** means a Club of Jacks Carbonite and claim ticket, issued at the Shepherd's discretion (precedent: #130, registry row 202607010209).
- **Cash** is paid only if the issue itself names an amount **and** the Shepherd has confirmed it in the thread. Bounty aggregators sometimes list custos issues with dollar values custos never offered. A PR that claims a cash reward with no anchor in the issue gets the anchor-review flag (worked example: `guides/anchor-review.md`).

If the Shepherd later decides to fund cash bounties, add a `cash-bounty` label and a *Reward (USD)* field to `bounty.yml` rather than overloading `bounty`.

## 5. The Bot Brief: writing issues bots can finish

Automated submitters (bounty-platform bots, Copilot, the navigos) read the issue body and not much else. An issue is `bot-friendly` only when its body answers all six of these:

1. **Read first:** exact paths (`prima.yaml`, `CLAUDE.md`, plus the one or two files the work touches).
2. **Write to:** exact output path(s). Say `world/` vs `atelier/` vs `tools/` explicitly. Bots guess `src/` when you don't.
3. **Form:** Markdown lore, shell script, YAML, JSON. Say **"no Python, no new runtime"** when that applies. Custos has no build pipeline.
4. **Completion check:** one deterministic bash command, copy-pasteable, run from the repo root.
5. **Submission shape:** the PR template sections (Intent, What Arrived, Resonance, Ethics Check, Sense Check), plus a YAML block if the issue defines one.
6. **Out of scope:** what a submission must **not** do (touch `vault/`, invent history, add dependencies, claim rewards).

The mission, bounty and lexeme templates carry these as fields. An issue missing any of them doesn't get `bot-friendly`.

**Lessons from past submissions.** #325 drew a Python class hierarchy with passing tests for what was a lore and routing concept (PR #333). It also drew a Markdown entity in `world/` (PR #331). The difference was whether the submitter could tell from the issue what form the answer should take. The Bot Brief closes that gap.

## 6. The fallback: when a mission can't be done

Sometimes a bot, or a person, reads a mission and can't do it: the tool needs the Pixel 8, the data is in another repo, the ask depends on context nobody wrote down. Rather than submitting something that only looks like an answer, take the **lexeme path**:

1. **Pick one lexeme or concept** named in the issue: a coined word, a character, a place, a process. Prefer the one the issue uses but never defines.
2. **Research it** against a citable source. **Wikipedia is preferred**; any source a reader can follow works (a dictionary, an encyclopedia, a paper, a museum page). Cite the URL.
3. **Write a development note** at `atelier/lexemes/<slug>.md` using the shape in `atelier/lexemes/README.md`: what the source says, what the term does in custos, the open questions.
4. **Say in the PR** that you took the fallback, and why the original mission wasn't possible.

**Example: the great stag.** A narrative has a character called *the great stag*, and nobody has ever said what the great stag is. A lexeme note starts from the Wikipedia article on the red deer (*Cervus elaphus*): antlers regrown each year, the autumn rut, the stag as a heraldic and mythic figure. It then asks what those facts would mean for the character. Does its authority renew each year like antlers? Is the rut its season of challenge? The note doesn't decide canon; it gives the Shepherd material to decide with. The narrative gains a creature without anyone inventing history for it.

Fallback completion check (the `lexeme.yml` template uses the same one):

```bash
f=$(git diff --name-only --diff-filter=A origin/main -- 'atelier/lexemes/*.md' | head -1); \
  test -n "$f" && grep -qi "^source:" "$f" && grep -qi "^## sense check" "$f" && echo "lexeme note ready: $f"
```

## 7. Final review: does what I made make sense?

Every submission ends with a **Sense Check**. It's in the PR template, and lexeme notes carry it as a section. Answer it honestly, in plain words:

- **Does it answer the issue that was asked,** or a different, easier one?
- **Would it make sense to someone who has never seen custos?** Read it once as a stranger.
- **Does it fit where it landed?** Lore in `world/` or `atelier/`, tools in `tools/`, nothing in `src/`.
- **Did I invent history?** Any claim that something happened, is owed or is canon has an anchor, or is marked as proposal.
- **If I'm unsure, did I say so?** "I couldn't tell whether X or Y was wanted, so I chose X" is a good answer. Silence isn't.

A submission that fails its own Sense Check and says so is more useful than one that passes quietly.

## 8. Posting a new issue: the Shepherd's checklist

- [ ] One type label, plus `open`
- [ ] Objective in one sentence
- [ ] Bot Brief fields filled; add `bot-friendly` if all six are
- [ ] A deterministic completion check that **fails today** (run it before posting)
- [ ] The fallback line: *"If this can't be done as written, take the lexeme path (docs/issue-system.md §6)"*, which the templates include
- [ ] XP reward (and no dollar figure unless you mean it)

## 9. Triage (a navigo's routine)

When sweeping the board:

1. **Protected** (outside claim or submission): don't close or rewrite; set `claimed` or `submitted`.
2. **Already done**: run the completion check. If it passes, close as *completed* with the evidence.
3. **Doable now**: do it, and close through the PR with `Closes #N`.
4. **Can't be done here** (device, other repo, outside system): consolidate into the relevant backlog file (e.g. `missions/TABULARIUM_BACKLOG.md`, `.claude/missions.md`) and close as *not planned* with a pointer, or set `needs-shepherd` if it needs a decision rather than a device.
5. **Record** the sweep in `turns/log.md`, and any unasked-for calls in `.claude/drift.md`.

---

*A mission is a door with the handle on the right side. Write it so whoever arrives, human or bot, can find the handle.*
