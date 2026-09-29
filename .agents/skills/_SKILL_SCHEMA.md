# Skill Schema (Authoritative)

Every `.agents/skills/*/SKILL.md` MUST conform when created or materially revised. The catalog exposes only `name` and `description` before loading, so the description owns activation.

## Location

```text
.agents/skills/<kebab-case-name>/SKILL.md
```

The folder must match frontmatter `name`. Longer references belong in `.agents/skills/<name>/resources/*.md` and load only for a named unresolved decision.

## Required Frontmatter

```yaml
---
name: <kebab-case>
description: <routing sentence with concrete triggers and overlap exclusions>
type: guardrail | pattern | reference | workflow
enforcement: block | suggest | inform
priority: critical | high | medium | low
---
```

All five fields are required. Descriptions name user phrases, artifacts, technologies, failure modes, or paths that trigger the skill, plus a compact exclusion where false positives are likely. They are routing metadata, not marketing summaries.

## Loaded Content

- `## Rules`: non-inferable constraints, defaults, and decisions.
- `## Workflow`: include only when order matters; omit generic ceremony.
- `## Resources`: optional links with one-line retrieval conditions.
- `## Verification`: commands, observable checks, or output requirements that catch realistic failures.

Other descriptive sections are allowed. Do not duplicate routing sections after the skill has loaded.

## Progressive Disclosure And Portability

- Target 30-120 lines; hard maximum 250; initial-load target 6 KB.
- Follow [Context Engineering](../CONTEXT_ENGINEERING.md); do not reread unchanged context.
- An agent graph is optional. Use language-server navigation and repository search when unavailable, then read definitions and callers directly.
- Commands come from `project.yaml` and execute from the selected clone or
  worktree execution root defined by the [target workflow](../../docs/TARGET_WORKFLOW.md).
- Shared cockpit docs live directly under `docs/`; do not introduce a private nested documentation root.
- Technology examples are optional. Child architecture, compatibility policy, contribution contract, and licenses prevail.

## Repository Admission Gate

Schema compliance does not establish that this repository is the correct owner.
Before adding a skill, apply the
[Context-Agnostic Core Admission Rule](../../docs/GOVERNANCE.md#context-agnostic-core-admission-rule).

Core skills must remain useful across languages, frameworks, vendors, deployment
models, and product domains; govern reusable engineering process; defer to target
authority; avoid mandatory external integrations; and verify through target-
configured commands or observable behavior. Route tool-, vendor-, stack-, SaaS-,
SDK-, issue-tracker-, documentation-platform-, and product-specific skills to the
target repository or a separate optional catalog.

## Forbidden Content

- Activation lists duplicated from `description`.
- Generic stack overviews, persona prose, fixed-count filler, or ASCII diagrams.
- Copied global invariants instead of links to canonical owners.
- Unconditional resource cascades.
- Project branding, project-domain names, personal-profile context, or legacy personal annotation prefixes.
- Product tests that pin prose, prompt wording, or documentation layout.

## Enforcement And Migration

The harness consumes frontmatter; reviewers validate routing, links, context budget, and practical content. Existing nonconforming skills are migration debt and must not grow. Split depth into selectively loaded resources rather than exceeding limits.

## Related

- [Agent schema](../agents/_AGENT_SCHEMA.md)
- [Intent registry](../contract/intents.yaml)
- [Documentation architecture](../../docs/DOCUMENTATION_ARCHITECTURE.md)
- [Target workflow](../../docs/TARGET_WORKFLOW.md)
