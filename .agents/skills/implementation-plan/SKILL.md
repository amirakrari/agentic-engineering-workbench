---
name: implementation-plan
description: "Create, update or re-baseline an evidence-grounded implementation, technical or refactor plan and its target-local dev-doc triad; not for an informal proposal, product PRD or review of an existing plan."
type: workflow
enforcement: block
priority: high
---

# Implementation Planning

Read [AGENTS.md](../../../AGENTS.md), the selected
[project configuration](../../../docs/PROJECT_CONFIGURATION.md), the target's
own instructions and relevant native skills through
[target discovery](../../../docs/TARGET_WORKFLOW.md). Resolve target routing
first, add compatible cockpit workflows and give target rules priority over
overlapping conflicts. Reuse evidence already loaded at the same revision.

## Planning Contract

1. **Separate planning from execution.** Planning never creates/switches branches,
   creates worktrees, pulls, commits, pushes or opens a PR. It does not edit
   product code. It may establish narrowly scoped local `info/exclude` rules
   after ownership checks. Later implementation owns execution topology.
2. **Keep one target-local triad.** Write clone-relative
   `dev/active/<task>/{plan,tasks,context}.md` only after checking tracked
   collisions and effective local exclusions. An existing worktree task is
   refined where it lives; do not create a duplicate clone copy. Execution later
   moves the whole task directory to clone-local
   `.worktrees/<task>/dev/active/<task>/`.
   Record clone/execution/cockpit roots and root-qualified references.
3. **Integrate ethical framing.** Use [i-vsd](../i-vsd/SKILL.md) in planning mode
   with one shared repository evidence packet. Resolve material decisions using
   [grill-me](../grill-me/SKILL.md), then revalidate stable `IVSD-*` mappings
   against the completed triad before declaring the report plan-aligned.
4. **Evidence before proposals.** Verify claimed paths, symbols, tests, routes,
   settings and configured branch refs. Distinguish facts, decisions, assumptions,
   unknowns and proposed new files. Use graph/LSP when available, bounded search
   otherwise; no graph installation is required.
5. **Behavior before code structure.** Declare Behavioral or Non-Behavioral Delta.
   Observable requirements use SHALL/MUST and WHEN/THEN scenarios. Proposed
   classes/libraries belong in Architecture, not in the behavior contract.
6. **Invariant-first slicing.** Plan failing tests before changed domain,
   concurrency, state-machine and authority behavior. Tests protect public
   seams, not private call counts or framework mechanics. Pure prose gets
   schema/link/format validation, not product tests.
7. **Progressive verification.** Ring 1 uses configured deterministic unit slices;
   Ring 2 uses the touched build and one relevant integration provider; Ring 3
   covers the required final matrix and observable entrypoint. Use actual
   `commands.*` values without inherited flags. Null checks require a reason.
   Quarantine unrelated baseline rot only after reproduction.
8. **Compatibility is target-owned.** Greenfield freedom must be evidenced;
   never impose deletion or compatibility shims. Identify public contracts,
   migration/recovery needs, affected callers and relevant user/operator docs.
9. **Close material questions.** Questions that change scope, architecture or
   task sequencing cannot be deferred. Section 2.6 may retain genuinely
   deferrable details with owner, trigger and consequence.
10. **Plan declarative commits.** Each verified increment has a truthful title,
    rationale, release treatment, target-required trailers and exact owned paths.
    Use [conventional-commit](../conventional-commit/SKILL.md). Split independently
    reviewable outcomes; retain an indivisible generated set with its source.
    A planned contract is not an automatic grant of commit/publication permission.
11. **Graduate knowledge deliberately.** Reusable lessons belong in cockpit
    `knowledge/`; project backlog/notes stay locally excluded in the configured
    clone. Target-required architecture records remain tracked project work.
    Preserve ignored task material before authorized worktree cleanup; never
    stage it with code or assume it can be discarded.

## Triad Responsibilities

| File | Owns | Excludes |
|---|---|---|
| `plan.md` | Current state, behavior, architecture, decisions, risks, phase acceptance | Granular checkboxes and ephemeral execution progress |
| `tasks.md` | Executable slices, dependencies, verification and commit contracts | Long design discussion or duplicate context |
| `context.md` | Current state, approval, blockers, evidence and next action | Raw logs, source dumps and commit-history copies |

The task ledger changes when task state changes. Keep context below 300 lines and
15 KB; use one-line completed checkpoints and durable source links.

## Workflow And Resources

1. Discover target instructions and matching native/cockpit skills, then inspect
   current target state without changing Git topology. Consult
   [investigation workflow](resources/investigation-workflow.md) for evidence gaps.
2. Classify risk, share evidence with ethical/intake skills and resolve decisions.
   Use [robin-neutral](../robin-neutral/SKILL.md) only for a real architectural fork.
3. Author the plan from [plan template](resources/plan-template.md).
4. Author tasks/context from [operational artifacts](resources/operational-artifacts.md).
5. Reconcile I-VSD mappings, paths, risk, scope and approvals; apply
   [quality gates](resources/quality-gates.md). The [resource index](resources/index.md)
   routes additional detail, not an instruction to load everything at once.
6. Present the plan in a self-contained brief with architecture, phases, key
   trade-offs, worst break, risks and the exact next decision. Do not claim
   implementation has started.

## Anti-Patterns

Memory-based current-state claims, future-state-first design, behavior/code
conflation, non-deferrable question debt, mock-mirroring, automatic greenfield
deletion, premature full matrices, stale task checkboxes, triad duplication,
umbrella commits, script-generated commit packets and planning-time worktrees
are defects. Do not exclude necessary real-surface verification from the final
gate merely to make the plan faster.

## Optional Harness Integration

A harness planning mode may interview or consult reviewers, but its temporary
state is not a competing plan. Point it at the same target-local triad. Verify actual
capabilities instead of assuming named agents, slash commands or hooks exist.

## Verification

Check source-backed paths, internal links, metadata, coherent acceptance and
triad responsibilities. Planning does not run the future product suite. Changes
to this skill use documentation/schema checks and `git diff --check`.

## Related

- [Implementation](../implement-tasks/SKILL.md)
- [Independent CTO review](../senior-cto-feedback/SKILL.md)
- [Skill authoring](../skill-authoring/SKILL.md)
