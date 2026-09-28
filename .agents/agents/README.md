---
name: Agents Documentation
description: Selection and coordination registry for portable subagent operational contracts
disabled: true
---

# Subagent Registry

Profiles here are governed by [`_AGENT_SCHEMA.md`](_AGENT_SCHEMA.md). They specialize recurring work without replacing the root [contribution contract](../../AGENTS.md), [intent registry](../contract/intents.yaml), or task-specific skills.

## Role Matrix

| Agent | Invoke for | Owns | Mode | Tier |
|---|---|---|---|---|
| [Architect](architect-agent.md) | Cross-boundary design, ADRs, sequencing | Decisions and plans | Docs-only | Advanced |
| [Engineer](engineer-agent.md) | Domain, application, persistence, integrations | Cohesive implementation | Mutation | Balanced |
| [Presentation](presentation-agent.md) | Public interfaces, API contracts, UI behavior | User-facing slices | Mutation | Balanced |
| [Security & Privacy](security-privacy-agent.md) | Identity, authorization, secrets, privacy, abuse | Trust boundaries | Mutation | Advanced |
| [Operations](operations-agent.md) | Hosting, CI/CD, observability, recovery | Operability and runbooks | Mutation | Balanced |
| [Quality Verifier](quality-verifier-agent.md) | Failure reproduction and verification | Empirical evidence | Read-only | Balanced |
| [Change Reviewer](change-reviewer-agent.md) | Diff or PR review | Findings and verdict | Read-only | Advanced |
| [Librarian](librarian-agent.md) | Documentation, research, inventories | Truth and provenance | Docs-only | Economical |

## Selection And Coordination

1. Start with the selected target's `AGENTS.md`, `CLAUDE.md`, `README`, `CONTRIBUTING`, scoped instructions, and native skill catalog when present. Load matching exact target skill paths alongside compatible cockpit skills.
2. Prefer direct work or a built-in worker/explorer for atomic tasks. Select one profile by the highest-risk owned boundary.
3. Keep a cohesive change with one mutating owner. Never run overlapping writers; add read-only specialists only for independent evidence.
4. Use Quality Verifier for empirical proof and Change Reviewer for semantic review. Neither edits the fix.
5. The primary agent retains goals, decisions, synthesis, and accountability. A handoff states the resolved Cwd, target and cockpit contracts, exact loaded skill paths, goal, owned paths or read-only mode, evidence, stop condition, model tier, and result cap.
6. Refresh applicable instruction revisions and native skill discovery whenever a task worktree is created or resumed.
7. Parallelize independent read-heavy work. Sequence writes unless ownership is explicitly disjoint.
8. Treat an agent graph as optional acceleration. When unavailable or stale, use language-server references/definitions and repository search, then verify named files and symbols directly.
9. Run build, test, lint, runtime, and Git commands from the resolved clone or task-worktree Cwd. The sole active triad lives at that execution root's `dev/active/<task>/`.

Detailed cloning, local exclusion, triad transfer, worktree, completion, and
cleanup procedure belongs to [Target Workflow](../../docs/TARGET_WORKFLOW.md).

## Agents Versus Skills

An agent owns a recurring outcome, tool boundary, workflow, and handoff. A skill supplies a focused procedure. Load only skills matching the resolved intent. Stack examples in [`../templates/`](../templates/README.md) are optional references, never cockpit policy; child architecture, compatibility, and license requirements prevail.

Target rules win overlapping conflicts without erasing compatible cockpit
workflow. All profiles follow [Context Engineering](../CONTEXT_ENGINEERING.md).
Validate metadata, links, routing, and bounded outputs directly; do not pin
prose with product tests.
