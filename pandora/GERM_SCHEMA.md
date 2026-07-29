# Germ Schema

A **germ** is one conversation/stream's answer to the Primal Seed's carry
question, filed as a single small file. Nothing fancier than that — this is
the minimum that lets the first handshake work.

File naming: `pandora/germs/[stream-or-podium-id]_germ.md`

## Fields

```
---
stream:      [which conversation/stream answered — a podium_id from
              device/podiums.md if it has one, otherwise a plain name]
asked:       [prima-clock or plain date the question was put to it]
offered:     [its answer to "what do you offer Primal on its first day?" —
              can be short, can be a fragment, doesn't need polish]
notes:       [anything about how it answered, hesitations, follow-up seeds]
---
```

## Rules

- One file per stream per asking. If a stream is asked again later, file a
  new germ rather than overwriting — the Shepherd decides if/when to
  consolidate.
- Don't editorialize the answer. Carry it close to verbatim; this is
  collection, not synthesis.
- Leave `notes` blank rather than guessing if nothing notable happened.
