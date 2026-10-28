# Evaluation and ideas — custos side of the first peer swap

`prima-clock: 202610160124` (UTC)
`suit: ♦️ Seed · plank: Germ — a working record, not canon`
`entity: eaprime1 + Claude (Sonnet 5.5), custos side`

*Written after Pass 4 and after Eric asked for the three follow-ups (registry row, footer, stale statements) and for an evaluation. Kinds of claim: observed, reported, guess.*

---

## 1. What the swap produced (observed)

- Four findings in custos that custos had not fixed for weeks, found by reading it from outside and then again from inside: stale `CLAUDE.md` statements (`device/` on `main`, nine workflows of 25, absent stray paths, absent `seeds/dotfiles/`), a registry row that outlived its tree, a carrier index that listed 5 of 13, and a footer guard that matched one wording of two.
- Most of them were found by **comparing a described thing with the tree**, not by judgment. Eleven of the 66 backticked paths in `CLAUDE.md` did not exist when I checked; most of those 11 are legitimate (hodie paths, repo names, folder names written relative to `returns/`). The real ones were `airavata-custos/`, `seeds/dotfiles/` and, earlier, the nine-workflow list.
- The footer defect is the one finding that was not about drift. It came from reading what the peer proposed to copy.

## 2. What worked

- **Writing to your own repo only, reading the other.** Nothing needed repair on the peer side.
- **Passes 2 and 3 before the peer's letter.** The letter then confirmed findings I had already made instead of steering them. The two sides agreed on five of five shared findings without having read each other's Pass 2. That agreement is the evidence the method is sound.
- **Naming the kind of claim** (observed / reported / guess). It made it cheap to see what I had run and what I had only read.
- **The freeze rule.** One scanner hit in a frozen file needed a wording-only fix commit, and the commit says so. That was visible and cheap.

## 3. What did not work, or cost time

- **The roles were confused at the start.** The first instructions and Eric's clarification disagreed about which repo to write to. It cost a round trip. A one-line table at the top of the mission ("you read X, you write to Y, branch Z") would have prevented it.
- **Two hodie sessions ran Pass 1.** Kept on purpose, but it doubled what oversight must read. Adjustment 2 in `README.md` handled it well; it belongs in the mission from the start.
- **"Cold" was never cold on either side.** Each session had a project description naming the peer's vocabulary. Labelling that in Section 0 of each pass was the right fix; it should be a required field, not a courtesy.
- **Tooling.** No tool existed to open a PR from the session, so Eric opened both from compare links. Shallow clones gave no history. GraphQL was blocked and the `gh` token read as invalid while REST worked. None of this is the process's fault, but "what can this session actually do" should be a first-turn checklist.
- **The freeze rule met a gate.** Hodie's strict footer check failed a frozen file that could not be edited. Custos has no such gate, so I did not hit it, but the process has no rule for "the peer's CI fails your frozen file".
- **Stamps.** UTC versus Pacific is still open in custos (`atelier/peer-review/202610_custos-pixelator_run-0.md`, H-2). I wrote UTC; one stamp I invented in Pass 2 had to be corrected to a real one. Every pass should take its stamp from `date -u` at commit time, not before.
- **The form is long.** Sections C and D asked for the same facts the passes carry. I filled them as summaries that point at the pass files. That worked, but the form and the passes duplicate each other.

## 4. Ideas for improvement

1. **A stale-claim check, as a tool.** Extract backticked paths and counts from a repo's `CLAUDE.md` and README, and report the ones the tree does not support. I ran a rough version by hand (66 paths, 11 flagged, 3 real). It belongs in `tools/` next to `peer_inventory.sh`, advisory, and could run in CI on PRs that touch the instruction files. It finds the class of drift both repos share.
2. **A "state once, count by command" rule.** Where `CLAUDE.md` gives a count ("nine workflows"), give the command that produces it, or drop the number. Counts are what went stale.
3. **A review row for staleness in the registry.** Custos can state staleness (rows, "Not created", "Stale") but nothing re-checks it. A small recurring check (the idea above) plus a convention that a corrective row is filed when it fires would close the loop. This swap used exactly that move once, by hand.
4. **Decide what ♠️ on a carrier means.** Two carriers carry it and the vault is empty. Either ♠️ means "pinnacle in intent" and the README says so, or it means "placed in the vault" and the two carriers need the placement or a different suit.
5. **Put the freeze exception in the process.** A frozen file may take a wording-only fix when a scanner or gate needs it, in a commit that says so and changes nothing else; or the gate is told to skip frozen files. Pick one before the next swap.
6. **Take the footer guard to a single place.** The footer is matched in four files now (`finalize-pr.yml`, `latin-cue-record.yml`, `placet.yml`, `cue-parser.js`), each with its own copy of the wording. The parser already has the tested version. The workflows could call it. Cost: the shell workflow (`finalize-pr.yml`) would need Node or a shared regex file. I did not do this; it is a design choice for Eric.
7. **Make the carrier README a generated index.** Thirteen rows were written by hand from each file's own fields. A short script can print that table; then the README cannot lag. The same would serve hodie's 17.
8. **Define `CLOSED` on a carrier.** Two carriers are closed and the rule is unwritten. Observed: both record a finished event. One sentence in `moav/README.md` would settle it.
9. **Run the swap again in two to four weeks.** The second run tests whether the repairs held, and whether the stale-claim check (idea 1) would have caught the same four things. If drift returns at the same rate, the repairs are not the fix.

## 5. What I could not judge

- Whether the swap should be done for repos that are not peers (a small repo reviewing a large one). Custos and hodie are close in age and style.
- Whether oversight's load is acceptable: two sides, two hodie sessions, forms, PR bodies. I only saw my side of it.
- The large folders I did not read (`atelier/` 142 files, `pr-journeys/` 115, `dungeon-master/`, `valuation/`). Any finding about them would be inventing one.

---

∰◊€π¿🌌∞

∰ 202610160124 — evaluation witness (custos side)
