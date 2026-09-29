# Engineering Governance

> **Audience:** Contributors | Maintainers | AI agents
> **Status:** Reference
> **Owner:** Contributor Experience
> **Last Verified:** 2026-09-27
> **Source Anchors:** [`AGENTS.md`](../AGENTS.md), [`project.yaml`](../project.yaml), [Quick Reference](QUICK_REFERENCE.md)

## Authority Order

1. Applicable law, upstream license, and child contribution policy.
2. Target root, harness, nested, and path-scoped instructions plus selected
   target-native skills.
3. Root cockpit contract, active intent, and compatible cockpit skills.
4. General cockpit docs, templates, and defaults.

Follow target requirements for overlapping work, record the resolution, and
retain compatible cockpit workflow. Do not repeatedly ask about settled
precedence. Escalate only contradictory target instructions or missing user
scope. Never silently import a cockpit convention into upstream code.

## Local Workflow Ownership

Target code and task state stay with the target clone. Planning begins at
`repos/<project>/dev/active/<task>/`; isolated implementation moves the whole
sole task directory into clone-relative `.worktrees/<task>/dev/active/<task>/`.
In-tree execution remains clone-local. Project backlog and investigative notes
stay clone-root; reusable journal entries and ethical reports remain cockpit
owned. Shared ethical reports retain project identity in
`i-vsd-<project>-<task>.md`; reusable knowledge records its source project/task
provenance.

Machine-local workflow exclusions are exact entries in the selected clone's
resolved shared Git `info/exclude`. They never change tracked `.gitignore` or
global settings. Verify tracked/content collisions and effective ignores before
writing or moving. Do not force-stage ignored task material; retain it before
authorized worktree cleanup. A target-required tracked artifact is project work,
not something to hide. Use [Target Workflow](TARGET_WORKFLOW.md) for procedure.

## Design Principles

- Keep business rules with the component that owns state.
- Make trust and authority explicit at boundaries.
- Prefer cohesive modules over pass-through abstractions.
- Keep external services behind narrow adapters.
- Use transactions for atomic state; emit side effects only after durable authority.
- Prefer explicit dependencies over hidden globals or service location.
- Choose KISS and YAGNI over speculative frameworks.
- Preserve compatibility with expand/migrate/contract unless the child explicitly opts into greenfield breaks.

## Context-Agnostic Core Admission Rule

The workbench core owns reusable engineering process, not the implementation
context of every project it may operate on. New material is admitted only when
it satisfies all of these conditions:

1. **Cross-context utility:** it remains useful across languages, frameworks,
   vendors, deployment models, and product domains.
2. **Process ownership:** it governs discovery, reasoning, planning, execution,
   verification, review, provenance, or knowledge flow rather than one target's
   business or implementation rules.
3. **Target deference:** it discovers and yields to applicable target-native
   instructions and skills instead of duplicating or overriding them.
4. **No mandatory external integration:** it does not require a particular SaaS,
   SDK, issue tracker, documentation platform, renderer, cloud, or package.
5. **Portable evidence:** its completion and verification contract can be
   expressed using target-configured commands and observable behavior.

Context-agnostic does not mean vague. A workflow may be highly prescriptive about
evidence, authority, determinism, isolation, or review while remaining neutral
about the target's stack and domain.

### Routing Material That Does Not Qualify

| Material | Correct home |
|---|---|
| Product/domain behavior | Target repository |
| Organization-specific policy | Organization governance repository or target |
| Language/framework implementation skill | Target repository or separate skill catalog |
| Vendor/SaaS/SDK integration | Target repository or optional integration pack |
| Documentation/rendering platform workflow | Separate skill catalog |
| Reusable target-independent engineering workflow | Workbench core |

Do not add a core skill merely because several projects might use the same tool.
Reuse frequency does not make an integration context-agnostic. The target
discovery contract allows users to supply such skills without changing the
workbench.

Optional reference/template catalogs are not auto-activated skills and must be
clearly separated from the core. New stack-specific catalogs require an explicit
architecture decision; prefer an external catalog.

Every new or materially expanded skill must document its admission decision in
the change review: which five conditions it satisfies and why its behavior cannot
be owned more accurately by a target or optional catalog.

## Visible Targets and Contribution Boundary

The local `repos/` directory is deliberately visible for editor navigation,
search, workspace indexing, and chat `@` mentions. Its children are independent
target repositories and never workbench source.

Workbench contributors:

- create `repos/` locally; the workbench does not track a placeholder;
- never bulk-stage the workbench root while targets are present;
- stage exact paths and run `bash eng/check-workbench-staging.sh`;
- reject every non-deletion staged or committed `repos/**` path, including
  nested repositories represented as gitlinks;
- clean the parent index with `git restore --staged -- repos/`, never by deleting
  or resetting a target repository.

CI verifies the committed tree with the same guard. Target commits and workbench
commits remain separate histories, commands, reviews, and publication decisions.

## Boundary Rules

| Concern | Rule |
|---|---|
| Persistence | Return domain-appropriate state; avoid presentation leakage unless child architecture requires it |
| Validation | Validate untrusted input early; keep state-dependent rules with authoritative state |
| Identity | Resolve callers from the child's trusted principal/context, not request-body authority |
| Authorization | Enforce server-side; UI affordances are not authority |
| Errors | Use stable child contracts without secrets, personal data, or internals |
| Observability | Emit bounded, low-cardinality, non-sensitive diagnostics |
| Generated artifacts | Regenerate through the owner; do not hand-edit unless the child treats them as source |

## Decision Framework

Before editing, answer: what behavior changes; which target root/scoped
instructions and exact native/cockpit skills apply; which execution root and
task path are authoritative; who owns state and authority; what is the worst
break; which public seam proves it; what is the smallest coherent path
ownership; which docs drift; and what evidence closes the change?

## Review and Documentation

Review standards and intent fidelity independently. Check the twelve-smell baseline in [Agentic Context Engineering](AGENTIC_CONTEXT_ENGINEERING.md#14-two-axis-review-and-right-sizing), trust boundaries, scope creep, and the tested worst break. Split changes that combine independent intents or become unreliable to review.

Every non-trivial change records docs impact as **Updated**, **Not needed**, or **Deferred** with a named follow-up. Security, configuration, API, migration, operator, and onboarding changes default to Updated unless inspection proves otherwise.

Agent rules are concise refinements of canonical docs. Never claim hooks, CI, graph tooling, or automation that is absent. Tests validate machine-consumed contracts, not prose. Rule twins are exact regular-file copies.

## Related

- [Operations](OPERATIONS.md)
- [Target Workflow](TARGET_WORKFLOW.md)
- [Documentation Architecture](DOCUMENTATION_ARCHITECTURE.md)
- [IP Governance](legal/IP_GOVERNANCE.md)
