# File Review Checklist

**Prima-clock:** 202610160949
**Suit:** ♦️ Diamond, 2/3 plank. Phase A of three (B and C follow).

The Shepherd Considers comment on each PR is a checklist of the PR's files. It shows the Shepherd
which files are worth reading and records which ones were read.

## The two lists

| List | Starts as | Who ticks it |
|---|---|---|
| **Read these** | Unticked | The Shepherd, by clicking the box in the comment |
| **Not for reading** | Ticked, with a reason | The rules in `.github/review-skip.json` |

The rules skip things like journey documents, append-only logs, lockfiles and binary images.
Files under `vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/`, `device/` and
`.github/workflows/` are on the watched list. A watched file is always in the list to read.

## A tick belongs to one version of a file

Each line stores the file's version. After a push the comment is rebuilt. A file that is the same
keeps its tick. A file that changed since the tick gets an unticked box and the note
"changed since you ticked it".

## Reading and adding

- **Reading.** Open the file from its link. GitHub's own *Viewed* box in Files changed tracks the
  reading for you. The box in the comment is the record a workflow can see.
- **A small addition.** Use a suggested change on a line of the diff. One click applies it.
- **A comment.** Use a line comment on the diff. Use `^name emenda` with your text for a larger addition.
- **Editing the file yourself** works too. It moves the head, so the PR needs a new seal.

## Where the rules run

The rules run from the base branch, not from the PR. A PR cannot change the rules that list its
own files. A PR that changes `file-review.js` or `review-skip.json` shows up in the list like any other file.
Until the rules reach the base branch, the comment is a plain list.

## What comes next

- **B:** the final oversight report gets a File review row that must pass, and the seal asks for a complete observation.
- **C:** the same gate for hodie.

Offline tests: `tools/test_file_review.js` (30 rows, run by `seal-path-tests.yml`).
