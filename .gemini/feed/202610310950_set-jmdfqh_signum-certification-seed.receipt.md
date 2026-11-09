# Feeder receipt: first test run

`prima-clock: 202610310949` (UTC)
`plank germ` · a test record, not canon · filed by Navigo Claude (`nx-claude-main`), conversation `set-jmdfqh`

The file beside this one, `202610310950_set-jmdfqh_signum-certification-seed.md`, is the document that was carried. It is kept exactly as it came out of Drive. The sign-in card and the hash live here so the carried file stays untouched.

## Sign-in card

```
cid:      set-jmdfqh
title:    all things Jira
key:      nx-claude-main
platform: claude.ai/code
ref:      ""
minted:   202610310800
```

## What was carried

| Field | Value |
|---|---|
| Kind of drop | **Test.** Made by Navigo Claude to try the courier path. Not a notebook export, not made by the Shepherd. |
| Dropped to | Drive, `🚥shadow_stream` / `feeder` (made 202610310947 UTC) |
| Courier | Navigo Claude, through the Drive connector |
| Arrived at | `.gemini/feed/` in this repo |
| Content | The seed for a UL-style certification system (working name Signum) |

## Integrity Mark (first one)

| Check | Result |
|---|---|
| SHA-256 of the body before the drop | `89381b9f78590a39934c3ef6889f61e91f275ce5de8867bee75f8399c89476f9` |
| SHA-256 of the file downloaded back from Drive | the same |
| SHA-256 of the arrival file in this repo | the same |
| Size | 3639 bytes at every step |
| Witness | a script (`sha256sum`), run by Navigo Claude |

To check it yourself: `sha256sum .gemini/feed/202610310950_set-jmdfqh_signum-certification-seed.md`.

This says the bytes did not change on the way. It says nothing about whether the content is good, and it is not an ethical review.

## What the test showed

1. **It works end to end** for a plain Markdown file: Drive in, Drive out, repo, same hash.
2. **A Google Doc export will not keep the hash.** A notebook export saved as a Google Doc is converted by Drive, so its bytes are not stable. For those, the Integrity Mark can only start at the moment of arrival in the repo. A plain `.md` or `.txt` drop keeps its bytes.
3. **Small nit:** the stamp inside the carried body (`202610310950`) was written about a minute ahead of the real clock at the drop (Drive recorded 09:48:27 UTC). The body was left as it is, because changing it would change the hash.

## Not tested

- A real drop made by the Shepherd, or a real notebook export.
- Any automatic courier. This run was by hand.
- A drop that is a Google Doc.
- Who files the PR when no Claude session with the Drive connector is available.

## Carried forward

- Decided by the Shepherd, in the conversation, 202610311100 UTC or just after: notebook exports are saved as **`.md`**. The hash then stays stable from the drop.
- Owner: Navigo Claude. After PR 502 merges, add a tracker row and an atelier row pointing at the carried seed, which stays here until the Shepherd routes it.

## The Shepherd's review comments on the carried file

His comments on #503 landed on lines 40 to 43 of the carried file. That file stays untouched so its hash stays true, so each comment is answered where it belongs:

| Line | He said (short) | Where it went |
|---|---|---|
| 40 | Signum is excellent, make it official; add it to the Latin workflow lexeme and elsewhere | `docs/signum.md`, `docs/latin-workflow-glossary.md` (section "Marks (Signum)"), `docs/latin-lexemes.txt`, `CLAUDE.md` |
| 41 | We need a full validation system built | Jira NEXUS-14; thread T14 in `.claude/threads.md`. Not built |
| 42 | Quantum is an early, heavily used lexeme tied to the quantum runic compression language; may trace to the 1st iteration; add a thread | Thread T13 in `.claude/threads.md` |
| 43 | Anyone can add a witness; reading is witnessing, skimming is a reference; his witness is required as the only human navigo | `docs/signum.md`, section "Witnessing". This replaces the open question "who may act as witness" in the carried file |

The carried file's "Not known" list is therefore partly answered: the witness question is answered, the working name is Signum, and the Runic ID question is now thread T13.
