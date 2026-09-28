---
name: finding
description: "Load when recording an evidenced reusable engineering lesson in cockpit knowledge/journal.md; not for project-local progress, backlog notes or already-documented facts."
type: workflow
enforcement: suggest
priority: medium
---

# Record a Durable Finding

Record only when the fact is non-obvious, durable, reusable, and supported by evidence. Do not duplicate [Quick Reference](../../../docs/QUICK_REFERENCE.md), [Governance](../../../docs/GOVERNANCE.md), a rule, or a skill.

## Workflow

1. Read [knowledge guidance](../../../knowledge/README.md),
   [finding template](../../../knowledge/FINDING_TEMPLATE.md) and
   [promotion rules](../../../knowledge/PROMOTION_RULES.md).
2. Fill the canonical fields: date/timezone, title, context, observation, root cause, resolution, future significance, references, and promotion consideration.
3. Append to [the shared journal](../../../knowledge/journal.md); preserve
   chronological history and annotate rather than rewriting prior entries.
4. Link exact `path:line`, tests, issue/PR, and revision evidence. Label assumptions and unresolved validation.

## Promotion gate

Promote when repeated evidence shows the finding belongs in one authoritative destination: quick reference for invariant, rule for scoped constraint, skill for workflow, governance for policy, or architecture/docs for system truth. Keep the journal entry and add a promotion link.

Do not create a standalone file for one finding, include secrets/PII, or record routine command usage and implementation logs.

Project-specific notes stay locally excluded in the configured clone; do not
promote them simply to enable worktree cleanup. Apply target guidance when a
finding belongs in maintainer-required tracked documentation instead. Resolve
the cockpit root explicitly from a child/worktree; these links belong to this
skill's directory, not the shell Cwd.
