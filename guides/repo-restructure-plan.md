# Repo Restructure Plan — how to build one

`suit: ♦️ Diamond — protocol, structure forming`
`prima-clock: 202610171907`
`status: proposal for the Shepherd; first used on vault, archivum, nullus and queue (see atelier/repo-restructure/)`

*Repos grow by accretion. A restructure moves things so they are easier to find and safer to keep,
without losing any of them. This is how to make the plan before touching anything.*

---

## Rules

1. **Inventory before opinions.** Look at what is in the repo (`bash tools/repo_inventory.sh <path>`), not at what you remember.
2. **Nothing disappears.** Every file ends up kept, moved (with a destination), retired (with a reason) or quarantined. Record a hash before anything moves.
3. **Secrets and safety first.** If an inventory shows a tracked secret, stop, tell the owner and plan the rotation before any tidying.
4. **Keep history.** Move with `git mv`; for a branch becoming a repo, follow `docs/stale-branch-closure.md` and the extraction steps for the destination repo.
5. **One repo per PR, and a rename in its own PR.** Moving and renaming together makes review impossible.
6. **custos is the only repo in the chain of custody.** A restructure that births a repo, moves a branch to its destination, or places something in a vault gets a row in `prima-clock/registry.md` and, where the conventions call for it, a MOAV carrier.
7. **Name the repo's job in one sentence.** If the sentence needs "and", it is two repos or two folders.

## The seven steps

| # | Step | Output |
|---|---|---|
| 1 | **Inventory.** Run the inventory tool. Read each top-level folder's first lines. | The inventory, pasted into the plan. |
| 2 | **Name the job.** One sentence. Check it against the README and the repo's own `CLAUDE.md`. | A job line, plus any mismatch with the current README. |
| 3 | **Classify every top-level entry:** keep, move to `<where>`, retire, quarantine. Say why. | The classification table. |
| 4 | **Settle the awkward names and files:** names with spaces or leading symbols, nested `.git` folders, duplicate files (compare hashes before deciding which is the copy), files over 1 MB (cold storage with the hash recorded). | A short list of fixes. |
| 5 | **Order the moves.** Safest first, renames last. | A numbered order, each step one PR. |
| 6 | **Say how each step is checked:** file count before and after, hashes of moved files, links still resolve, CI green. | A check per step. |
| 7 | **Record.** Registry row, carrier if called for, and a line in `turns/log.md`. | The custody trail. |

## Plan template (copy into `atelier/repo-restructure/`)

```
# Restructure plan: <repo>
prima-clock: <YYYYMMDDHHMM>   inventory run: <date, commit>   status: proposal

Job (one sentence):
Mismatch with README / CLAUDE.md:

| Entry | Files | Verdict | Where | Why |
|---|---|---|---|---|

Awkward names / duplicates / large files:
Secrets or safety findings:
Order of moves (one PR each):
Checks per step:
Open questions for the owner:
```

## Stop conditions

- A tracked secret is found.
- The repo is not the owner's.
- More than a fifth of the top-level entries cannot be classified from their names and first lines. Ask the owner before guessing.
- A move would break a path another repo depends on. Find the dependents first (`grep` across the sibling repos).

## A note on public repos

Anything committed to a public repo stays in its history. If a plan removes something sensitive from the working tree, it must also say whether the history needs rewriting, and who decides.

---

*THEE opens. YOD marks. EMBER warms. custos keeps.*
