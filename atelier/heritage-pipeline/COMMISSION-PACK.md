# Commission pack: sending documents from a custos concept to its new repo

`suit: ♦️ Diamond — seed, structure forming`
`prima-clock: 202610172355`
`status: mechanism built and tested (tools/commission_pack.sh, tools/test_commission_pack.sh). One pack built for the Armarium; not yet sent. Sending is the Shepherd's word.`

*The Shepherd, in the conversation after 202610172338 UTC (the message's own time was not recorded):
"since this concept will be moving to its own repo (we have several repos to get to shadow ready) ...
we could create a commission pack and send it to the armarium. It is in our custos atelier. We could
send the documents leaving a shadow copy in the custos atelier. This would be different from
carbonites and aethereal copies."*

---

## The problem

A concept grows in the custos atelier. When it is ready it moves to its own repo. The documents have to
cross, and three things must stay true: the receiving repo can check that what arrived is exactly what was
sent; custos keeps a record of what it sent; and nothing is quietly lost or quietly changed on either side.

The Armarium is the first case (`atelier/heritage-pipeline/`). Other repos "to get to shadow ready" will be
the next.

## A fourth kind of copy

| Kind | What it is | Authority |
|---|---|---|
| **Carbonite** | A working copy, any version, one master carbon behind it. Made to be worked on. | None of its own; defers to the master. |
| **Aethereal** | A living copy: interactive, bound to its home (see `valuation/five_lakes_valuation_bridge_202606112205.md`). Made to be used. | Lives where it lives. |
| **Commission pack** | The *carriage*: a sealed bundle of exact copies, with the hash of each, sent from one repo to another. Made to be moved and checked. | None. It is not an origin and not a master. It proves what left and what arrived. |
| **Shadow** | What the sender keeps: the originals stay in place, and a record (the pack's manifest and hash list, not a second copy of the files) freezes what they looked like at the moment they were sent. | None. It is the sender's receipt. |

So the pack is not a carbonite (it is not for editing) and not an aethereal (it is not alive). The
shadow is not a copy someone works from; it is a record, with a check that tells you when the originals have
moved on since sending.

(*Shadow* already means other things in custos: `.shadow-well/` is the `nowhere` counterpart of the artesian,
and `atelier/hodie-shadow/` is hodie's shadow. This is a third use, close to the first: the unlit side of
something that has a formal life elsewhere. If the overlap bothers the Shepherd, "sent-record" is a plain
alternative.)

## How it works

```
bash tools/commission_pack.sh build <slug> <to-repo> <out-dir> <path>...
bash tools/commission_pack.sh check <pack-id>
```

**Build** copies each file byte for byte (directories are walked, in sorted order) into
`<out-dir>/<YYYYMMDDHHMM>-<slug>/`:

```
<id>/
  manifest.json     what the pack is, where from, where to, each file's bytes and SHA-256, chain_of_custody
  files.sha256      sha256sum -c format; paths relative to the pack folder (files/...)
  files/<path>      the documents, at the same paths they had in custos
```

It checks the pack against its own hashes before finishing, then keeps the **shadow record**
(`manifest.json` and `files.sha256`, no files) in `atelier/commissions/packs/<id>/` in custos. Nothing is moved
or deleted. A pack is never overwritten.

**Send** is a separate step, on the Shepherd's word: copy the pack folder into the receiving repo (for the
Armarium, under `commissions/<id>/`) and commit it. On arrival, `sha256sum -c files.sha256` from inside
the pack (or `bash tools/verify.sh` in the Armarium, which now checks packs too) says whether it arrived
intact. The hash rule is the ratified Armarium rule: exact bytes, hash beside the file.

**Check** (in custos) compares the originals still in the atelier with the hashes recorded at build. A
mismatch is *drift*: the shadow has moved on since sending. That is not an error, it is a signal: either
the change should travel (build a new pack, dated, never overwriting the old) or it should not.

## What a pack is not

- Not an origin. An origin in the Armarium is a conversation or document kept as it arrived. A pack
  carries concept documents; whether any of them also becomes an origin is a separate decision.
- Not a replacement for the MOAV carrier. The pack is the files; the carrier is the formal event. When a
  concept is entered into its new repo (the destination reached), the usual carrier and registry row
  record it.

## What it does not do, on purpose

- It does not send. There is no push in the tool.
- It does not decide what goes in a pack. The Shepherd or the navigo lists the paths.
- It does not touch private material: the privacy review that applies to anything entering the Armarium
  applies to a pack's contents first.
- It does not rewrite or "clean" any file; CRLF, missing final newlines and odd characters survive.

## The first pack

The Armarium's own concept documents and its Autographum seed: `ARMARIUM.md`, `SEED-PICKER.md`,
`DRAFT-202610131200.md`, the `armarium-bootstrap/` kit, and `atelier/autographum-seed.md`. The pack id and
its hashes are in the shadow record under `atelier/commissions/packs/`.

The Exemplar and Matenadaran seeds are not in it: they are lore, not the Armarium's. They stay in the atelier.

## Open

- Where the shadow record should live long-term. `atelier/commissions/packs/` sits next to
  `atelier/commissions/`, which holds contributor tasks (a different meaning of *commission*). Naming the
  folder differently is cheap now and awkward later.
- Whether a returned receipt (the receiving repo writing back that the pack arrived and verified) should
  set the manifest's `chain_of_custody` to `CLOSED`. The manifest has a `receipt` field for it; nothing
  fills it yet.
- Whether a pack should ever travel by a path other than a copy and a commit (for example into Box as a cold mirror).
  Not decided; the format does not depend on it.
