---
name: implement-tasks
description: "Execute or resume an approved implementation triad, including child worktree topology, test-first slices, failure triage, verified commits and authorized PR handoff; not for authoring or reviewing a plan."
type: workflow
enforcement: suggest
priority: high
---

# Execute Approved Tasks

Read the [root contract](../../../AGENTS.md), selected
[configuration](../../../docs/PROJECT_CONFIGURATION.md) and
[target workflow](../../../docs/TARGET_WORKFLOW.md). Discover the target's own
root/scoped instructions and relevant native skills before implementation.
Use both target and cockpit guidance; target rules win overlapping conflicts.
Read the sole task's `context.md`, active task and referenced plan section.

## Execution Boundaries

Planning starts in the configured clone at
`repos/<project>/dev/active/<task>/{plan,tasks,context}.md`.
In-tree execution stays there. Isolated execution moves the whole owned task
folder into `repos/<project>/.worktrees/<task>/dev/active/<task>/`.
Keep one authoritative triad; never leave a competing copy or use cockpit-root
`dev/`. Shared workflows, ethical reports and `knowledge/` remain in the cockpit.

Resolve `project.yaml` and validate the independent child repository and real
path before side effects. Child commands use **Cwd: `repos/<project>`** or the
explicitly validated worktree, never cockpit root. Commands are child-relative,
with no second `cd repos/...`. A null command is unavailable, not passed.

Before any planning write or task move, resolve shared `info/exclude` with
`git rev-parse --path-format=absolute --git-path info/exclude`, preserve existing
entries, and add missing `/.worktrees/` plus exact task paths under
`dev/active/<task>/`, `dev/backlog/<task>/` and `dev/notes/<task>/`. Check for
tracked, index, or content collisions and verify effective exclusions in each
checkout. Do not alter
upstream `.gitignore`, global settings or unrelated local metadata. An overriding
target rule or tracked collision must be resolved before proceeding.

Plan approval authorizes the agreed implementation scope. Check separate
authorization for commits, branch/worktree changes, history rewriting, pushes,
PRs and teardown. Never infer force-push authorization from ordinary publication.

## Four Worktree Topology Cases

| Case | Evidence | Action |
|---|---|---|
| A: Existing isolated worktree | A live task worktree and its sole triad belong to the selected child | Validate common Git directory, branch, exclusion and current guidance; resume without recreating it |
| B: In-tree work in progress | User selected the existing child checkout or an in-flight task already uses it | Resume at `repos/<project>` without switching branches |
| C: Fresh isolated execution | Approved clone-local plan and authorization to create a worktree | Create clone-relative `.worktrees/<task>/` from the configured base, verify it, then move the sole task folder into it |
| D: Multi-cohort hub and spokes | Large migration with disjoint literal path ownership | Use a task hub and `.worktrees/<task>--<cohort>/` spokes; retain the sole authoritative triad in the hub |

Use configured `git.worktree_path`, resolved against the clone, never the cockpit
or a spoke. Read `git.main_branch` and `git.pr_base`; never assume a branch name.
Record cockpit root, clone root, execution root, task path, base revision, branch,
common Git directory and exact selected instruction/skill paths in context.
Record project identity and task slug as separate context fields; the task-local
directory name contains only the task slug.

Verify the destination is absent before moving the whole task directory,
including evidence. Compare contents, confirm the original task path is absent,
and repair cross-root links. If setup fails, leave the clone triad untouched.
If a move is interrupted or both copies exist, reconcile actual evidence before
editing; do not overwrite, recreate or delete a ledger by assumption.

Inspect only task-relevant worktree metadata. Do not read, prune or modify
unrelated worktree contents. In Case D, bound live workers to 3–5, assign disjoint
literal file lists, migrate leaves before callers, and integrate in dependency
order. Remove an integrated spoke only with cleanup authorization after checking
for uncommitted/unpublished work. Park the hub while review/CI remains active.

Read child-local overrides in their existing location. Do not copy cockpit
overrides into upstream code. If a child needs a local worktree override, follow
its own documented mechanism and check that it cannot be staged accidentally.

Refresh applicable instructions and native skills from the actual worktree
revision before edits; it may differ from the clone's branch. Every delegated
worker receives those exact paths, resolved precedence, Cwd and owned scope.

## Resume And Rolling Context

1. Resolve this task's clone/worktree locations. Resume the sole triad where it
   actually lives; do not infer movement from worktree existence. Read its compact
   context, current task and relevant plan section. Read future phase contracts
   only when dependencies or uncertainty require it.
2. Inspect child status and recent history before changing it. Preserve unrelated
   index/worktree changes. Reuse a captured unchanged baseline.
3. Select the first open approved task. Update its state immediately when it
   changes; do not accumulate false unfinished statuses until phase end.
4. Keep context below 300 lines and 15 KB. Replace completed cohorts with one-line
   checkpoints; retain approvals, blockers and failed gates. Git records commits.
5. Do not inflate the plan with unrelated discoveries. Record them as findings or
   bounded backlog work; request a decision for material scope changes.

## Phase Cadence

- **Red:** reproduce the behavior and add the smallest invariant/regression test
  at the public seam. A compiler failure is not behavioral Red. Pure prose and
  non-behavioral changes use their relevant validation, not invented product tests.
- **Green:** implement the smallest correct change at the owning boundary.
- **Refactor:** remove incidental duplication while preserving behavior.
- **Ring 1:** run the relevant deterministic in-memory slice using the target's
  actual test command/filter. Aim below two seconds; avoid network/container lag.
- **Ring 2:** run the touched build and relevant integration against one canonical
  provider. Aim below fifteen seconds; do not repeat a full provider matrix.
- **Close:** inspect the diff and reconcile task status. If commits are authorized,
  execute the truthful declarative commit contract over owned paths only. Otherwise
  retain a verified uncommitted increment and state that accurately.

Use [conventional-commit](../conventional-commit/SKILL.md) to author or materially
revise a commit contract. Do not assume a hook, trailer policy or release validator
exists. Inspect the child's actual policy.

## Three-Tier Failure Triage

| Class | Meaning | Response |
|---|---|---|
| A: Direct regression | Changed behavior or owned code fails | Fix within this phase before closure |
| B: Induced ripple | Changed contract breaks an unchanged caller or fixture | Align bounded dependencies; use a Decision Brief for cross-domain scope |
| C: Baseline rot | Same failure reproduced at untouched target base | Record exact command, base, failure and evidence; quarantine unrelated repair |

Reproduce baseline failures in a separate permitted workspace; do not switch the
user's checkout. Never call an uninvestigated failure pre-existing. More than ten
failures triggers root-cause clustering rather than ten unrelated repair tasks.
If widespread failures reveal an architectural mismatch, present the exact choice.

## Graduation And Plan Exit

Promote evidenced reusable lessons to cockpit `knowledge/`. Project deferrals
and notes remain locally excluded in clone-relative
`dev/backlog/<task>/` and `dev/notes/<task>/`, respectively.
Target-required architectural records are normal tracked project artifacts.
Do not stage private task files, shared cockpit files or unrelated work.

Run relevant Ring 3 full suites, provider/schema checks, architecture checks and
the real surface once after implementation. Re-run only affected checks if a
subsequent integration change invalidates evidence. Before a base update, inspect
the child's merge/rebase policy and obtain necessary history-change authorization.
Resolve conflicts semantically; regenerate generated artifacts using their owner.

## PR And Parked Worktree Lifecycle

When publication is authorized, use configured `git.pr_base`/`git.pr_command`
and the child's PR template. Report actual user, security, migration, configuration
and operator impacts where applicable. Do not invent a mandatory CI validator.
Inspect staged paths and commit history before an ordinary push; never add
`--force-with-lease` by default.

Keep the worktree intact while CI/review is pending. Watch actual checks when the
harness supports subscriptions. A PR being open is not evidence that checks pass.
Before authorized cleanup, inventory ignored task files and evidence as well as
tracked/untracked code. Normally move the retained triad back to its original
excluded clone-local location, checking for collisions first; explicit disposal
authorization may replace retention. Preserve project notes and graduate shared
knowledge before removal. Clean Git status is not permission to lose ignored
material. Never force-remove a worktree to bypass an unexplained state.

## Human Handoff And Verification

Present a self-contained Decision Brief for unresolved architecture, scope or
authorization. If work spans more than three independent domains, propose a
coherent split rather than silently dropping remaining scope.

Final evidence separates delivered features, necessary integration repairs and
quarantined baseline issues. Include exact checks/Cwd/results, outstanding gates,
PR URL when applicable, and parked worktree location. Stop only when the requested
outcome and its checks hold, or clearly identify an external blocker.

## Related

- [Planning](../implementation-plan/SKILL.md)
- [Independent CTO review](../senior-cto-feedback/SKILL.md)
- [Knowledge graduation](../finding/SKILL.md)
