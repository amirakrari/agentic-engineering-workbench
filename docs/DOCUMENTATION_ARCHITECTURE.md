# Documentation Architecture

> **Audience:** Contributors | Maintainers | AI agents
> **Status:** Reference
> **Owner:** Contributor Experience
> **Last Verified:** 2026-09-27
> **Source Anchors:** [Documentation Style Guide](DOCUMENTATION_STYLE_GUIDE.md), [Target Workflow](TARGET_WORKFLOW.md), [`README.md`](../README.md)

## Intent Model

| Intent | Reader question | Content |
|---|---|---|
| Tutorial | How do I learn this once? | Guided first-run flow |
| How-to | How do I complete this task? | Procedures and runbooks |
| Reference | What is the exact contract? | Commands, schemas, rules |
| Explanation | Why is it designed this way? | Architecture and trade-offs |

Split task instructions from reference tables when a page has competing intents.

## Boundaries

| Location | Responsibility |
|---|---|
| Root `README.md` | Human entry point and task routing |
| `docs/` | Cockpit architecture, governance, operations, reference |
| `docs/legal/` | Provenance and distribution-review controls |
| `.agents/` | Machine-facing contracts, skills, rules, benchmark method |
| `repos/<name>/dev/active/` | Clone-local planning or approved in-tree triads |
| `repos/<name>/.worktrees/<task>/dev/active/` | Sole triad during isolated execution |
| `repos/<name>/dev/backlog/` | Clone-root accepted deferred work |
| `repos/<name>/dev/notes/` | Clone-root task-namespaced investigation notes |
| `knowledge/` | Shared reusable journal and promotion policy; promoted records retain source project/task provenance |
| `islamic-value-sensitive-design/` | Ethical governance, consultations, and shared `i-vsd-<project>-<task>.md` evaluations |
| `repos/<name>/` | Child docs governed by that repository |

Child docs stay in the child. Cockpit knowledge must not duplicate or override upstream product documentation.
Target-required tracked planning artifacts remain target docs; do not hide them
to enforce the default local layout. See
[Target Workflow](TARGET_WORKFLOW.md) for ownership and movement.

## Metadata and Anchors

Canonical docs state Audience, Status, Owner, Last Verified, and Source Anchors below the title. Last Verified means anchors were checked. Never label proposals Implemented.

Anchor exact claims to machine configuration, source, tests, workflows, or
canonical contracts. Link child files from workstreams through the recorded
clone or task-worktree root, and identify cockpit-owned links explicitly. If
docs disagree with source, fix the docs or record the mismatch.

## Ownership, Impact, and Rendering

Ownership means responsibility for accuracy, not exclusive edit rights. Non-trivial changes record docs impact as Updated, Not needed, or Deferred.

Use relative links, standard Markdown, and Mermaid. Since graph rendering is optional, diagrams require adjacent explanatory prose or tables. Validate internal links before completion.

## Related

- [Documentation Style Guide](DOCUMENTATION_STYLE_GUIDE.md)
- [Agentic Context Engineering](AGENTIC_CONTEXT_ENGINEERING.md)
- [Governance](GOVERNANCE.md)
- [Target Workflow](TARGET_WORKFLOW.md)
