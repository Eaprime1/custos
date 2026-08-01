# Stale Branch Closure

Every branch was opened for a reason. A mistake is still a moment — it deserves a record, not deletion.

## The Principle

Branches are closed through a merge, not abandoned. When a branch has gone quiet — no active development, no pending PR, no assigned navigo — it follows the closure procedure below. The commit graph preserves what happened. The archivist captures the stub.

## When a Branch Is Stale

A branch is stale when:
- No commits in 30+ days with no active intent from the Shepherd
- No open PR, or the PR is a duplicate / superseded
- The work was absorbed into another branch or repo

## Closure Procedure

**1. Identify intent.** Check `git log`, the PR history, or the branch name itself. Even "mistake" or "experiment" is a valid intent. Name it.

**2. Add a closure note.** If the branch has uncommitted or unwanted diffs that should not land on main, run `git reset --hard origin/main` before proceeding — only the closure note should arrive on main, not the branch's prior unfinished work. Then create one file on the stale branch:

```
pr-journeys/closures/BRANCHNAME.md
```

Template:

```markdown
# Branch Closure: [branch-name]

**Prima-clock:** [YYYYMMDDHHMM]
**Opened:** [approximate date or triggering event]
**Intent:** [what was this branch for? one sentence. "mistake" is valid.]
**What arrived:** [any files, drafts, or ideas. "nothing" is valid.]
**Closure reason:** [superseded / duplicate / mistake / intent absorbed elsewhere / complete]
```

**3. Open a PR.** Draft is fine. Label: `closure` (defined in `.github/sovran-labels.yml` and synced automatically — no manual creation needed). Title format: `closure: [branch-name]`.

**4. Use the closure PR body:**
- **Intent:** what the branch was originally opened for
- **What arrived:** what (if anything) was built or explored
- **Resonance:** one word
- **Ethics check:** none / all clear

**5. Review gate.** Shepherd review required. Deck Master review is also required when the closure touches `vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/`, or `device/`, or when the closure represents a significant lifecycle transition (per `world/deck-master.md`). Deck Master and Shepherd are currently held by the same person (eaprime1); both roles still require acknowledgment.

**6. Merge.** Use a **merge commit** (not squash). Squashing collapses the branch history, which defeats the lineage preservation that makes this procedure meaningful. The closure note lands on main. The archivist captures the stub automatically.

**7. Delete the branch.** After merge, delete the branch. The commit graph preserves the lineage.

## pr-journeys/closures/

A lightweight record — not a formal custody document. No prima-clock chain required. No MOAV carrier unless the branch held significant concept work that needs formal chain-of-custody. One file per closed branch. The directory exists to give stale branches somewhere to go.

## For the Navigo

When a Claude session is assigned a branch and finds it stale or empty, the navigo:

1. Checks `git log` and PR history to identify what the branch was opened for
2. Writes the closure note — `pr-journeys/closures/BRANCHNAME.md`
3. Opens the closure PR with the `closure` label
4. Does **not** invent substantial content to justify keeping the branch open

The record is the point, not the content volume.

## Adding Content to Justify a Merge Is the Wrong Path

Padding a stale branch with documents just to have something to PR is exactly what this procedure replaces. The closure note *is* the content. It takes two minutes. It tells the truth about what happened. That is enough.

**Origin:** ᚨ navigo-voiced · nav1 · prima-clock 202608011200
