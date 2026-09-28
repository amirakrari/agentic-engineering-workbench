---
name: senior-cto-feedback
description: "Load for Senior CTO critique, architectural audit, risk review, sequencing correction, or refinement of an existing implementation-plan triad; edits the requested plan/context/tasks in place without creating a worktree or review file. Not for open-ended CTO advice, product implementation, or implementation workspace setup."
type: workflow
enforcement: suggest
priority: high
---

## Resources
- [../../../AGENTS.md](../../../AGENTS.md)
- [resources/output-template.md](resources/output-template.md) — load for the chat reporting template and high-signal summary structure.
- [resources/plan-rewrite-guidance.md](resources/plan-rewrite-guidance.md) — load for exact section patterns and triad update rules when rewriting plan.md, context.md, and tasks.md.
- [resources/review-rubric.md](resources/review-rubric.md) — load for 3D scorecard, Socratic stress-testing, and 4-point right-sizing rules.
- [resources/input-contract.md](resources/input-contract.md) — load to verify triad and I-VSD input completeness before editing.
- [resources/severity-model.md](resources/severity-model.md) — load when classifying blocker, critical, or major architectural risks.

## Rules

**Portable authority:** Apply the
[target workflow](../../../docs/TARGET_WORKFLOW.md), resolve the sole existing
triad in the clone or validated task worktree, and refine its execution-root-relative
`dev/active/<task>/{plan,tasks,context}.md` in place. Read evidence and
instructions from that execution root. If both or neither expected task location
exists, reconcile before editing; never recreate a clone copy after a move.
This review never creates a worktree or moves the triad. Child architecture,
lifecycle, licensing, contribution, release, compatibility, and security
policies override cockpit defaults. A graph is optional with bounded LSP/search
fallback. Never force greenfield, public-read, multi-tenant, self-hosting,
commit, push, or PR semantics.

1. **Direct Triad Refinement — In Place Only**: Update the user-requested `plan.md`, `context.md`, and `tasks.md` in their existing location. Do not create worktrees, create or switch branches, relocate planning artifacts, or execute implementation during review. Never write `*-cto-review.md` or separate feedback files.

Review depth is defined in [output-template.md](resources/output-template.md).

2. **Authorized Refinement**: This workflow edits the triad when the user requests refinement. An explicit read-only review request takes precedence; report findings without edits in that case.
3. **Crisp, High-Signal Chat Reporting**: When finishing, report back to the user with a concise, high-signal summary in the chat response following [resources/output-template.md](resources/output-template.md) (decisions made, changes applied to the triad, top risks resolved, and execution readiness). Do not duplicate full files in chat; deliver a clear summary that is not too long, but does not omit essential details.
4. **Follow I-VSD Integration**: Bind updates to exact plan/tasks and I-VSD revisions. If architectural refinements change provider authority, affected stakeholders, or `IVSD-*` mappings, mark the I-VSD report `stale` in the triad metadata and record the revalidation need; do not fabricate approval.
5. **Codebase Reality Over Aspiration**: Distinguish verified codebase reality from plan aspiration. Verify claims against real repository files using `available graph or bounded LSP/search fallback` before codifying them in the triad.
6. **Socratic Stress-Testing & "Worst Break" Catastrophic Scenario**: Identify the single most catastrophic production failure mode. Mandate that Phase Red in `tasks.md` contains dedicated failing invariant tests proving it is prevented before handler implementation.
7. **3-Dimensional Evaluation Model**: Enforce Completeness (capabilities, I-VSD mitigations), Correctness (boundary conditions, concurrency races, negative failure paths), and Coherence (Clean Architecture, server-provided affordances, tenant isolation, transactional outbox).
8. **Invariant-First & Anti-Tautology Verification**: Enforce strict Test-First Invariant order in `tasks.md` (failing Red Phase tests before Green Phase implementation for core domain invariants, concurrency, and security). Prohibit tautological mock-mirroring (`Received(1)` on internal services) or framework boilerplate.
9. **Lifecycle Compatibility Posture**: Apply the child repository's evidenced lifecycle and compatibility policy. Do not introduce or remove compatibility paths by cockpit default.
10. **4-Point "Right-Sizing" Rule**: Propose a PR split when 2+ symptoms match (multi-intent "and also" scope, > 8-10 major tasks, big-bang layer mixing, or independently shippable value). Preserve requested scope until the user accepts a deferral; accepted project backlog stays locally excluded in the configured clone.
11. **Planned Commit Readiness**: Ensure every implementation phase in `tasks.md` has a self-sufficient declarative Conventional Commit contract (or atomic sequence) with exact metadata, paths, inspection commands, `git add`, path-limited `git commit`, and verification. These are instructions for later implementation, not actions to execute during review. Preserve explicit user implementation constraints.
12. **Knowledge Graduation**: Put task-local deferred scope under the configured
clone's `dev/backlog/<task>/`, keep personal notes under its
`dev/notes/<task>/`, put target-required architecture records in the
target's tracked location, and promote reusable cockpit lessons to
`knowledge/journal.md`. Never create a cockpit-root `dev/`.
13. **Zero-Loss Information Preservation**: Eliminating separate review files does NOT mean discarding review intelligence. Every critical finding, 3D evaluation scorecard, Socratic stress-test challenge, ranked risk with minimum acceptable fix, "Worst Break" failure mode, and architectural trade-off MUST be permanently written into its dedicated section in `plan.md` (§0, §2, §5, §7.1, §12, §13/§14.2), `context.md` (Key Decisions, Review State), and `tasks.md` (Phase Red Invariant Tests). Chat output is strictly an executive summary of what is already durably preserved in the triad.

## Workflow

1. **Ingest Triad In Place**: Resolve the exact directory the user requested and read its plan, context, and tasks without changing checkout or branch. Verify architectural claims against actual repository code using `available graph or bounded LSP/search fallback`.
2. **Audit Architecture**: Evaluate against the 3D Scorecard, 4-Point Right-Sizing, Worst Break failure scenario, and the target's actual compatibility policy.
3. **Directly Update Triad**:
   - `plan.md`: Refine architecture, sequence and RFC 2119 scenarios; remove obsolete paths only under target policy. Record actual review status without fabricating user approval.
   - `context.md`: Synchronize active status, next step, key decisions, validation baseline, and blockers.
   - `tasks.md`: Restructure into Test-First Invariant ordering (Red -> Green -> Refactor), right-size phases, embed exact atomic commit contracts.
   - *Never write any `*-cto-review.md` file.*
4. **Report to Chat**: Output the crisp, high-signal summary following [resources/output-template.md](resources/output-template.md) (verdict, decisions made, changes applied across the triad, top risks resolved, and execution readiness).

## Verification

- Confirm no separate `*-cto-review.md` was created beside the sole triad in its
  actual clone/worktree location, and no competing clone triad was recreated.
- Confirm the updated triad remains at the exact requested path and no review branch/worktree was created.
- Validate triad consistency: `plan.md`, `context.md`, and `tasks.md` agree on status, next steps, and phase breakdown.
- Ensure frontmatter adheres to [../_SKILL_SCHEMA.md](../_SKILL_SCHEMA.md).
