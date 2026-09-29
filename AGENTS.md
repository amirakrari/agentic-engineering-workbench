# Portable Agentic Cockpit

This repository is the personal engineering control plane. Target code lives in
independent repositories under `repos/`; local plans and reviews live with their
target, while reusable workflows and knowledge stay here. This contract supplements a target's own
contribution, architecture, security, licensing or release requirements.

## 1. The Contribution Contract

Answer these eight questions before editing. Discover the target's contract first,
then read only the compatible matching cockpit entry in
[the registry](.agents/contract/intents.yaml). Resolve paths against the selected
clone/worktree and preserve the target's required checks and artifacts.

| # | Question | Source of Truth |
|---|---|---|
| 1 | What kind of change is this? (the *intent*) | Target routing, supplemented by `.agents/contract/intents.yaml` |
| 2 | Which rules are authoritative? | Applicable target guidance first, then compatible cockpit rules |
| 3 | Which files must be read first? | The intent's `must_read_docs` field |
| 4 | Which files may be changed? | The intent's `paths_in_scope` field |
| 5 | Which tests must run at minimum? | The intent's `minimum_tests` field |
| 6 | Which docs must be updated? | The intent's `docs_to_update` field |
| 7 | Which PR checklist applies? | The intent's `pr_checklist` field |
| 8 | What is forbidden? | The intent's `forbidden_without_approval` + `docs/QUICK_REFERENCE.md` |

## 2. Canonical Artifacts

| Concern | Owner |
|---|---|
| Active target, commands and lifecycle | [project.yaml](project.yaml), [configuration contract](docs/PROJECT_CONFIGURATION.md) |
| Invariants and conventions | [Quick reference](docs/QUICK_REFERENCE.md), [governance](docs/GOVERNANCE.md) |
| Context retrieval and budgets | [.agents/CONTEXT_ENGINEERING.md](.agents/CONTEXT_ENGINEERING.md) |
| Architecture and verification | [Architecture guide](docs/AGENTIC_CONTEXT_ENGINEERING.md), [operations](docs/OPERATIONS.md) |
| Target discovery and local workspace | [Target workflow](docs/TARGET_WORKFLOW.md) |
| Durable lessons | [Journal](knowledge/journal.md) |
| Current execution state | Execution-root-relative `dev/active/<task>/context.md` |

## 3. Cold-Start Flow

1. **DISCOVER & CLASSIFY:** Resolve the target, then read its `AGENTS.md`,
   `CLAUDE.md`, README, CONTRIBUTING and referenced guidance when present. Load
   applicable nested/path-scoped rules. Discover native skill catalogs and read
   matching skills by exact path alongside relevant cockpit skills. Follow
   [target discovery](docs/TARGET_WORKFLOW.md#instruction-and-skill-discovery).
   Resolve intent and criticality using the target's contract first.
2. **DYNAMIC ALIGNMENT:** Tiers 0–2 require focused risk alignment and explicit
   decisions on authority, failure and recovery. Reuse answers already supplied.
   Tier 3 asks only unresolved domain questions; Tier 4 proceeds economically.
3. **LOAD:** Read required headings, matching rules and selected `SKILL.md`.
   Load a resource only for a named unresolved decision.
4. **EDIT:** Apply the target's native patterns within the approved paths.
   Separate planning, adversarial review and execution into fresh sessions for
   substantial work; the dev-doc triad is their serialization boundary.
5. **VERIFY & REVIEW:** Use the three verification rings and risk-appropriate
   independent review. Capture actual evidence, not predicted command results.
6. **TEACH:** Explain concrete changes, control/data flow, verification and gaps.
7. **ESCALATE:** Present a self-contained decision brief for genuine unresolved
   conflicts. Do not turn routine reversible work into repeated approvals.

## 4. Rule Authority Order

Explicit user scope and higher-priority harness instructions govern. Inside that
boundary, the target's local contract governs its code. Cockpit rules govern the
personal workflow, isolation and knowledge artifacts. Within the cockpit:

1. Critical rules below.
2. `docs/QUICK_REFERENCE.md`.
3. `docs/GOVERNANCE.md`.
4. Matching `.agents/rules/*.md` and identical `.omo/rules/*.md` twins.

For work in a target, its applicable instructions and skills take priority over
conflicting cockpit defaults. Record the resolution and retain compatible
cockpit guidance; do not ask again for this settled precedence. Ask only when
target instructions themselves conflict without a declared resolution or user
scope is missing. No project file grants unrelated or destructive permissions.

## 5. Critical Rules

- **Scope:** Private plans may live inside the target only after local exclusion
  and ownership checks; they never enter an upstream commit. Do not copy shared
  cockpit rules/skills into targets. Maintainer-required artifacts remain tracked
  project work. Never edit a sibling project not named by the user.
- **Context-agnostic core:** Admit only target-independent engineering workflows
  that satisfy the
  [governance admission rule](docs/GOVERNANCE.md#context-agnostic-core-admission-rule).
  Product, stack, vendor, SaaS, SDK, issue-tracker, documentation-platform, and
  domain skills belong in the target or a separate optional catalog. Discover
  and load them there; do not grow this repository into a universal skill bundle.
- **Architecture:** Keep domain behavior separate from transport and persistence
  where the target uses that boundary. Repository/entity mapping, validation
  construction and identifier types follow target conventions; optional stack
  templates are references, not mandatory migrations.
- **Authorization:** Reads are public only by deliberate target policy. Writes
  require their intended authority. Where server-authored affordances exist,
  gate UI actions on them; UI gating never substitutes for server enforcement.
- **Generated artifacts:** Change the owning model/generator and regenerate;
  do not hand-edit generated migrations, lockfiles or snapshots.
- **Secrets:** Use the target's documented injection/provider authority. Never
  embed credentials in code, tests, configuration, plans or captured logs.
- **IP:** Follow [clean-room governance](docs/legal/IP_GOVERNANCE.md). External
  research supplies functional facts and source provenance, not copied
  implementation. A target's license and intended distribution modes govern
  dependency acceptance; personal tooling grants no additional rights.
- **Tooling:** Use native edits and Bash utilities. No ad-hoc Python or Node
  helper scripts. Existing target build/test tools remain valid. Persistent
  automation requires lasting value and an explicit repository-owned home.
- **Compatibility:** Greenfield breaking-change freedom is opt-in through the
  target lifecycle. Preserve published contracts unless the target authorizes
  a breaking change; do not import another project's release assumptions.
- **Tests:** Protect business invariants, state machines, concurrency, isolation
  and fail-closed behavior. No mock-mirroring, source-text tests for prose,
  framework boilerplate, nondeterministic sleeps or weakened failing checks.
- **Documentation:** Keep technical anchors and user/operator guidance consistent
  when external behavior changes, using the target's own documentation layout.
- **Human interaction:** Explain decisions inline with context, recommendation,
  trade-offs and next action; never require opening a plan to decode task IDs.
- **Ownership:** Preserve unrelated work. Commit, push, publish, merge or destroy
  only under the applicable explicit user authorization.

### Child Repository Execution Rule

1. The configured target is `repos/<repository-directory>/`. Before a side effect,
   resolve its real path, confirm it stays inside `repos/`, and check that
   `git -C <target> rev-parse --show-toplevel` identifies that independent repo.
   Reject symlink escapes, missing children and accidental parent fallback.
   If configuration is unready, enumerate immediate `repos/` directories
   directly and resolve independent Git roots by local name and remote identity;
   never infer absence from an ignore-aware index. Follow
   [visible target discovery](docs/TARGET_WORKFLOW.md#visible-target-repository-discovery).
2. All compilation, tests, linting, formatting and target git commands MUST use
   **Cwd: `repos/<repository-directory>`**, or the explicitly validated worktree selected
   by `implement-tasks`. `git -C` and a scoped shell `cd` satisfy explicit Cwd.
3. Commands in `project.yaml` are relative to that Cwd; never prepend a second
   `repos/<repository-directory>` inside a configured command. Inspect commands before
   execution. YAML is declarative data, not an auto-executing task runner.
4. Planning starts at clone-relative `dev/active/<task>/`.
   Isolated execution uses clone-relative `.worktrees/<task>/` and moves the
   whole sole task directory into that worktree's `dev/active/`. In-tree execution
   stays clone-local. There is no cockpit-root `dev/`.
5. Before writing/moving local task files, preserve and extend only the selected
   clone's shared `info/exclude`, resolved with `git rev-parse --git-path`.
   Verify effective exclusion and no tracked/content collisions. Never modify
   upstream `.gitignore`, use global exclusions or force-add personal notes.
6. Backlog/notes stay in the configured clone's task-namespaced
   `dev/backlog/<task>/` and `dev/notes/<task>/`; shared lessons live in cockpit
   `knowledge/`, and ethical
   evaluations in cockpit `islamic-value-sensitive-design/`. Record all roots
   explicitly and repair cross-root references when moving the task directory.
7. Before authorized worktree cleanup, preserve ignored task material, normally
   by moving it back to its excluded clone-local path. A clean Git status is not
   proof that ignored files can be deleted. Follow [the lifecycle](docs/TARGET_WORKFLOW.md).
8. The cockpit root is NEVER a valid Cwd for commands targeting a child.
9. `repos/` stays visible for editor and chat `@` discovery. It is never valid
   workbench commit content. Stage exact workbench paths, never bulk-add the
   root, and run `bash eng/check-workbench-staging.sh` before every workbench
   commit. Any non-deletion staged path under `repos/` is a blocker.
   Cockpit maintenance commands may run here when that is the requested task.

## 6. Task-Routing Entrypoints

Start with target discovery and its relevant intent/skill routing, supplemented
by cockpit [intents](.agents/contract/intents.yaml). Workflow stages route to
`i-vsd`, `implementation-plan`, `senior-cto-feedback`, `implement-tasks`, and
`finding`. The [skill schema](.agents/skills/_SKILL_SCHEMA.md) defines metadata;
the [agent registry](.agents/agents/README.md) defines delegated roles.
Consult [rules](.agents/rules/README.md) for path constraints and
[templates](.agents/templates/README.md) only after choosing a compatible stack.

## 7. Targeted Fetch And Reuse Rule

Keep a `path + heading/symbol + revision` evidence ledger. Use an available
knowledge graph or LSP for structure, then bounded search/read when unavailable.
Graph setup must not mutate unrelated repositories. Never assume a graph is
installed or current. Record callers, callees, side effects, flows and tests for
multi-layer/high-risk changes; unknown coverage remains unknown.

Read only the matching intent, required headings and named resources. Re-read
only after change, contradictory evidence or a concrete unresolved question.
Apply the [context contract](.agents/CONTEXT_ENGINEERING.md).

## 8. Verification Baseline

Discover target commands from its docs/CI; record them in `project.yaml`.
Establish a baseline once. Never switch the user's main checkout or run an
automatic pull as a bootstrap side effect.

| Ring | When | Scope |
|---|---|---|
| 1: Inner loop | Behavior slice | Fast deterministic, in-memory tests; aim below 2 seconds |
| 2: Phase gate | Integrated phase | Touched build and one canonical integration provider; aim below 15 seconds |
| 3: Plan exit | Before final handoff/PR | Relevant full matrix, architecture, migration and real-surface checks once |

Time budgets are goals, not permission to omit required checks or falsify results.
Run only relevant layers. Documentation-only work uses formatting, schemas and
links, not product builds. Quarantine unrelated failures only after showing they
reproduce on an untouched baseline; record exact evidence and continue in scope.

## 9. Agent Operational Baseline

Use the lowest-cost capable agent for genuinely independent work. Assign exact
paths, bounded outputs, observable completion and evidence. Keep decisions and
integration with the lead. Do not delegate atomic lookups.

Every delegated task receives the validated execution root, applicable target
instruction paths, exact selected skill paths and resolved precedence. Refresh
changed instruction/skill revisions in the actual worktree; do not assume the
clone's current branch has the same guidance.

Resume substantial work from `context.md`, then the current task and referenced
plan section. Keep context below 300 lines and 15 KB; graduate durable lessons
instead of accumulating logs. A final teaching summary names files, behavior,
design decisions, verification and anything unfinished.

## 10. Tool-Specific Bootloaders

| Harness | Entry | Skill/rule loading |
|---|---|---|
| AGENTS-aware harnesses | `AGENTS.md` | Read selected canonical paths explicitly |
| Claude Code | `CLAUDE.md` imports `AGENTS.md` | Explicit skill path unless native installation verified |
| Cursor/Windsurf | `.cursorrules`, root contract | Verify local discovery; load paths explicitly if absent |
| GitHub Copilot | `.github/copilot-instructions.md` | Support varies by surface; verify references |
| OmO | `AGENTS.md`, `.omo/rules/` | Native matching when installed; twins are identical |
| Gemini/Antigravity | Explicitly open `AGENTS.md` | Verify configured context filename; do not alter global settings |

Start in the cockpit root. Never assume a remote/cloud task confined to a child
can see its parent. No global skill installation, user-setting edits, or copying
bootstrap files into a child is implied. See [research](docs/RESEARCH.md).

## Approvals

Proceed with authorized, reversible local work. Ask before destructive work,
external publication or an unresolved choice that changes the outcome. Existing
authorization persists; do not ask repeatedly. Instruction files guide behavior
but are not a security sandbox or proof of instruction loading.
