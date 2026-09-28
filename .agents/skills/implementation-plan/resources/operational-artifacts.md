# Operational Artifacts

The triad path `dev/active/<task>/` is execution-root-relative:
the configured clone during planning/in-tree work, the task worktree after
the whole folder moves. Follow [target workflow](../../../../docs/TARGET_WORKFLOW.md)
for local exclusions, discovery and retention. There is no cockpit-root `dev/`.

## Responsibility Matrix

| Artifact | Owns | Excludes |
|---|---|---|
| `plan.md` | Current state, behavior, architecture, decisions and phase acceptance | Granular task checkboxes and execution logs |
| `tasks.md` | Executable slices, dependencies, state, checks and commit packets | Duplicate design narrative |
| `context.md` | Quick resume, approvals, blockers, evidence and next action | Raw logs, source dumps or commit-history copies |

## Shared Review State

Repeat only the compact state that every session needs:

```text
I-VSD report path and input revision:
I-VSD status/disposition:
CTO review: Not reviewed / Changes required / Approved
User approval: Awaiting / Approved, with scope
Commit/publication authorization: actual instruction or absent
```

The ethical report owns moral analysis; the plan owns technical decisions.
Do not duplicate narratives or invent a separate CTO review artifact.

## Context Template

```markdown
# Descriptive workstream - Context

Last Updated: actual date and timezone

## Quick Resume
- Current outcome:
- Project identity:
- Task slug:
- Selected configuration and revision:
- Cockpit root and configured clone root:
- Child or validated worktree Cwd:
- Active task path, base revision and common Git directory:
- Target instructions and selected target/cockpit skills, with revisions:
- Resolved precedence and verified local exclusion rules:
- Current task and next action:
- Open blockers and approvals:

## Review State
Use the compact shared state above.

## Session Progress
- Completed checkpoints:
- In progress:
- Next:

## Key Files And Responsibilities
Exact parent/child paths, ownership and existing/new status.

## Key Decisions
Concise references to canonical decisions.

## Constraints And Rules
Matched intent, criticality and task-specific constraints.

## Validation Baseline
Commands, Cwd, revision, exit status, evidence and omissions.
Separate proven baseline failures from attributable failures.

## Risks And Unknowns
Current risk, owner and next evidence/decision.

## Handoff
Date, state, next action, modified paths, evidence and unresolved blockers.
```

Keep context below 300 lines and 15 KB. Replace stale progress with concise
checkpoints; promote durable learning rather than building a transcript.

## Tasks Template

```markdown
# Descriptive workstream - Tasks

Last Updated: actual date and timezone

## Status Summary
- Overall status:
- Active phase:
- Review state and authorization:

## Execution Contract
- Read context, current task and referenced plan section.
- Run commands in the configured child or validated worktree.
- Keep one locally excluded triad at the recorded clone/worktree path.
- Keep project backlog/notes in the clone; shared lessons go to cockpit knowledge/.
- Update task state when it changes.
- Record failed checks and their next recovery step.

## Phase: descriptive outcome
Owned paths: exact files, resolved before edits.

- [ ] Author the relevant failing invariant test and observe its expected failure.
  - Acceptance:
  - Dependencies:
  - Files:
- [ ] Implement the behavior and verify the same public seam passes.
  - Acceptance:
  - Dependencies:
  - Files:

### Verification
- Ring 1: relevant deterministic slice using configured filter.
- Ring 2: configured touched build and canonical integration.
- Evidence: command, Cwd, revision, exit status and result.

### Planned Commit Contract
- Type/scope:
- Title:
- Rationale:
- Release treatment and target-required trailers:
- Exact owned paths:
- Authorization:
- Material override reason and replacement contract, if needed:

### Closure
- [ ] Reconcile task state and attributable failures.
- [ ] Commit owned paths if authorized, otherwise retain verified uncommitted work.
- [ ] Confirm no private task files, cockpit artifacts or unrelated work enter the child diff.

## Plan Exit
- [ ] Run relevant Ring 3 checks and real-surface verification.
- [ ] Promote shared lessons to cockpit knowledge/; retain project deferrals in the excluded clone backlog.
- [ ] Preserve ignored task material before authorized worktree cleanup.
- [ ] Report results, gaps and parked worktree/PR state when applicable.
```

Replace illustrative tasks with the actual scope. Pure prose uses documentation
validation rather than fake behavioral tests. Split independent outcomes into
separate commit packets; keep indivisible generated artifacts with their inputs.

## Synchronization And Maintenance

Compare project identity, scope, phases, acceptance, dependencies, risk,
verification, approval and I-VSD mappings across the triad. Any disagreement is
a planning defect.

| Trigger | Update |
|---|---|
| Task opens/completes/blocks | Update its task state immediately |
| Phase verification finishes | Record actual evidence and authorized closure |
| Planned packet becomes false | Record reason and complete replacement packet |
| Material scope/architecture changes | Update plan, then dependent tasks/context |
| Pause or session transfer | Reconcile tasks and compact context handoff |
| Durable lesson or accepted deferral | Shared cockpit knowledge or excluded clone backlog, respectively |

Do not repeat unchanged baseline checks. Resume by current state, not by loading
all three full files indiscriminately. If inherited state is stale, perform one
bounded reconciliation against actual diffs and evidence; do not sweep unrelated
workstreams or absorb their changes.
