# Autographum: nursery seed

`suit: ♦️ Diamond — seed, Germ`
`prima-clock: 202610172354`
`status: seed filed at the Shepherd's word (chat, shortly after 202610172338 UTC). Not started, by the Shepherd's choice.`

Source: the Shepherd's review comment on custos PR #463 (posted 202610172056 UTC), recorded in
`atelier/heritage-pipeline/ARMARIUM.md` section 7, and the Shepherd's word shortly after 202610172338 UTC to file it
as an atelier seed. Nothing here is finished, that is the point.

## The what

In the Shepherd's words: *Autographum, a special section of the Armarium for actual handwritten and other
similar origin documents. We do have scanned copies of a few of my handwritten content; this can be a
mission seed. I don't want to tackle it yet, but I do need to make sure we have at least a few for the
launch of Primal.*

The name: *autographum* is Latin for a thing written in the writer's own hand (from Greek *autographon*).
That is the Armarium's own test for an origin, in the plainest case: the thing as it was made.

## What is known

- **The intent:** a part of the Armarium for handwritten and similar non-typed origins.
- **What exists:** scans of a few of the Shepherd's handwritten pages. Where they are, how many, and what
  they hold are not known to this seed.
- **The launch need:** at least a few such origins in place for the launch of Primal. The Shepherd's
  requirement. No date is attached.
- **The hash rule applies unchanged:** a scan is a file. Exact bytes, the hash beside it, `sha256sum -c`
  (ratified, see `moav/armarium_moav_hashrule001.json`).

## What is not decided

- Whether the Armarium layout needs fields for the physical original (where it is kept) and the scan
  (device, resolution, date scanned). A scan is a copy of a thing; the origin the Armarium keeps is the
  scan file, so the physical original's whereabouts may belong in `receipt.json`.
- Whether any scan is private enough to need the Shepherd's review before its first commit. That review
  comes first, as for any origin.
- Whether text from the scans is ever transcribed. A transcription is a derived document, not an origin,
  and would sit beside the scan, never replace it.

## Routing

Not routed. When the Shepherd says "start", the first step is to find the scans and list them (path, count,
size), with no copying. The hand-off for whoever picks this up is in
`atelier/heritage-pipeline/HANDOFFS.md`.
