# Target Discovery and Local Working State

This is the canonical contract for combining a target's agentic engineering with
the cockpit. The cockpit owns reusable workflow and cross-project knowledge.
The target owns its code and local task state. This is an agent-executed procedure,
not an installed runner, sandbox, hook or automatic skill loader.

## Instruction and Skill Discovery

Before planning or modifying a contribution:

1. Resolve the selected configuration and validate the independent clone at
   `repos/<project>`. Record its real root, current revision and dirty state.
2. Read the target's root `AGENTS.md`, `CLAUDE.md`, README and CONTRIBUTING files
   when present. Follow their relevant documentation and instruction pointers,
   including configured harness instructions. Absence is recorded, not filled
   with assumptions about this cockpit.
3. Before touching a path, load its applicable nested instructions and scoped
   rules. Follow the target's declared precedence; more-specific path rules apply
   within their scope. There is no universal AGENTS-versus-CLAUDE tie-breaker.
4. Discover native skill catalogs through target instructions and existing
   directories such as `.agents/skills/`, `.claude/skills/` and `.github/skills/`.
   Inspect names/descriptions or indexes first. Load only relevant skill routers
   and the resources needed for the current decision.
5. Select relevant cockpit workflows alongside those target skills. Record exact
   file paths and revisions: an unqualified skill name or slash command does not
   prove which repository's skill was loaded. Same-named skills must not create
   duplicate plans or competing execution ledgers.
6. For overlapping instructions about work in the target, **target guidance wins**.
   Keep compatible cockpit guidance active and record the resolution; do not ask
   the user to decide this already-settled precedence. Ask only for genuine
   ambiguity, such as contradictory target instructions or missing user scope.

Explicit user scope and higher-priority harness instructions still govern. Target
instructions do not authorize unrelated repositories, publication or destructive
actions. Required upstream artifacts remain tracked project work; do not hide
them as personal notes. If target requirements conflict with the default layout
below, use the target's permitted layout and record the actual paths.

Repeat discovery for changed instruction/skill revisions after entering a
worktree, switching an explicitly authorized branch, or resuming stale context.
Delegate the resolved execution root, scope, target instruction paths, selected
skill paths and precedence decisions. Every worker remains bound to them.

## Visible Target Repository Discovery

`repos/` is intentionally not ignored. This keeps target files available to
editor trees, fuzzy search, workspace indexes, attachment pickers, and chat
`@` mentions. Never hide the directory globally or through the workbench's Git
ignore rules merely to clean parent status output.

Resolve targets independently of editor and ignore-aware indexes:

1. When `project.yaml` is `ready`, validate its exact configured target first.
2. Otherwise enumerate immediate directories directly:

   ```bash
   find repos -mindepth 1 -maxdepth 1 -type d -print
   ```

3. Keep only candidates where `git -C <candidate> rev-parse --show-toplevel`
   resolves to that candidate's real path. Reject parent fallback, symlink escape,
   non-repositories, and internal task worktrees presented as target clones.
4. Record local directory, origin URL when available, remote owner/repository
   identity, current branch, and discovered root instructions.
5. Match user wording against the exact local directory, remote repository name,
   and `owner/repository`. Select one unambiguous candidate.
6. If several candidates match—or the user refers only to a duplicated remote
   repository name—show the concise candidates and ask once.
7. Persist the selected local path in `project.yaml`; users should not repeatedly
   paste relative paths after setup.

Never conclude that no target exists because a Git-aware glob, repository search,
language server, graph, or harness index omitted nested repositories. Direct
filesystem enumeration and child-Git validation are authoritative.

## Path Ownership

`project` is `target.name`; `task` is a stable lowercase kebab-case slug, not a
branch path or arbitrary shell text. Reject traversal, separators, glob characters
and collisions when resolving names. The containing clone already provides the
project namespace, so target-local task directories use the task slug alone.

| Artifact | Default location and path base |
|---|---|
| Planning triad | Clone-relative `dev/active/<task>/{plan,tasks,context}.md` |
| In-tree execution triad | Same clone-relative location; no move |
| Isolated worktree | Clone-relative `.worktrees/<task>/` |
| Worktree execution triad | Worktree-relative `dev/active/<task>/` |
| Project backlog | Clone-relative `dev/backlog/<task>/` |
| Project investigative notes | Clone-relative `dev/notes/<task>/` |
| Reusable journal | Cockpit-relative `knowledge/` |
| Ethical evaluations | Cockpit-relative `islamic-value-sensitive-design/`; planning reports use `workstreams/i-vsd-<project>-<task>.md` |

There is no cockpit-root `dev/`. Backlog and notes remain in the configured clone
so they survive worktree cleanup. Evidence tied to execution may live inside the
active task folder and moves with it.

Record cockpit root, configured clone root, execution root, active task path,
configuration revision, branch/base and Git common directory in `context.md`.
Keep code references execution-root-relative and cockpit references explicitly
cockpit-relative. For example, `target:src/module` and `cockpit:docs/GOVERNANCE.md`
are root-qualified reference conventions, not installed URI handlers.
Sibling links such as `plan.md` survive a move; rebase actual relative links that
cross these roots. Do not change an ethical report's reviewed revision merely
because its link location changed.

## Local Exclusions Before Writing

Resolve the repository's shared exclusion file instead of assuming `.git` is a
directory in the checkout:

```bash
# Run in the selected clone or its validated worktree.
git rev-parse --path-format=absolute --git-path info/exclude
```

Read and preserve the existing file. Add only missing, task-owned rules using
native editing tools. An example for project `widget`, task `pagination`:

```gitignore
/.worktrees/
/dev/active/pagination/
/dev/backlog/pagination/
/dev/notes/pagination/
```

These are local Git metadata, shared by linked worktrees of the selected clone.
Never modify the target's tracked `.gitignore`, global excludes or unrelated
metadata merely to install cockpit hygiene. Planning may establish these narrowly
scoped exclusions; it still does not create/switch branches or create worktrees.

Before creating task files or moving a triad:

- Verify the selected repository and common directory belong to the intended
  clone; reject symlink escapes and a missing child that falls back to parent Git.
- Check the proposed paths for tracked/index entries and existing unrelated
  content. Ignore rules do not untrack files. Do not untrack or overwrite a
  collision; resolve it under target policy.
- Inspect effective rules with `git check-ignore -v`. Confirm representative
  task files do not appear in `git ls-files --others --exclude-standard`.
  Target `.gitignore` negations can override local exclusions; if so, do not
  silently write exposed notes or edit upstream rules to compensate.
- Check `git status` and staged paths from both clone and worktree. No personal
  notes or worktree contents may enter a normal contribution. Never force-add
  them. Exclusion is not a security boundary or a guarantee against explicit
  force staging.

Use exact task paths rather than blanket exclusions for the target's whole
`dev/`, `.agents/`, documentation or native skills.

## Setup and the Single-Triad Move

1. Discover target guidance and establish local exclusions before planning writes
   the triad in the clone. Pin the selected configuration and commands.
2. At authorized isolated execution, create the worktree beneath the configured
   clone using the actual configured base and target branch policy. Keep the
   main checkout on its existing branch.
3. Validate the worktree's root, branch, common Git directory, instructions,
   skill revisions, destination ownership and effective exclusions.
4. Move the **whole owned task directory**, including evidence, from clone to
   worktree. Do not copy it or move only the three Markdown files. Never replace
   an existing destination. Verify the destination contents match, the source
   task folder is absent, and root-crossing references still resolve.
5. Update execution root/path state in the moved context. Run target commands
   in the worktree; backlog/notes continue to use their recorded clone root.

If worktree setup or exclusion checks fail, leave the original triad untouched.
If a move is interrupted, inspect both paths and actual contents before recovery.
Never infer success from the worktree's existence or delete one copy blindly.

## Resume and Multiple Workers

Inspect only this task's clone/worktree locations and relevant Git metadata:

- Worktree and sole worktree triad present: validate and resume there.
- Only clone triad present: resume in-tree or finish authorized isolated setup.
- Both task directories present, or neither where expected: reconcile evidence
  before edits. Do not merge or recreate a ledger by assumption.
- Worktree exists but the task folder is still clone-local: distinguish incomplete
  setup from unrelated work, then finish the verified move only if authorized.

For hub-and-spoke work, retain one authoritative triad in the task hub.
Task-prefixed spokes own disjoint code paths and return bounded results to that
ledger; they do not each receive a competing full triad.

## Completion and Cleanup

Park the worktree while review or CI remains active. A clean Git status does not
prove that ignored planning material is disposable.

Before authorized cleanup, account for ignored task files and execution evidence,
move project backlog/notes to their clone-owned locations if needed, and promote
only evidenced reusable lessons into cockpit `knowledge/`. Default to moving the
remaining triad back to its original clone-local task path after checking that
the destination is absent and excluded. Explicitly authorized disposal may replace
that return move; never silently erase it with worktree removal.

Record the retained locations and completion state before removing a worktree.
Preserve unrelated ignored files, unpublished work and other tasks. Do not use
force removal as a substitute for understanding what remains.

Planning re-baselines and CTO re-review use the same resume resolution as
implementation: refine the sole existing clone/worktree triad in place. Never
recreate its original clone path merely because the task moved.

## Evidence and References

Capture actual roots, common-directory identity, exclusion source, tracked-path
checks, before/after task locations, staged-diff results and instruction/skill
selection in the task context. Do not claim an automatic enforcement mechanism.

- [Git ignore precedence](https://git-scm.com/docs/gitignore)
- [Shared Git repository metadata](https://git-scm.com/docs/gitrepository-layout)
- [Configuration contract](PROJECT_CONFIGURATION.md)
- [Execution skill](../.agents/skills/implement-tasks/SKILL.md)
