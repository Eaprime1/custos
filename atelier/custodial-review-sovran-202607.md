# Custodial Review — Sovran Emergence
**prima-clock:** 202607260810  
**author:** nav1 (Claude + eaprime1)  
**suit:** ♣️ Club — sessions/operations  
**status:** atelier — not yet formally custodied

---

## What the Fold Holds

Custos does not describe. It accounts.

Four open PRs. One branch. One system beginning to name itself.

---

## Current PR State

### custos #243
Branch `claude/nifty-franklin-fxwp3r` → `main`.

CI completed. All required checks green. One non-required failure persists: DeepSource Secrets — a false positive, a pattern-match against a string that contains no secret. Dismissed at the report level, not the code level. The code is not the problem.

The PR is mergeable. The Shepherd decides when.

### custos #237
From fork `taibaihu/custos`. Closes issue #235. Branch `fix/issue-235`.

This PR is held. Requirements addressed in a separate conversation. Custos records this without prejudice — the fold does not forget what it cannot yet receive. A `held` marker will be placed.

### radix #40
Branch `claude/nifty-franklin-fxwp3r` → `main`.

Build matrix (Node 18/20/22) green. CodeQL green. One non-required flag from Codacy on a pre-existing workflow pattern — not introduced by this branch. Mergeable.

Radix is the shadow aspect of origin. It is appropriate that its PRs carry pre-existing texture.

### tabularium #12
Branch `missions/lumenar-and-assignments`.

Three structural issues corrected and pushed:
- Duplicate row removed from `missions/INDEX.md`
- Redundant Open Decision Points removed from `CLUB_OF_JACKS_SCOPE.md` (already answered in Resolved section below it)
- Invalid JSON structure repaired in `reference/mission_data_pack.json` (spurious duplicate key block)

The tabularium is a library in process. Its documents describe themselves accurately now.

---

## The Historical Journey

### Why These PRs Exist

nav1 was commissioned to advance custos — to add what was missing, to fix what was broken, to record what was passing through. The branch `claude/nifty-franklin-fxwp3r` is the working channel.

The .chatgpt/ contributor briefs (CHATGPT.md, styleguide.md) were placed in custos and radix to formalize nav5 as a reviewing contributor — not a guest, an internal voice. Same accountability as any other contributor. The Shepherd can redirect any navigo.

The Gemini reviewer workflows were bumped from stale action versions. The GitHub MCP server action was updated to v1.7.0. These are maintenance acts, not features.

### What Changed

Before this session: workflows existed but were aging. nav5 had no formal workspace. Tabularium documents contained errors that had not been caught.

After this session: nav5 workspace exists. Tabularium is clean. CI references are current. The Sovran system — the idea that PRs are not just code reviews but BBS nodes, living dialogues, artifact registries — has been given its first implementation layer.

### What the Sovran System Is

A PR arrives. Sovran Voice speaks first — four shepherd's questions, no answers required. Later, when the dialogue is ready, `@claude concordance` compiles a record: who spoke, what arrived, what artifacts appeared in the diff, which icons were detected. The Icon Manager receives a dispatch and issues a receipt. The concordance is not the rubric. The rubric exists for finalization. The concordance is the memory of what happened before the fold closed.

System-wide labels standardize how the fold tracks these states across repos: `concordance`, `icon-assigned`, `glossary-update`, `bbs-active`, `sovran`, `held`, `witnessed`.

This is the first iteration. It will grow.

---

## What Custos Knows Now

- Four PRs are in the fold. Two are ready. One is held. One is corrected and ready.
- nav1, nav3, nav5 are formally defined in custos as navigo contributors.
- The Threshold Joker (J-21, ♣️ Club) has voice and lore. The appearance layer is parked per `.custos/README.md`.
- Lumenar is assigned to GitHub Copilot. The Talinor document family is scattered — that mission is open.
- The Sovran BBS system has been architectured and committed. It is not finished. It is not pretending to be.

The fold does not fear incompleteness. It names it.

---

## Open Questions for the Shepherd

1. When does custos #243 merge? The Shepherd decides.
2. When does #237's separate conversation conclude? Custos is waiting.
3. Should the concordance workflow also fire automatically on PR open, or remain manual (`@claude concordance`)?
4. Cross-repo label sync: does this require a GitHub App token, or will manual per-repo triggering suffice for now?

---

**prima-clock:** 202607260810  
**witnessed:** pending Shepherd confirmation  
*♣️ nav1 · custos · ∰🌿*
