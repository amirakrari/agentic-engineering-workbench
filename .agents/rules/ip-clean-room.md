---
name: ip-clean-room
description: Apply when implementation, documentation, planning, dependencies, or assets may be externally informed.
paths:
  - "repos/**/*"
  - "repos/*/.worktrees/*/**/*"
  - "docs/**/*"
  - "repos/*/dev/active/**/*"
  - "repos/*/.worktrees/*/dev/active/**/*"
  - "repos/*/dev/backlog/**/*"
  - "repos/*/dev/notes/**/*"
  - "knowledge/**/*"
  - "islamic-value-sensitive-design/**/*"
related_docs:
  - docs/legal/IP_GOVERNANCE.md
  - docs/QUICK_REFERENCE.md
related_skills: [ip-clean-room, agentic-research]
minimum_tests: [docs]
related_intents: [add-feature, update-docs, create-agent-context-skill]
---

# IP Clean-Room and Provenance

> **Applies to:** externally informed child work, clone-local task artifacts,
> cockpit knowledge, and ethical reports.
> **Authority:** [`docs/legal/IP_GOVERNANCE.md`](../../docs/legal/IP_GOVERNANCE.md). The target's license and contribution rules prevail.

## Rules

| # | Rule | Correct | Wrong |
|---|---|---|---|
| 1 | External input | Source-free functional observations and constraints | Code, snippets, ASTs, SQL, tests, comments, prose, or assets |
| 2 | Context boundary | Fresh implementation context receives only sanitized handoff | Research and implementation share source-bearing context |
| 3 | Independence | Target-native design based on requirements | Translation, paraphrase, renaming, or mechanical rewrite |
| 4 | SSO | Record filtration and independent structure/sequence/organization | Assume a language/framework change proves independence |
| 5 | Dependencies | Review each target distribution mode and actual license | Treat a scanner or contributor agreement as relicensing authority |
| 6 | Evidence | Source register, clean handoff, SSO decision, dependency record | Anonymous notes or retained raw source material |

Stop after contamination, discard unmerged output, and restart from an unexposed source-free handoff. Preserve attribution and access provenance while excluding source expression. Escalate unclear rights, access terms, reverse-engineering limits, interoperability exceptions, contributor authority, or distribution compatibility to qualified legal review.

## Must-Reads for This Path

- [IP governance](../../docs/legal/IP_GOVERNANCE.md) and the target's actual license.

## Anti-Patterns (Forbidden on These Paths)

Do not launder third-party rights through a contributor agreement or remove
attribution to hide external influence.

## Verification

Verification is target-specific: inspect the provenance record, SSO/AFC review, dependency lock or manifest changes, required notices, and the target's configured license checks. Never invent a universal license command.

Run target checks from the resolved clone or task-worktree Cwd. Retain reusable,
source-free findings in cockpit `knowledge/`; keep project-specific plans,
backlog, and notes in the selected clone.

## Related

- [Clean-room workflow](../../.agents/skills/ip-clean-room/SKILL.md)
- [Research workflow](../../.agents/skills/agentic-research/SKILL.md)
