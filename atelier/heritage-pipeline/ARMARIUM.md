# Armarium — the origin vault (name, layout, hash rule)

`suit: ♦️ Diamond — seed, structure forming`
`prima-clock: 202610171925`
`status: proposal for the Shepherd. The repo is not created. A bootstrap kit is ready in armarium-bootstrap/.`

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
| **Autographum** (Latin, from Greek) | An author's own handwritten original | א · Ա · A | Exact for "origin as is", but long, and a person's autograph is narrower than a conversation export. |
| **Exemplar** (Latin) | In manuscript study, the copy that other copies are made from | E | Close to the vault's idea, but the word is common in English and loses the Latin feel. |
| **Genizah** (Hebrew גניזה) | A storeroom for worn or retired texts that are kept, not destroyed | ג · Գ · G (the third letter in all three) | A better fit for step C, the shadow legacy store, where retired copies rest. Keep the name for that. |
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

## 4. Creating it (needs the Shepherd's word)

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
- Genizah as the step-C store, once the Shepherd says so.

---

*Proposal only. The repository has not been created.*
