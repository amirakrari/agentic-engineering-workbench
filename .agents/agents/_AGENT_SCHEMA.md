# Agent Schema (Authoritative)

Every `.agents/agents/*.md` except `README.md` and `_AGENT_SCHEMA.md` MUST conform.

## Design Rules

1. Create an agent only for a recurring responsibility with distinct knowledge, tools, and verification.
2. Keep roles narrow; skills provide task-specific procedures.
3. Prefer built-in workers or explorers for generic work.
4. Give mutation tools only to implementation owners. Review and verification stay read-only.
5. One agent owns a changed path at a time.
6. Use economical models for broad discovery, balanced models for execution, and advanced models for architecture, security, or adversarial judgment.
7. Graph tooling is optional. Permit language-server navigation and repository search fallback, with direct source verification.

## File And Frontmatter

Use `.agents/agents/<kebab-case-name>.md`; filename and `name` must match.

```yaml
---
name: <kebab-case>
description: <one sentence stating the job and invocation boundary>
type: diagnostic | review | implementation | domain | research
enforcement: suggest | inform
priority: critical | high | medium | low
model_tier: economical | balanced | advanced
tools: Read, Write, Edit, Bash, Glob, Grep
---
```

All seven fields are required. `model_tier` is a portable capability class. `tools` is an allow-list. Read-only agents use `Read, Bash, Glob, Grep`; mutating agents add `Write, Edit`; research agents add external retrieval only when needed.

## Required Sections In Order

1. `## Purpose`
2. `## When to Use`
3. `## When NOT to Use`
4. `## Mandatory Reads`
5. `## Skill Routing`
6. `## Operating Workflow`
7. `## Allowed Tools`
8. `## Ownership And Handoffs`
9. `## Forbidden Moves`
10. `## Output Contract`
11. `## Done Criteria`
12. `## Anti-Patterns`
13. `## Related Agents`

The workflow ends in an observable stop condition. Mandatory reads start with
the target's root and scoped instructions plus native skill catalog, then link
the cockpit root contract, `docs/QUICK_REFERENCE.md`,
`.agents/contract/intents.yaml`, and only relevant canonical docs.

## Execution And Output Boundaries

- Target clone: `repos/<name>`; initial planning creates
  `repos/<name>/dev/active/<task>/{plan.md,tasks.md,context.md}`.
- Isolated execution: `repos/<name>/.worktrees/<task>`; move the entire sole
  task directory into that worktree's `dev/active/` before implementation.
- In-tree execution keeps the same clone-local active path. Target-required
  tracked artifacts override this optional local layout and are recorded.
- Build, test, lint, runtime, and Git commands run from the resolved clone or
  task-worktree Cwd. Subagent handoffs carry that Cwd, applicable instruction
  revisions, target and cockpit contracts, and exact loaded skill paths.
- Clone-root local deferrals and notes live under `dev/backlog/` and
  `dev/notes/`; reusable shared findings live under cockpit `knowledge/`.
- Shared cockpit documentation lives directly under `docs/`; do not add a private nested documentation root.
- Child architecture, compatibility policy, contribution rules, and licenses override template examples.
- Scout/reviewer output contains findings and locations, not raw source or logs, and follows [Context Engineering](../CONTEXT_ENGINEERING.md).

See [Target Workflow](../../docs/TARGET_WORKFLOW.md) for exclusion, collision,
move, staging, retention, and cleanup procedure.

## Size And Portfolio Gate

- Target 80-140 lines; hard maximum 180.
- Do not copy rule catalogs, stack overviews, personas, or diagrams into profiles.
- Reject a proposed agent unless it owns a recurring concern, differs materially from an existing role or skill, is routable from one sentence, has distinct evidence, and reduces context/tool overload enough to justify orchestration.

## Authoring Checklist

- Frontmatter and filename agree; tools use least privilege.
- All required sections exist in order; links resolve and named skills exist.
- Workflow, ownership, handoff, and stop condition are objective.
- Profile stays within 180 lines and does not restate global rules.
- Registry includes the role.
- Validate as documentation/configuration; do not add prose-pinning tests.

## Related

- [Skill schema](../skills/_SKILL_SCHEMA.md)
- [Intent registry](../contract/intents.yaml)
- [Contribution contract](../../AGENTS.md)
- [Documentation architecture](../../docs/DOCUMENTATION_ARCHITECTURE.md)
