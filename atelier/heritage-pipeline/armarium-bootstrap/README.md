# Armarium  א · Ա · A

`prima-clock: 202610171925`
`status: bootstrap draft, kept in custos until the repo is born. Not yet a repository.`

A private vault for **origins**: conversations and documents exactly as they arrived, kept
byte for byte. Nothing here is edited. The first letter of three alphabets (Hebrew alef, Armenian
ayb, Latin A) marks step A of the Atrium pipeline: the origin.

*Armarium* is the Latin word for the chest or cupboard where a monastery kept its books. The
*armarius* was the keeper of that chest.

## Rules

1. **Private.** Origins can hold private material. Review before the first commit.
2. **Exact bytes.** An origin is stored as received. `.gitattributes` turns off line-ending
   conversion so git never changes it.
3. **Additive only.** Origins are never edited or deleted. A correction is a dated file in
   `amendments/` that points at the origin.
4. **The hash sits beside the file, never inside it.** `origin.sha256` holds the SHA-256 of the
   origin's exact bytes. Anyone can check it with `sha256sum -c`.
5. **One origin per commit.**
6. **Large containers** (more than about 50 MB) live in cold storage; here a pointer file
   records the container's name, size and hash.

## Layout

```
armarium/
  README.md
  .gitattributes                 * -text
  tools/verify.sh                checks every origin against its hash
  origins/<YYYYMMDDHHMM>-<slug>/
    origin.<ext>                 the exact bytes as received
    origin.sha256                `sha256sum origin.<ext> > origin.sha256`
    receipt.json                 who, when, from where (see below)
    amendments/                  dated notes that point at the origin
  packages/<slug>/package.json   the heritage package for that origin; appended to, never rewritten
```

## Adding an origin

1. Privacy review: names, private details, third-party material, outside image links, anything
   that should not live in a repo. Record the result in `receipt.json`.
2. Make the folder `origins/<YYYYMMDDHHMM>-<slug>/` (the stamp is `date '+%Y%m%d%H%M'`).
3. Put the file in as `origin.<ext>`, unchanged.
4. `cd origins/<id> && sha256sum origin.<ext> > origin.sha256`
5. Write `receipt.json`.
6. `bash tools/verify.sh` must pass.
7. Commit. Then record the placement in the custos registry (`prima-clock/registry.md`).

## `receipt.json` fields

`id` · `received_utc` · `source_time_reference` (as supplied, not verified) · `source_description` ·
`container` (name, kind, size, SHA-256) · `privacy_review` (status, reviewer, date) · `custody_row`
(the custos registry reference).

## Checking everything

```
bash tools/verify.sh
```

Exit code 0 means every origin matches its hash. Any other exit code lists what failed.
