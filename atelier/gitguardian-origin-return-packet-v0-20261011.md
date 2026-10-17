# GitGuardian Guardrails — Origin Return Packet (Consolidation v0)

`suit: ♦️ Diamond — working synthesis, not ratified`
`prima-clock: 202610111156`
`status: OPEN-origin-review`
`conversation-source: Repository Structure gitguardian .pdf (25 pp., eight substantive tabs + blank ninth tab)`
`custos-rehearsal: https://github.com/Eaprime1/custos/pull/442`

## A Note to the Originating Conversation

Your work has reached a Custos rehearsal. The shared PDF is a chronological collection of your individual responses, not a single final specification. Thank you for developing the architecture. The receiving Navigo has **not installed, merged, or approved** the proposed security configuration.

You are invited to compare this consolidated working draft and its companion `gitguardian-origin-review-comments-20261011.md` against your original dialogue. Revise, disagree, restore nuance, or identify missing sections. Please return your response as a **new version** rather than rewriting the original source. Explicitly distinguish what was changed, what was intentionally kept, and what remains unknown. Your voice and attribution should remain your own, without assumption.

## Scope of the Proposal

**Goal as derived from the responses:** add defense-in-depth against accidentally disclosing secrets through developer workflows and AI coding assistants in `Eaprime1/custos`, while keeping review work visible on GitHub.

The source repeatedly describes **three complementary layers**:

1. **Workstation / pre-commit (preventive):** `ggshield` CLI and, where supported, native hooks or `pre-commit` integration. A local hook operates only where installed and configured; the repository alone cannot guarantee that all contributors have it.
2. **Agent / editor assistance (contextual):** GitGuardian Developer MCP and AI-related hooks intended to help agents notice credential hazards during tool use. Compatibility and coverage must be tested for each supported agent and host; directives do not create capabilities by themselves.
3. **Repository / pull-request (shared CI):** GitGuardian GitHub App or a GitHub Actions scan. These differ in setup and control. Define what is actually enabled before claiming checks or merge gates.

**Fourth boundary from Custos:** neither scan success nor agent instruction is a human or project governance approval. The existing draft PR, Shepherd review, witnessing and observed processes remain distinct.

## Proposed Artifacts, Consolidated

| Source file proposal | Purpose | Current handling / open issue |
| --- | --- | --- |
| `.github/workflows/gitguardian.yml` | Scan pushes and PRs for possible credential leakage | Only if Actions path is selected; verify event coverage, action version, GitHub permissions, secrets, and existing GitGuardian App integration |
| `.github/AGENTS.md` | State agent behavior when secrets appear | Consider whether instruction discovery requires root `AGENTS.md` or other agent-specific files; never state that an MCP or hook is enabled without checking |
| `.github/pull_request_template.md` | Record secret and agent guardrail checks | **Do not replace:** Custos already uses `.github/PULL_REQUEST_TEMPLATE.md` with Intent, What Arrived, Resonance, Ethics, Sense, and Witness/Observed fields |
| `.gitguardian.yaml` | Configure ignored paths/detectors | Avoid broad default exclusions of all tests, mocks, or fixtures; exception policy needs narrow rationale |
| `.pre-commit-config.yaml` | Configure developer-side ggshield hook | Tab 1 contains an incomplete `repo: https://github.com`; Tab 6 names `https://github.com/gitguardian/ggshield`. Verify valid current revision, hook ID, stage and local prerequisites |

### Consolidated responsibilities (not executable configuration)

**CI stage:** checkout the intended revision; scan with a supported GitGuardian integration; publish an actual result to PR checks; explicitly handle authentication and event permissions.

**Developer stage:** authenticate safely; enable hook only on the applicable machine/repository; run a non-secret test; document failure/recovery, including how to report a finding without publishing the credential.

**Agent stage:** provide context-aware guidance to scan before potentially risky writes where tooling exists; stop and ask for help on suspected credential exposure; no `--no-verify` shortcut; do not copy credentials into prompts or public PR discussions.

**Policy stage:** reason about false positives individually, record decisions, and ensure the chosen exception mechanism cannot silently shield sensitive files.

**PR stage:** make any added security checklist **additive** to the current `.github/PULL_REQUEST_TEMPLATE.md`, not a competing replacement.

## Installation Approaches Kept Separate

**Path A — GitGuardian GitHub App.** Source Tab 7 proposes an App integration with repository-specific permissions. Confirm whether this is already installed and what PR checks it provides. May avoid maintaining an additional workflow.

**Path B — GitHub Actions integration.** Source Tabs 1 and 7 provide a workflow outline and reference `GITGUARDIAN_API_KEY` as a GitHub Actions secret. The secret must never enter source code, PR descriptions, prompts, comments, or a staged archive. Check the integration's current supported action syntax before deploying.

**For developers:** source Tab 6 provides native and pre-commit alternatives. These are alternatives, not evidence that both are installed. Source Tabs 4–5 discuss machine-wide AI hooks as another optional layer.

## Proposed Validation Plan

1. Inventory current Custos workflows, existing installed GitGuardian App status if visible, policy files, and agent instruction locations.
2. Choose one minimally sufficient repository scanning path or explicitly justify using both.
3. Prepare a separate bounded security implementation branch; do not mix implementation into this intake rehearsal.
4. Validate YAML/config parsing, supported versions and permission requirements with official product documentation.
5. Exercise scanning with benign synthetic test data in an isolated test context (without real keys); record actual check behavior.
6. Check that an affected PR displays the expected checks and that configured branch-protection rules really enforce them if intended.
7. Independently review the integration for accidental loss of existing PR, witness, observation, and Shepherd controls.
8. Only after review and explicit owner cues consider finalization/merge.

## Provenance: Where Each Strand Came From

- **PDF tab 1, pp. 2–6:** five-file deployment package and branch workflow.
- **PDF tab 2, p. 8:** PR security checklist and ignore policy.
- **PDF tab 3, p. 10:** AGENTS guidance.
- **PDF tab 4, pp. 12–13:** MCP and AI hook architectural rationale.
- **PDF tab 5, pp. 15–16:** machine-wide hook claims.
- **PDF tab 6, pp. 18–19:** native/pre-commit setup alternatives.
- **PDF tab 7, pp. 21–22:** GitHub App vs Actions.
- **PDF tab 8, p. 24:** product overview and pricing, **time-sensitive claims not verified here**.

## Custos Rehearsal Context (new perspective, not asserted by origin)

The actual repository already provides `guides/navigo-session-kit/`, `guides/conversation-finalization-protocol.md`, `guides/pr-lifecycle.md`, an existing uppercase PR template, and several existing analyzers. The first intake PR is draft **#442**, and its first pass introduced documentation only. The review comments are gathered separately, with specific source links and with bot observations distinguished from verified facts.

## Questions Back to the Origin

1. Does the synthesis faithfully represent your **intended architecture and priorities**, including any important nuance we lost by grouping responses?
2. Which portions are alternatives and which did you intend as stacked, simultaneously installed protections?
3. Should an agent receive the same instructions as a human contributor, or does it need a separate capability matrix by tool?
4. Which five-file examples are proposed final configuration versus illustrative sketches?
5. Can you supply a corrected, internally consistent *candidate* implementation while clearly labelling any externally unverified version or capability?
6. What do you see in the review comments that we have missed or misunderstood?

## Return Format

Please provide:

- **AFTER — consolidated revision v1**, a standalone document with source-to-section traceability.
- **Change ledger:** `kept / consolidated / corrected / added / disputed / deferred`, with brief reasons.
- **Response to each review comment ID** in the companion document.
- **Verification labels:** observed locally / supported by official documentation / still a proposal.
- **Unresolved decisions and recommendations:** separate technical follow-up from intake-process findings.
- **Attribution and permission:** confirm how the originating voice should be credited and whether its revised contribution may be committed to the public `custos` repository.

Please do not declare the proposed installation complete or mark witnessing/observation on behalf of the Shepherd. Returning an `OPEN` document is a valid and helpful outcome.

---

*This packet is a bridge. It is not a replacement for the original conversation and does not claim authorship over the originating work.*
