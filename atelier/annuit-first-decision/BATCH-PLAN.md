# Batch plan — pre-oversight lane

**Prima-clock:** 202611010342 UTC · **Plank:** germ · **Author:** navigo_claude with Eric
Written while Eric was away. Everything marked *waiting* needs his word first.

## Status read so far (read-only, from the PR list and check runs at 202611010342 UTC)

| PR | Head | Merge state | Checks | Open threads | Observation | Read |
|---|---|---|---|---|---|---|
| #468 KAN-4 Codacy | c7a5ad6 | clean | 11 passed, 3 skipped | 0 | on branch | ready for oversight; needs Eric's word |
| #469 KAN-6 Jira pipeline | 0233443 | clean | 10 passed, 3 skipped | 0 unresolved (8 resolved) | on branch | ready for oversight; needs Eric's word |
| #476 KAN-5 batch 1 | 12ed811 | clean | 10 passed, 3 skipped | 0 | on branch | **held by Eric** (NEXUS-2) |

The skipped checks are not checked individually here; NEXUS-2 says the same for #476 and calls them
genuinely skipped. Not re-verified: the diffs themselves, Codacy and DeepSource pages, whether each
observation file says `status: complete`.

## Batches

1. **This PR** (clear, in progress): ANNUIT and RATIHABITIO in the lexeme set, the check-in order, the quest log,
   the papers above. Docs only. No parser or workflow change.
2. **Status pass on the next group** (clear, read-only): #470, #467, #442, #441, #433, #502. Same table as above.
3. **Collapse-path drafts** (clear to read, not to touch): #494, #495, #503, #504, #489. Read the plan files,
   report what each still needs. #495's merge triggers a Pages deploy, so it stays held.
4. **Subscription** (*waiting*): which PRs this conversation subscribes to. Proposed start: #468, #469, #476.
5. **Latin word for subscribe** (*waiting*, JUDICIUM): see the lexeme section.
6. **Armarium pack** (*waiting*): still unsent.
7. **Info request** (*waiting*): Eric hands the JSON to conversations; replies land on NEXUS-6.

## Not in the batch

Sealing, merging, setting `ready-for-oversight`, parser or workflow edits, publishing, any Jira ANNUIT.
