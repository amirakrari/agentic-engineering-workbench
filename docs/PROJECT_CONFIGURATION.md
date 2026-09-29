# Project configuration

[project.yaml](../project.yaml) selects one target. Its machine-readable schema
is [project.schema.json](../.agents/contract/project.schema.json). This is an
agent-consumed contract, not an installed command runner or permission grant.

## States and fields

The shipped `status: unconfigured` deliberately has no target. Inspect the
cloned child's instructions, native skills, README, manifests and CI through
[target discovery](TARGET_WORKFLOW.md#instruction-and-skill-discovery), fill its
actual values, and set `status: ready`. Do not execute target commands while
unconfigured. Null commands mean unavailable/not applicable; record the reason
in the workstream context. Null never means “passed.”

| Field | Contract |
|---|---|
| `version` | Schema version 1 |
| `target.name` | Exact local clone directory name; letters, digits, `.`, `_`, and `-` are allowed |
| `target.path` | Exactly `repos/` plus the local clone directory name, without trailing slash |
| `target.stack` | Descriptive stack name; does not install tooling |
| `target.lifecycle` | `established` by default; `greenfield` only with explicit target policy |
| `commands` | Reviewed shell commands relative to the selected child Cwd, or null |
| `commands.test_filter` | Runner-specific fragment using `{test_name}`, or null |
| `git.main_branch`, `git.pr_base` | Actual branch names, checked against target refs |
| `git.pr_command` | Optional reviewed PR command; execution still needs authorization |
| `git.worktree_path` | Clone-relative `.worktrees/{task}/`; never cockpit-relative |
| `architecture.layers` | Existing target layers, not a mandate to restructure |
| `architecture.test_suites` | Child-relative suite paths or null |
| `dev_docs.active` | Relative to the selected execution root: `dev/active/{task}/`; clone during planning/in-tree work, worktree after the move |
| `dev_docs.backlog`, `dev_docs.notes` | Always relative to the configured clone; the clone already provides project identity |
| `knowledge` | Cockpit-relative shared reusable journal location |

Commands must not contain a second `cd repos/...`, unresolved placeholders,
credentials or unexplained external writes. Pass a test name as a safely quoted
runner argument rather than evaluating user-supplied shell syntax. Check
runner-specific filtering before combining `test_unit` and `test_filter`.

## Readiness checks

Schema validation checks types, required keys and path syntax. An agent must
also verify filesystem and execution semantics before side effects:

1. If configuration is already `ready`, validate its exact target first. If it
   is unconfigured, enumerate immediate `repos/` directories directly and select
   only an unambiguous independent Git root using
   [target discovery](TARGET_WORKFLOW.md#visible-target-repository-discovery).
2. `target.path` equals `repos/<target.name>` exactly, including case, and its real path stays below this
   cockpit's real `repos/` path. Reject symlink escapes.
3. The directory already exists as an independent clone, not the parent repo
   found by Git's upward search. Compare its real path with
   `git -C repos/<name> rev-parse --show-toplevel`.
4. Discover root/scoped target instructions and relevant native skills, combine
   them with compatible cockpit guidance, and resolve conflicts in favor of
   target requirements. Verify branch refs and local dirty state; do not switch
   or pull automatically.
5. Required commands for this intent are present, safe and relevant. Null checks
   require an explicit not-applicable reason or an open gate, not an invented
   command. Capture Cwd with each result.
6. For worktrees, validate the explicit worktree Cwd and common Git directory
   against the selected clone. Do not change `target.name`. Establish effective
   shared local exclusions before moving the sole clone-local triad into the
   worktree. See [the lifecycle](TARGET_WORKFLOW.md).

The schema does not enforce filesystem containment or shell-command safety.
Do not treat a valid YAML file as proof of either.

## Example: established Python package

This example assumes the child really documents these commands. Substitute
observed commands, never execute it as a universal prescription.

```yaml
version: 1
status: ready
target:
  name: example-package
  path: repos/example-package
  stack: python
  lifecycle: established
commands:
  build: python -m build
  test_unit: pytest tests/unit -x
  test_integration: pytest tests/integration -x
  test_architecture: null
  test_filter: "-k {test_name}"
  lint: ruff check .
  format: ruff format .
git:
  main_branch: main
  pr_base: main
  pr_command: gh pr create --base main
  worktree_path: ".worktrees/{task}/"
architecture:
  layers: [package]
  test_suites:
    unit: tests/unit
    integration: tests/integration
    architecture: null
dev_docs:
  active: "dev/active/{task}/"
  backlog: "dev/backlog/{task}/"
  notes: "dev/notes/{task}/"
knowledge: "knowledge/"
```

## Example: Rust command mapping

For a Rust child, retain the same full schema and replace the relevant fields
with its observed commands, for example `cargo build --release`,
`cargo test --lib`, `cargo test --test integration`,
`cargo clippy --all-targets -- -D warnings`, and `cargo fmt --all`.
A runner filter may be `{test_name}`; validate actual test-target selection.
Do not assume the integration target or an architecture suite exists.

## Concurrent projects

A running workstream pins the selected configuration snapshot and revision in
its clone/worktree-local context. Do not mutate one global active target beneath
another worker. An optional `project.local.yaml` may hold a complete private
configuration selected explicitly by path; it is not automatically merged or
loaded. Other workers must name their own selected configuration and Cwd.
No credentials belong in either file.

## Resolving local working state

For `target.name: widget`, `target.path: repos/widget` and task `pagination`,
planning starts at `repos/widget/dev/active/pagination/`. Isolated
execution moves that whole folder to
`repos/widget/.worktrees/pagination/dev/active/pagination/`.
The clone's `dev/backlog/pagination/` and `dev/notes/pagination/`
remain outside the worktree; `knowledge/` remains in the cockpit.

Project identity remains a separate context/configuration field and is included
where artifacts share a cockpit namespace, such as
`islamic-value-sensitive-design/workstreams/i-vsd-widget-pagination.md`.

The schema describes the cockpit's default layout. Target-required alternatives
are recorded in task context after discovery; do not silently edit upstream
policy to fit these defaults. A repository that forbids private local notes
requires resolving that conflict before notes are written.

Local ignore rules are added to the selected repository's resolved shared
`info/exclude`, never its tracked `.gitignore` or global settings. They do not
make tracked collisions safe. Verify both effective exclusion and staged paths.
