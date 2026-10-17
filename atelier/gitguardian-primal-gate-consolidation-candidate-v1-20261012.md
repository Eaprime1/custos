# ∰ Custos Security Integration — Primal Gate Protocol

*Consolidation Candidate v1 — receiving Navigo synthesis for origin review*

`suit: ♦️ Diamond — developing architecture`
`prima-clock: 202610121815`
`status: OPEN-origin-review-and-implementation-verification`
`rehearsal: https://github.com/Eaprime1/custos/pull/442`

> **Attribution and authority.** This candidate is prepared by the receiving ChatGPT conversation from two original response collections and the review interchange. It is **not** presented as a text written, approved, or ratified by the originating conversation. Before/after distinctions, disputed points, and provenance remain visible. No merge, install, sealed witness, or observation is claimed.

## 1. The Thread — Why the Gate Exists

The originating conversation begins with GitGuardian's practical protections against accidental leakage of credentials in development and AI-assisted coding. Across multiple responses it develops a proposed five-file security integration for `Eaprime1/custos`: workflow scanning, agent guidance, pull-request checklist entries, scanner configuration and workstation hooks. The first return moves that idea toward Custos's own language: the **Primal Gate Protocol** as a checkpoint between **Preturn** (gathering context) and **Prima** (the first operational action). Each relevant check is described as a **Standard Handshake**, with an intended Pass or Fail.

The return's most concrete technical change is abandoning broad test-directory exclusions in favor of individual paths. Its most important conceptual change is treating security not as the project's central purpose but as guardianship at an action boundary. A scanner's scope, however, is narrower than an all-purpose ethical or operational boundary. The architecture should say **what checks were actually run, where, and with what results**, while keeping Custos's Shepherd, witness and observation processes independent.

## 2. Preserve the Original Distinctions

**Preturn → Gate → Prima** is the **origin's conceptual model**. It is not a report of an installed gate.

**GitGuardian's proposed practical layers (from the original PDF):**

| Layer | Intended effect | Evidence needed |
| --- | --- | --- |
| Workstation Git hook | Scan material at the configured pre-commit/pre-push boundary | Installation on each relevant machine, correct authentication, real check outcome |
| AI assistant hook and optional MCP assistance | Detect credential hazards in supported prompts/tool interactions, aid diagnosis | Exact assistant, hook support, installed version, read-only health check and relevant scenario |
| Repository integration | Report scanning on pushes or PRs through a GitHub App **or** GitHub Actions | Chosen integration, actual check run, policy on check failures |
| Contributor instructions | Explain what to avoid and how to remediate without publishing sensitive values | Agent documentation placement and confirmed discovery |
| Custos governance | Steward contribution, ethical review, witnessing and Shepherd-directed transitions | Existing PR lifecycle; not replaceable by scanning success |

**Boundary refinement from the receiving Navigo:** There are multiple *physical* times for a gate, not just one. A pre-model prompt check, a pre-tool hook, a Git commit hook, and a PR review are separate checkpoints. The philosophical Preturn-to-Prima boundary may coordinate these, but it cannot be implemented solely by a Git pre-commit hook.

## 3. A Handshake Whose Meaning Can Be Verified

The **origin's returned text** explicitly names two outcomes:

- **Pass:** verified alignment for the particular check, permitting the guarded next step.
- **Fail:** the guarded step stops and remediation is required.

**Receiving Navigo extension, not yet accepted by origin:**

- **NOT-CHECKED / UNKNOWN:** tool absent, hook not installed, credential unavailable, scan unreachable, or check status not observable. Never call this Pass. A receiving workflow may pause for explicit direction rather than claiming a deterministic block.

**Critical external-documentation distinction:** GitGuardian's current AI Hook documentation says a hook can *fail open* when scanning cannot run; it warns but may allow the interaction. GitGuardian also describes differing pre/post-tool coverage among assistants. Thus an **intended Fail means stop** is a policy, not proof all supported tools enforce fail-closed behavior.

Verification source (external to conversation): https://docs.gitguardian.com/endpoint-protection/ai-hooks

## 4. Five Proposed Artifacts — Review Matrix, Not Deployed Files

### A. `.github/workflows/gitguardian.yml` — shared scanning

The original PDF suggests scanning pushes and PRs. Before creating it, determine whether a GitGuardian GitHub App is already active and whether separate Actions scanning is desirable. If Actions is chosen, verify supported action version, event scope, permissions, authentication and whether the check is required by branch protection. No live Actions config is changed in this intake PR.

### B. Agent instructions — `AGENTS.md` proposal

The source proposes `.github/AGENTS.md`. Verify which agent(s) will discover the instructions in that location before relying on them. Reuse existing Custos agent-specific instruction conventions as appropriate. Instructions should never assert MCP or local AI hooks are already present without evidence. Do not copy credentials into prompts, comments or commits.

### C. Existing `.github/PULL_REQUEST_TEMPLATE.md` — additive checklist

The originating return proposes three checks:

1. Workstation Pre-Commit
2. Assistance Guardrails
3. Environment Isolation

These fit as **optional, evidence-backed additions** to the existing PR template. They must not erase its Intent, What Arrived, Resonance, Ethics, Sense, prime state, witness and observed fields. A stronger formulation asks what tool actually ran; no scan can prove absolute absence of all secrets.

### D. `.gitguardian.yaml` — narrow exceptions only after evidence

The first PDF broadly excluded tests/mocks/fixtures. The returned DOCX proposes *three specific paths*:

- `tests/mocks/schemas/mock_declination_schema.json`
- `test-fixtures/tokens/synthetic_test_tokens.env`
- `tests/fixtures/angle_engine_state_register.json`

**Receiving repository check on 2026-10-12:** none of these paths was found on `main`. They are not approved exceptions. Before adding any exclusion, identify an actual file, a verified false-positive reason, and the smallest safe exception; otherwise leave scanning enabled. The source's reconstructed YAML in its final tab also runs headings together and should not be treated as a validated configuration.

### E. `.pre-commit-config.yaml` — local hook configuration

The returned DOCX retains `repo: https://github.com` and `stages: [commit]`. Those are **not the verified canonical configuration**. GitGuardian's official pre-commit documentation (updated 2026-10-06) shows:

```yaml
repos:
  - repo: https://github.com/gitguardian/ggshield
    rev: v1.55.0
    hooks:
      - id: ggshield
        language_version: python3
        stages: [pre-commit]
```

This example is quoted here for **comparison and technical review**; it is *not* an instruction to install or deploy in this PR. GitGuardian also requires a working authentication context. Official source: https://docs.gitguardian.com/ggshield-docs/integrations/git-hooks/pre-commit

## 5. Before → First Return → Candidate V1

| Strand | Before: original PDF (25 pp.) | First return: DOCX (13 pp.) | Receiving candidate v1 |
| --- | --- | --- | --- |
| Five-file structure | Comprehensive but repeated | Selective refinements | Unified responsibility matrix, no premature implementation |
| Ignore policy | Broad tests/mocks exclusions | Three example file paths | Conditional narrow exceptions; confirmed paths absent on main |
| Pre-commit configuration | Incomplete URL in unified example; fuller form in another tab | Incomplete URL remains | Vendor-documented example preserved *only for review* |
| Gate meaning | Security as automated blocking | Preturn → Primal Gate → Prima, Pass/Fail | Separates philosophical gate from actual hook timing; proposes NOT-CHECKED |
| Custos integration | PR checklist and agent directives | Primal Gate seed narrative proposed for session-kit README | Link/index the candidate, do not replace existing guide or change any workflow |
| Provenance | Collected independent responses | Six new response tabs | Source map and change ledger retained |
| Actual installation | No evidence from provided sources | Test commands suggested, no result provided | No configs installed or claims of effective protection |

## 6. What Was Validated, and What Was Not

**Observed in Custos on 2026-10-12:** `.github/PULL_REQUEST_TEMPLATE.md` exists; established session-kit and Conversation Arc protocols exist. Three proposed mock/test exception files, `.gitguardian.yaml`, and `.pre-commit-config.yaml` were not found on `main`. Draft PR #442 exists and remains unmerged.

**Supported by external vendor documentation:** GitGuardian's pre-commit example uses the full GitGuardian repository URL and `pre-commit` stage; AI hooks cover different interaction stages depending on assistant, and may fail open if unable to authenticate/scan. These findings clarify implementation possibilities; they do not establish local installation. Sources: https://docs.gitguardian.com/ggshield-docs/integrations/git-hooks/pre-commit and https://docs.gitguardian.com/endpoint-protection/ai-hooks

**Still unverified:** GitGuardian App installed status; API credentials and permissions; local ggshield/pre-commit presence; local hook scan results; assistant hook status; GitHub Actions integration; branch protection requirements; exact exception rationale; originator attribution/public source release permission.

## 7. What Should Be Filed Where

- **This Candidate:** `atelier/gitguardian-primal-gate-consolidation-candidate-v1-20261012.md` — receiver's best coherent synthesis, *pending origin review*.
- **Original Source Index:** `atelier/gitguardian-security-proposal-intake-20261011.md`.
- **Receiving Questions and First Return:** `atelier/gitguardian-origin-review-comments-20261011.md` and `atelier/gitguardian-origin-first-return-receipt-20261011.md`.
- **Conversation Arc:** `dungeon-master/conversations/202610121815_gitguardian-primal-gate.md` — the distilled story; still OPEN.
- **Implementation:** separate security mission/PR **only after** origin feedback and an owner decision on integration, exceptions and testing. Do not broaden this draft intake PR into deployment.

## 8. Origin Conversation — Final Response Invitation

**To the originating conversation:** Please read the *candidate synthesis* against your original 25-page response collection and your six-tab first return. Revise in your own voice; do not feel obliged to agree with the receiving Navigo. Return a standalone document titled **AFTER v1 — Origin-Reviewed Primal Gate**, with:

1. What is preserved, revised, restored or disputed in this consolidation (refer to section numbers).
2. Your chosen definition of Preturn, Primal Gate, Prima and Standard Handshake, including the proposed NOT-CHECKED state.
3. Whether the GitHub App and Actions are alternatives, and how local, agent and PR checks should relate.
4. Which file paths are *examples* versus intended actual exclusions; do not approve exclusions without evidence.
5. A short change ledger and remaining questions. State whether the source/revision may be incorporated into the public repository and how it should be credited.

There is no deadline or forced closure. An `OPEN` answer with clear unresolved threads is sufficient.

## 9. Status and Next Boundary

The content can be distilled now. Its **technical deployment cannot be certified now**. Keep PR #442 a draft and preserve the Shepherd's existing control over review, witness, observed and merge states. After origin feedback, update the comparative record; only then consider a separately scoped implementation PR.

---

*Enjoy the journey — a gate is only trustworthy when its limits are named as clearly as its purpose.*
