# Owner-only Latin PR cues — protocol draft

Eric proposes using Latin words in **PR conversation comments** as manual triggers. Only comments authored by GitHub login `Eaprime1` qualify; other contributors may discuss or quote the terms without triggering work. This is a proposed human-readable protocol, not an installed automation. Verify behavior against existing PR conventions and the separate `guides/pr-lifecycle-cue-vocabulary` work before adding code.

For each PR, target **one Recensio, one Probatio, and one Lustratio owner cue**. `Novissimum` and `Judicium` may be used to request cleanup or a decision but should not multiply the three phase runs. No cue merges a PR. Eric requests merge later, explicitly in conversation or to the responsible merger (for example by addressing Claude in a PR comment). There is no assumption that @mentioning Perplexity in GitHub starts this conversation.

| Exact lexeme in an owner PR comment | Bounded response |
|---|---|
| Recensio | Inspect the named PR's diff, available checks, scope and risk; leave a findings receipt. |
| Probatio | Verify the acceptance evidence and outstanding review conditions; report pass, fail, or unknown. |
| Lustratio | Make a presentation/coherence pass and identify remaining polish; do not silently change scope. |
| Novissimum | Record cleanup and follow-up items; do not re-run the three phases. |
| Judicium | Surface options and evidence for Eric's decision; do not decide on his behalf. |

## Safe future detector, not implemented here

- Subscribe only to newly created PR **conversation comments**, not every commit, label change, edited comment, or PR synchronization. Verify author login exactly `Eaprime1` and that the issue is a PR.
- Match whole words case-insensitively in the comment body, avoiding substrings. A bare matching word would qualify; because quotations and prose may contain examples, require an explicit opt-in marker or a clear owner instruction in the first automated version, after real comment examples have been reviewed. Until then a person interprets intent.
- Deduplicate by PR number + cue + owner comment ID and keep a per-PR phase ledger so repeated text, webhook retries or three words in one comment do not fan out into repeated paid jobs. If multiple phase words appear in one message, ask Eric to disambiguate rather than launch several phases.
- Record phase outcomes and outstanding questions without posting repeated bot comments. Never auto-trigger paid AI, merge, or run an unrelated workflow; require a reviewed budget/opt-in before an API reviewer.

The exact event format, retention place and behavior around edits must be tested against repository workflows before any automation PR.
