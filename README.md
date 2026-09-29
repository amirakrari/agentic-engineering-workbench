# Portable Agentic Cockpit

A personal workspace for disciplined contributions to independent repositories.
The cockpit versions reusable engineering workflows and durable lessons.
Project plans and reviews live locally with the target, excluded from upstream
commits through repository-local Git metadata.

## Context-Agnostic by Design

This repository is an engineering workbench, **not a universal skill bundle**.
Its core must remain useful regardless of the target's language, framework,
vendor, deployment platform, issue tracker, documentation system, or product
domain.

The workbench provides portable process capabilities:

- target instruction and native-skill discovery;
- planning, implementation, debugging, refactoring, and review workflows;
- risk-scaled verification and independent quality gates;
- clean-room research, provenance, and knowledge graduation;
- locally isolated task state and worktree lifecycle rules.

The selected target supplies its own implementation context: domain and
architecture rules, tool skills, build and release commands, integrations, and
product-specific requirements. Target-native guidance takes priority when it
overlaps with a workbench default.

Users can introduce their own skills without modifying the workbench. Tool-,
vendor-, stack-, documentation-platform-, and product-specific skills belong in
the target repository or a separate optional skill catalog—not in the core.

See the canonical
[Context-Agnostic Core Admission Rule](docs/GOVERNANCE.md#context-agnostic-core-admission-rule).
Changes to the workbench itself follow [CONTRIBUTING.md](CONTRIBUTING.md).

## Quick Start

### 1. Clone the workbench

```bash
git clone https://github.com/amirakrari/agentic-engineering-workbench.git
cd agentic-engineering-workbench
```

Start your preferred coding agent from this repository root so it can load the
workbench contract before entering a target.

### 2. Clone the repository you want to contribute to

Enter `repos/` first, then run a normal clone. Git will create the target
directory using the repository's actual name:

```bash
mkdir -p repos
cd repos
git clone https://github.com/OWNER/REPOSITORY.git
cd ..
```

The resulting target path is:

```text
repos/REPOSITORY/
```

`repos/` is intentionally visible and not ignored by the workbench. Editors,
workspace indexes, file pickers, and chat `@` mentions can therefore discover
target files and directories normally.

Do not replace the repository name with a generic directory such as `project`.
The local directory name becomes the workbench target identity.

> **Repository-name collision:** Two repositories from different owners can
> share the same name. A single `repos/` directory cannot contain both under that
> name. Give one clone a unique local directory explicitly:
>
> ```bash
> cd repos
> git clone https://github.com/SECOND_OWNER/REPOSITORY.git second-owner-repository
> cd ..
> ```
>
> The unique local directory—not the remote's basename—then becomes the target
> name and `project.yaml` path.

### 3. Ask the agent to configure the target

Do not manually reverse-engineer or fill `project.yaml`. Copy this prompt into
your coding-agent chat from the workbench root:

```text
Set up this Agentic Engineering Workbench for the repository I just cloned under
`repos/`.

This is setup only. Do not modify product code, create or switch branches or
worktrees, commit, push, publish, or write to external systems.

1. Read `AGENTS.md`, `docs/TARGET_WORKFLOW.md`,
   `docs/PROJECT_CONFIGURATION.md`, and the shipped `project.yaml`.
2. Enumerate immediate directories under `repos/` directly; do not rely on a
   Git index, ignore-aware search, workspace index, or cached graph. Keep only
   candidates whose own Git top level equals that directory.
3. For each candidate, record its local directory, origin URL when available,
   owner/repository identity, current branch, and root instruction files.
4. If `project.yaml` is already `ready`, validate its exact target first. If it
   is unconfigured, match my wording and the newly cloned repository against the
   candidate directory and remote identity. Select the only unambiguous match;
   otherwise show the concise candidate list and ask me once.
5. Validate that the selected target is an independent Git repository contained
   beneath `repos/`.
6. Read its applicable `AGENTS.md`, `CLAUDE.md`, `README`, `CONTRIBUTING`,
   nested/path-scoped instructions, and referenced contributor documentation.
7. Discover its native skill catalogs by metadata and load only skills relevant
   to repository setup. Target guidance overrides conflicting workbench defaults.
8. Determine from repository evidence:
   - the local target name and `repos/<directory>` path;
   - stack and lifecycle;
   - actual build, unit-test, integration-test, architecture-test, lint, format,
     and test-filter commands;
   - main branch, pull-request base, and optional PR command;
   - established architecture layers and test-suite paths.
9. Update the root `project.yaml`. Use `null` for unsupported or genuinely
   undiscoverable commands; do not invent commands or values.
10. Set `status: ready` only after required fields, repository identity, branch
   refs, command working directory, and schema validation pass.
11. Report the selected target, evidence sources, configured commands, null fields
   with reasons, and any unresolved setup blockers. Then stop.
```

The agent should leave product code and Git topology unchanged. Once setup
passes, ask it to plan or implement the contribution you actually want.

Example follow-up:

> Use the configured target. Discover its current instructions and relevant
> native skills, then evaluate and plan pagination under
> `dev/active/pagination/`. Follow target guidance over conflicting workbench
> defaults and establish local exclusions before writing private task files.

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

## Keep targets visible and contributions separate

Target repositories under `repos/` are intentionally visible to editors, search,
and chat `@` mentions. They remain independent Git repositories; every target
build, test, staging, commit, and push operation uses the child as Cwd or
`git -C repos/REPOSITORY`.

Visibility means the workbench parent may show nested targets as untracked. Never
use `git add .`, `git add -A`, or force-add from the workbench root while targets
are present. Workbench contributions stage exact paths and must pass:

```bash
bash eng/check-workbench-staging.sh
```

The guard rejects every added, copied, modified, renamed, type-changed, unmerged,
or otherwise staged path under `repos/`. No target repository or gitlink belongs
in workbench history. See [CONTRIBUTING.md](CONTRIBUTING.md).

Each child separately uses its shared `info/exclude` for `/.worktrees/` and exact
private task directories under `dev/active/`, `dev/backlog/`, and `dev/notes/`.
Resolve that file using
`git rev-parse --path-format=absolute --git-path info/exclude`; linked worktrees
share it. Preserve existing rules and verify effective exclusion.

Ignore rules do not untrack existing files or prevent forced staging. Check for
collisions before writing and inspect the staged diff before commits. Keep
maintainer-required documentation tracked; do not blanket-ignore upstream docs,
skills or all of `dev/`.

```bash
git -C repos/REPOSITORY rev-parse --show-toplevel
git -C repos/REPOSITORY diff --cached --stat
# Only after the user authorizes publication:
git -C repos/REPOSITORY push origin feat/pagination
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
- [Contributing to the workbench](CONTRIBUTING.md)

## Licensing

Original workbench material is available under the [MIT License](LICENSE).
Imported or adapted material retains its upstream terms and attribution; see
[Third-Party Notices](THIRD_PARTY_NOTICES.md) and the
[licensing policy](docs/legal/LICENSING.md).

The I-VSD skill is MIT-licensed. Its
[canonical source](https://github.com/islamu-ngo/Islamic-Value-Sensitive-Design)
is the ISLAMU Islamic Value-Sensitive Design repository, and the skill is derived
from the [*Islamic Value-Sensitive Design* thesis](https://github.com/islamu-ngo/Islamic-Value-Sensitive-Design/blob/main/Thesis/Thesis_Islamic-Value-Sensitive-Design.md).
`grill-me` is adapted from Matt Pocock's MIT-licensed skills repository.
`robin-neutral` is attributed to Benjamin Code, but its exact source license or
permission remains unresolved; that skill is not cleared for public
redistribution until the notice is completed.

This is a documentation-driven cockpit, not an autonomous daemon or an installed
toolchain. It does not select a license for your code or supersede a target's
own security, release or contribution rules.
