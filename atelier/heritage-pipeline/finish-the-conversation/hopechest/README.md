# Hopechest conversations write here

`suit: ♦️ Diamond — seed, structure forming`
`prima-clock: 202610201604`
`status: proposal. The layout below is Navigo Claude's reading of the Shepherd's request (conversations from hopechest write to one branch, so the content can be seen together). Nothing here is decided.`
`branch: hopechest/consummatio-colloquii`

This folder is where the hopechest conversations file what the Finish the Conversation
procedure (`../SOP.md`) produces, so the whole of the hopechest can be seen in one place.

## Layout

One folder per conversation, named by its Prima-Clock stamp and a short slug:

```
hopechest/<YYYYMMDDHHMM>-<slug>/
  <ConvoID>_ActiveReference.md     from ../templates/ActiveReference.template.md
  pr-journey.md                    from ../templates/pr-journey.template.md
  seeds/<seed_name>.json           from ../templates/seed.example.json
```

## What may be filed here, and what may not

**This repository is public.** So only the distilled package goes here: seeds, the Active
Reference and the PR Journey.

- **Not here:** the raw conversation export (the origin), and any thread that triggered the Right of No (SOP.md §V). The origin belongs in the private Armarium (`../ARMARIUM.md`). A thread that triggered the Right of No is not filed at all until the Shepherd decides where it goes.
- **Not here:** names, contact details or private material of people other than the Shepherd, unless they have agreed.
- Each folder's PR Journey names where its origin is held, by Armarium path and SHA-256, never by a link that works for the public.

## Writing to this branch from several conversations

- Write only inside your own conversation's folder. Never edit another conversation's folder.
- Append-only: a correction is a new dated file that points at the one it corrects.
- Before every push: `git fetch origin hopechest/consummatio-colloquii` and rebase, so two conversations do not overwrite each other.
- Before every commit: `bash tools/scan_lexeme.sh atelier/heritage-pipeline/finish-the-conversation`.
