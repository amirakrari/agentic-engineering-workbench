---
name: work-criticality-matrix
description: Scale intake, exploration, verification, and independent review to work criticality.
paths:
  - "repos/**/*"
  - "repos/*/.worktrees/*/**/*"
  - "repos/*/dev/active/**/*"
  - "repos/*/.worktrees/*/dev/active/**/*"
  - ".agents/contract/intents.yaml"
related_docs:
  - docs/AGENTIC_CONTEXT_ENGINEERING.md
  - docs/QUICK_REFERENCE.md
  - docs/OPERATIONS.md
related_skills: [criticality-guardrail, grill-me, epistemic-mad-review]
minimum_tests: [invariant-breakers, real-surface]
related_intents: [add-feature, security-change, privacy-change, payment-sovereign]
---

# Dynamic Work Criticality Matrix

> **Applies to:** child changes and cockpit intent classification.
> **Authority:** [Quick Reference](../../docs/QUICK_REFERENCE.md) and target risk policy.

## Rules

| # | Rule | Correct | Wrong |
|---|---|---|---|
| 1 | Tier selection | Highest implicated risk | Infer risk only from file extension |
| 2 | Intake | Resolve missing authority decisions | Repeat already answered questions |
| 3 | Exploration | Trace sensitive end-to-end effects | Assume a local edit has no callers |
| 4 | Tests | Break the relevant invariant | Test only a happy path |
| 5 | Review | Independent evidence-based challenge | Call self-review independent debate |

Use the highest level implicated by a change:

| Level | Scope | Required posture |
|---|---|---|
| 0 Sovereign | Money, safety, irreversible authority | Adversarial intake, exhaustive flow/lock/retry tracing, real-boundary invariant breakers, independent specialist review |
| 1 Security | Authentication, authorization, secrets, trust boundaries | Threat model, fail-closed/spoofing/replay tests, independent security review |
| 2 Privacy | Personal data, retention, erasure, export, telemetry | Data/sink tracing, anti-resurrection/redaction/purge tests, independent privacy review |
| 3 Domain state | Business rules, state machines, persistence contracts | Clarify material ambiguity, bounded caller/state tracing, behavioral integration, peer review |
| 4 Standard UI/docs | Presentation, style, prose, agent context | Local reading, autonomous defaults, render/schema/link checks, lightweight review |

Graph tooling is preferred for high-level impact analysis when available, but search and language tooling are the supported fallback. Criticality scales rigor without overriding child rules or requiring unavailable tools.

## Must-Reads for This Path

- [Intent registry](../../.agents/contract/intents.yaml), selected entry only.
- [Criticality guardrail](../../.agents/skills/criticality-guardrail/SKILL.md).

## Anti-Patterns (Forbidden on These Paths)

Forbidden: treating all work uniformly; happy-path-only security tests; unbounded sensitive telemetry; speculative external side effects; exhaustive ceremony for trivial docs; low-capability review for sovereign/security/privacy changes; or assuming anonymous reads and greenfield compatibility globally.

## Verification

Verification uses the child's configured commands from `project.yaml`, always
with the resolved clone or task-worktree Cwd. For levels 0-2, require
independent review by an appropriate specialist or anonymized multi-agent debate
when the environment supports it; record the actual method rather than claiming
automation.

## Related

- [Debate protocol](../../.agents/skills/epistemic-mad-review/SKILL.md)
- [Operations](../../docs/OPERATIONS.md)
