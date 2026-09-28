---
name: skill-authoring
description: "Load when creating, updating, auditing, routing, simplifying, or validating .agents/skills, SKILL.md metadata/resources, schemas, or skill context tests; not for application code or ordinary documentation."
type: workflow
enforcement: suggest
priority: high
---

# Skill Authoring

## Rules

1. Write selector-facing descriptions with concrete triggers, artifacts, and neighboring exclusions.
2. Every router has exactly the required frontmatter fields: `name`, `description`, `type`, `enforcement`, `priority`; validate allowed values against [schema](../_SKILL_SCHEMA.md).
3. Keep `SKILL.md` at or below 250 lines. Put durable depth into narrowly named resources and load them just in time.
4. Preserve substantive workflows; never replace a rich skill with a summary stub.
5. Separate verified repository facts, source-backed claims, assumptions, and validation needs. Strip branding and synthetic metadata comments.
6. Use only relative links resolved from the file containing the link. Do not assume cockpit-root resolution.
7. For contribution work, apply the
   [target workflow](../../../docs/TARGET_WORKFLOW.md): inspect native skill
   catalog metadata, load only exact matching target and cockpit skill paths,
   and let target guidance win overlapping conflicts.

## Workflow

1. Resolve the skill intent and inspect adjacent selectors for overlap.
2. Inventory source router and full resource tree; classify each file as preserve, generalize, replace, or omit with rationale.
3. Draft the selector first, then the ordered workflow, gates, progressive resource routing, and executable verification.
4. Generalize project/technology and workspace assumptions through
   `project.yaml` and the target workflow; do not duplicate its clone,
   worktree, dev-doc, knowledge, or instruction-discovery policy here.
5. Validate metadata, line caps, links, forbidden references, resource reachability, and any machine-consumed eval fixtures.
6. Report source disposition, pattern evidence, checks, and limitations.

## Resources

Load [resource index](resources/index.md), then only the resource for the
unresolved authoring decision. Also consult
[context engineering](../../../.agents/CONTEXT_ENGINEERING.md),
[documentation architecture](../../../docs/DOCUMENTATION_ARCHITECTURE.md), and
the [target workflow](../../../docs/TARGET_WORKFLOW.md) for contribution
topology and target-native guidance.
