---
name: tests
description: Apply when editing unit, integration, architecture, system, or end-to-end tests in a child repository.
paths:
  - "repos/**/test/**/*"
  - "repos/**/tests/**/*"
  - "repos/**/__tests__/**/*"
  - "repos/**/spec/**/*"
  - "repos/**/e2e/**/*"
  - "repos/**/*[Tt]est*.*"
  - "repos/**/*[Ss]pec*.*"
  - "repos/**/*.feature"
  - "repos/*/.worktrees/*/**/test/**/*"
  - "repos/*/.worktrees/*/**/tests/**/*"
  - "repos/*/.worktrees/*/**/__tests__/**/*"
  - "repos/*/.worktrees/*/**/spec/**/*"
  - "repos/*/.worktrees/*/**/e2e/**/*"
  - "repos/*/.worktrees/*/**/*[Tt]est*.*"
  - "repos/*/.worktrees/*/**/*[Ss]pec*.*"
  - "repos/*/.worktrees/*/**/*.feature"
related_docs:
  - docs/AGENTIC_CONTEXT_ENGINEERING.md
  - docs/QUICK_REFERENCE.md
  - docs/OPERATIONS.md
related_skills: [criticality-guardrail, debug-issue, review-changes]
minimum_tests: [focused-unit, integration, build, real-surface]
related_intents: [add-feature, fix-bug, refactor-code, security-change, privacy-change, payment-sovereign]
---

# Test Rules

> **Applies to:** child test paths matched above.
> **Authority:** [Quick Reference](../../docs/QUICK_REFERENCE.md) and the child's test contract.

## Rules

| # | Rule | Correct | Wrong |
|---|---|---|---|
| 1 | Behavioral seam | Exercise the observable contract | Assert private implementation shape |
| 2 | Determinism | Subscribe before triggering | Sleep until timing happens to work |
| 3 | Independent oracle | Derive expected values from the specification | Repeat the production formula |
| 4 | Integration | Mock external boundaries only | Mock away the behavior under test |
| 5 | Failure evidence | Preserve and classify failures | Skip or weaken a failing assertion |

- **Ring 1:** run the smallest deterministic behavioral slice during a subtask, without avoidable network or container dependencies.
- **Ring 2:** at phase exit run the changed package/module checks and focused integration required by the child.
- **Ring 3:** once at plan exit run the complete child-required architecture, migration, provider, and system checks.
- Write a failing public-seam invariant test before production code. Compilation failure is not a behavioral Red result.
- Derive expected values independently; never duplicate the production formula in the assertion.
- Mock genuine external boundaries only. Do not mock away the integration or domain behavior being asserted.
- Do not bypass the public contract merely to inspect convenient private state.
- Never delete, skip, weaken, or suppress a failing test to obtain green.
- Tests are deterministic. Unless time is under test, fixed sleeps and timing luck are forbidden: subscribe before triggering and await the exact signal with a bounded timeout.
- Test machine-consumed contracts, not governance prose, plans, journals, or documentation wording.
- Before deleting a test, map its invariant to stronger retained coverage or intentionally removed behavior.
- Classify failures as A direct regression, B induced ripple, or C baseline rot. Class C requires reproduction on untouched child base and is quarantined from unrelated work.
- Use commands from `project.yaml` with the resolved clone or task-worktree Cwd.
  A `null` command is reported unavailable.
- Child testing rules and required CI checks prevail over this baseline.

## Must-Reads for This Path

- [Operations](../../docs/OPERATIONS.md) and the selected target's testing instructions.

## Anti-Patterns (Forbidden on These Paths)

Timing luck, mock-mirroring, prose-pinning product tests, and unrelated suite repair.

## Verification

Resolve the relevant checks from [intents](../../.agents/contract/intents.yaml); capture the
actual command, child Cwd, exit code and result. Null commands leave a reason or
an open gate.

## Related

- [Debug issue](../../.agents/skills/debug-issue/SKILL.md)
- [Review changes](../../.agents/skills/review-changes/SKILL.md)
