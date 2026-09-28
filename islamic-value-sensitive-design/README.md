# Islamic Value-Sensitive Design Records

This directory stores project-independent ethical governance and project-scoped evaluations using Islamic value-sensitive design. It supports structured reflection on justice, trust, human dignity, privacy, stewardship, harm prevention, accessibility, power, and uncertainty. It is not a substitute for qualified scholarship, law, security review, or affected-community consultation.

## Structure

| Directory | Purpose |
|---|---|
| `governance/` | Durable constitutional principles and evaluation policy |
| `consultations/` | Focused domain questions and deeper consultations |
| `workstreams/` | Ethical evaluations attached to planned child-project work |

The directories intentionally start empty. Never import another project's evaluations or invent active findings. New records identify the child project, affected stakeholders, evidence, assumptions, value tensions, mitigations, residual uncertainty, and revalidation trigger. Keep observations separate from normative judgment and implementation decisions.

Ethical records remain cockpit-owned even when planning and execution state is
clone-local. Project-scoped workstream reports use
`workstreams/i-vsd-<project>-<task>.md`, preserving project identity in the
shared cockpit without repeating it in target-local task directories. Begin
with target instruction and native-skill discovery, then record the target
revision actually evaluated. Target requirements govern overlapping
contribution details; compatible ethical and cockpit workflow remains active.

Use explicit child references such as `repos/<name>/...`. Planning links point
to `repos/<project>/dev/active/<task>/`; after isolated execution
moves the sole task directory, update the technical link to
`repos/<project>/.worktrees/<task>/dev/active/<task>/` without moving
or duplicating the ethical report. If target policy requires another layout,
record that actual path. Preserve provenance without copying restricted
expression. Sensitive consultations must not include secrets, personal data, or
unnecessary identifying details. Any reusable knowledge promoted from an
evaluation records its source project, task, report path, and evaluated
revision.

See [Agentic Context Engineering](../docs/AGENTIC_CONTEXT_ENGINEERING.md#3-canonical-five-stage-lifecycle),
[IP Governance](../docs/legal/IP_GOVERNANCE.md),
[Documentation Style](../docs/DOCUMENTATION_STYLE_GUIDE.md), and
[Target Workflow](../docs/TARGET_WORKFLOW.md) for target discovery, task path
movement, and cleanup ownership.
