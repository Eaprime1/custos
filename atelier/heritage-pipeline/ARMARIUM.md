# Armarium — the origin vault (name, layout, hash rule)

`suit: ♦️ Diamond — seed, structure forming`
`prima-clock: 202610171925 (updated 202610172020)`
`status: the repo exists (private, `Eaprime1/armarium`); the kit was pushed as `80c073d`. Branch protection could not be enforced (see section 4). Section 6 (Genizah) is a proposal.`

*The Shepherd's call on 202610171006: origins go in a new private vault-type repo with a fitting
name (Latin, or older: Hebrew, Armenian, as a letter beside a Latin lexeme). The name was left
to the navigo.*

---

## 1. The name: **Armarium**, with the mark **א · Ա · A**

- **Armarium** (Latin): the chest or cupboard where a monastery kept its books. The *armarius*
  was its keeper, a close cousin of a custos. It holds originals and lends copies, which is what
  the vault is for.
- **The mark:** the first letter of three alphabets: Hebrew alef (א), Armenian ayb (Ա), Latin A.
  Step A of the pipeline is the origin, the first thing. The letters work as a mark, like the
  runes in the Makers Mark; they are not a translation of "origin". Ask a native reader of each
  script before the mark appears anywhere public.
- **Slug:** `armarium`. No repo by that name exists in the account (checked 202610171930).

### Other names considered

| Name | Meaning | Mark | Why not first |
|---|---|---|---|
| **Autographum** (Latin, from Greek) | An author's own handwritten original | א · Ա · A | Not the repo's name (long, and narrower than a conversation export). Taken up instead as a special section of the Armarium for handwritten and similar origins: see section 7. |
| **Exemplar** (Latin) | In manuscript study, the copy that other copies are made from | E | Close to the vault's idea, but the word is common in English and loses the Latin feel. |
| **Genizah** (Hebrew גניזה) | A storeroom for worn or retired texts that are kept, not destroyed | ג · Գ · G (the third letter in all three) | Taken up as a part of the Armarium instead, not a second repo: see section 6. |
| **Matenadaran** (Armenian Մատենադարան) | "Manuscript repository"; the name of the famous manuscript library in Yerevan | Մ | Strong, but it is a specific institution's name. |

## 2. Layout and rules

The full layout, the rules and the steps for adding an origin are in
`armarium-bootstrap/README.md`. In short: private; the exact bytes as received; additive only;
the hash sits beside the file, never inside it; one origin per commit; large containers go to
cold storage with a pointer file.

Three protections to turn on when the repo is born:

1. `.gitattributes` with `* -text`, so line endings are never converted (in the kit).
2. Branch protection on `main`: no force-push, no deletion.
3. A check on every push that only **added** files appear under `origins/` (a changed or deleted
   origin fails). Not built yet; it needs a tested workflow, so it is listed under "next".

**Found 202610172020:** GitHub does not enforce branch protection on a private repo outside a Team or
Enterprise account, so protection 2 cannot be turned on for this repo today. Nothing blocks a
force-push or a deletion on `main`. What remains is detection (the check in 3, run after each push)
and `tools/verify.sh`, which compares every origin to its hash file. Moving to a Team account or
making the repo public (not wanted: it holds private material) would change that.

## 3. The hash question: a recommendation

The Shepherd was unsure which way is best. The failure in the engine test came from one thing:
the passport sits *inside* the file it covers, so every tool needs a stripping rule to say what
text is hashed, and two tools chose different rules. The simplest cure is to remove the rule.

**Recommended:**

1. **Origins:** the SHA-256 of the file's exact bytes. No cleaning, no normalization. The
   authoritative check is `sha256sum -c`, which any machine (a phone in Termux included) has.
2. **The hash lives beside the file** (`origin.sha256`, or a manifest), never inside it. A file
   cannot contain its own hash without a stripping rule.
3. **A document that must carry an embedded Makers Mark passport** (the older format) hashes
   everything *before* one exact marker line. One rule, kept in one module that both engines
   import, with a test that the engine's hash equals `sha256sum` on the same bytes.
4. **Edits make new hashes.** For an origin that is the point: a change is an amendment, not an
   edit. For derived documents, the new hash is recorded with a dated note.

**Tested 202610171925** (`tools/verify.sh` on sample origins): an untouched origin passes; one
edited line fails; a silent CRLF-to-LF change fails; a missing hash file fails.
**Trade-off:** byte-exact hashes break on any whitespace change. For origins that is wanted.

## 4. Creating it (done; steps kept for the record)

1. Create a **private** repo named `armarium` (empty: no README, no licence, no template), or tell
   me the name you want instead.
2. Attach it to a session with push access.
3. First commit: the three kit files (`README.md`, `.gitattributes`, `tools/verify.sh`).
4. Turn on the branch protection above.
5. Place the first origin (the Sanctum export, after the privacy review). Add the registry row
   in `prima-clock/registry.md` and, per the custos conventions, a MOAV carrier for the birth.

Working with it afterwards: a clone, the GitHub web editor or a Codespace all work for a private
repo. The private repo also means the Armarium is not part of custos's public history.

## 5. Next

- The workflow that fails a push which changes or deletes anything under `origins/`.
- The receipt format as a JSON schema, with a validator.
- The Genizah rules in section 6: the Shepherd's yes, then a folder and one example note.

## 6. Genizah: where retired scrolls stay readable (proposal)

The Shepherd's words, 202610172016: *a place where the old scrolls can be interacted with, within the
Armarium.* A genizah (Hebrew, a hiding or storing place) keeps texts that are worn or retired, and
does not destroy them.

**The tension to solve:** origins are additive only. An origin is never moved, edited or deleted,
so retiring one cannot mean taking it out of `origins/`.

**Proposal:** a top-level `genizah/` folder holds *notes about* retired scrolls, and the scroll itself
stays where it is.

- A scroll is **retired** when a later origin or a cleaned version replaces it as the working source.
  Example: the 86-page Sanctum export, a rough draft, once a cleaned version exists.
- Retiring is one new file, `genizah/<origin-slug>.retired.md`, with the origin's path and SHA-256, the
  date, who retired it, the reason, and a pointer to what replaced it. The origin and its hash file
  are not touched, so `tools/verify.sh` still passes.
- **To interact** means: read it, annotate it, compare it with its successor. Annotations are new dated
  files in `genizah/<origin-slug>/`, one per note. Nothing is overwritten. A reader works on a copy
  (a carbonite), never on the origin.
- A retired scroll can be **restored** by a new dated note saying so. The old notes stay.
- Step C of the pipeline (the shadow legacy carbonite) is where such copies go outside the repo; the
  Genizah is the repo's own record of what was retired and why.

**Not decided:** whether a retired origin's carbonite also goes to the Lacus Hope shadow pool, and
whether `verify.sh` should also check that every `*.retired.md` points at an origin that exists. The
Shepherd's call; neither is built.

## 7. Autographum: a section for handwritten origins (noted, not started)

The Shepherd's words, 202610172056 (review comment on this file): *Autographum, a special section of the
Armarium for actual handwritten and other similar origin documents. We do have scanned copies of a few of my
handwritten content; this can be a mission seed. I don't want to tackle it yet, but I do need to make sure we
have at least a few for the launch of Primal.*

What is recorded, and no more:

- **Intent:** a part of the Armarium for handwritten (and similar non-typed) origins. Scans of a few of the
  Shepherd's handwritten pages already exist. Where they are, how many, and what they hold are not known to
  this file.
- **A launch need:** at least a few such origins should be in place for the launch of Primal. This is the
  Shepherd's requirement; no date is attached.
- **Status:** not started, by the Shepherd's choice. No folder, rule or hash format is proposed here.
- **Open for when it starts:** a scan is a file like any origin (exact bytes, hash beside it), but a scan also
  has a physical original and a scan quality. Whether the Armarium's layout needs a field for those, and
  whether any scan is private enough to need review before the first commit, are the Shepherd's to decide.
- **As a mission seed:** it can be filed as an issue when the Shepherd says. It is not filed yet.

---

*The repository exists. Sections 6 and 7 are proposals.*
