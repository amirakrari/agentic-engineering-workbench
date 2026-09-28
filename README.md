# Portable Agentic Cockpit

A personal workspace for disciplined contributions to independent repositories.
The cockpit versions reusable engineering workflows and durable lessons.
Project plans and reviews live locally with the target, excluded from upstream
commits through repository-local Git metadata.

## Start a contribution

1. Clone the target into `repos/<project-name>/`, with its own Git repository.
2. Discover its instructions and relevant native skills, then fill [project.yaml](project.yaml)
   using [the configuration contract](docs/PROJECT_CONFIGURATION.md). The shipped
   configuration is intentionally inactive; no target is selected for you.
3. Start your agent from this cockpit root, not from a sibling project.
4. Load [AGENTS.md](AGENTS.md) and follow [target discovery](docs/TARGET_WORKFLOW.md).
   Use target and cockpit skills together; target rules win overlapping conflicts.
5. Before planning writes, verify local exclusions for the task
   folder. Do not change the target's tracked `.gitignore`.

```bash
# Run from this cockpit root, replacing the example URL/name.
git clone https://github.com/owner/project.git repos/project
# Edit project.yaml using the child's actual commands, then start your harness.
```

Example request:

> Read `AGENTS.md` and `.agents/skills/implementation-plan/SKILL.md`. We are
> contributing to `repos/project/`. Evaluate this feature with `i-vsd`, then
> discover the project's instructions and native skills, then plan pagination in
> `repos/project/dev/active/pagination/`. Locally exclude the task files
> before writing them. Follow target guidance over conflicting cockpit defaults.

## Engineering lifecycle

1. **Ethical framing:** `i-vsd` records stakeholders, values and trade-offs.
2. **Planning:** `implementation-plan` creates `plan.md`, `tasks.md`, `context.md`.
3. **Independent review:** a fresh `senior-cto-feedback` session challenges the
   plan without sharing the planner's conversational assumptions.
4. **Implementation:** `implement-tasks` follows approved scope, verifies real
   behavior and applies risk-scaled review.
5. **Graduation:** `finding` promotes durable lessons into the journal and
   canonical guidance; transient progress stays in the task context.

Target code lives in `repos/`; triads start in the target's
`dev/active/<task>/`. Isolated execution moves the whole task directory
into `repos/<project>/.worktrees/<task>/dev/active/<task>/`.
In-tree execution leaves it in the clone. There is no cockpit-root `dev/`.
Ethical evaluations live in `islamic-value-sensitive-design/`. Reusable findings
live in `knowledge/`; project backlog and notes stay locally excluded in the
configured clone. Optional stack references are under `.agents/templates/`
and do not impose an architecture on a target.

## Keep upstream contributions clean

The parent ignores `repos/*` except its empty directory marker. Each child uses
its shared `info/exclude` for `/.worktrees/` and exact task directories under
`dev/active/`, `dev/backlog/` and `dev/notes/`. Resolve that file using
`git rev-parse --path-format=absolute --git-path info/exclude`; linked worktrees
share it. Preserve existing rules and verify effective exclusion.

Ignore rules do not untrack existing files or prevent forced staging. Check for
collisions before writing and inspect the staged diff before commits. Keep
maintainer-required documentation tracked; do not blanket-ignore upstream docs,
skills or all of `dev/`.

```bash
git -C repos/project rev-parse --show-toplevel
git -C repos/project diff --cached --stat
# Only after the user authorizes publication:
git -C repos/project push origin feat/pagination
```

Do not run target builds, tests or Git operations at the cockpit root. Commands
in `project.yaml` are relative to the explicit child working directory, not
another nested `cd`. On resume, locate the sole triad in clone or worktree.
Before authorized cleanup, retain ignored task material, normally by moving it
back to its clone-local path. A clean status does not make ignored files disposable.

## Harness support

`AGENTS.md` is canonical. `CLAUDE.md`, `.cursorrules` and
`.github/copilot-instructions.md` are small entrypoints; `.omo/rules/` mirrors
canonical rules for OmO. Native skill discovery is not identical across tools:
read `.agents/skills/<name>/SKILL.md` explicitly when it is absent from the
catalog. Do not install global settings or copy cockpit files into child repos.
See [research and capability boundaries](docs/RESEARCH.md).

## Reference

- [Visual architecture and workflow](docs/AGENTIC_CONTEXT_ENGINEERING.md)
- [Context budgets and retrieval](.agents/CONTEXT_ENGINEERING.md)
- [Intent registry](.agents/contract/intents.yaml)
- [Agent roles](.agents/agents/README.md)
- [Operations and verification](docs/OPERATIONS.md)
- [Target discovery, local exclusions and worktree lifecycle](docs/TARGET_WORKFLOW.md)
- [Extraction decisions and evidence](docs/EXTRACTION_AUDIT.md)

This is a documentation-driven cockpit, not an autonomous daemon or an installed
toolchain. It does not select a license for your code or supersede a target's
own security, release or contribution rules.
