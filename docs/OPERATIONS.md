# Cockpit Operations

> **Audience:** Contributors | Maintainers | AI agents
> **Status:** Reference
> **Owner:** Contributor Experience
> **Last Verified:** 2026-09-27
> **Source Anchors:** [`project.yaml`](../project.yaml), [`AGENTS.md`](../AGENTS.md), [Target Workflow](TARGET_WORKFLOW.md), [Quick Reference](QUICK_REFERENCE.md)

## Target and Commands

`project.yaml` version 1 declares `target.path` as `repos/<name>`,
`git.worktree_path` as clone-relative `.worktrees/{task}/`,
`dev_docs.active` as execution-root-relative, `dev_docs.backlog` and
`dev_docs.notes` as clone-relative, and top-level `knowledge` as cockpit-relative.
Commands are strings interpreted relative to the selected execution root, or
`null` when unsupported; they never contain `cd`.

Before execution read target `AGENTS.md`, `CLAUDE.md`, `README`,
`CONTRIBUTING`, scoped rules, and relevant native skill descriptions when
present; then load exact matching target and cockpit skills. Refresh these
revisions in a created/resumed worktree. For every command: set `Cwd` to the
resolved clone or task worktree; invoke the configured execution-root-relative
command; preserve the first meaningful failure; avoid blind retries; and report
`null` commands as unavailable. The cockpit root is never the child
build/test/lint/format/Git working directory.

## Task Paths and Local Exclusions

Planning creates one clone-local task directory. Isolated execution validates
clone-relative `.worktrees/<task>/`, then moves the entire task directory into
the worktree's `dev/active/`. It never copies the triad or leaves competing
ledgers. In-tree execution does not move it.

Before writing or moving, resolve shared `info/exclude`, preserve existing
content, add exact task paths plus `/.worktrees/`, and verify no tracked/content
collision and effective ignore behavior from clone and worktree. Never edit
tracked `.gitignore`, global excludes, or force-add local task files. Backlog and
notes remain clone-root and task-namespaced. Preserve ignored artifacts before
authorized cleanup. See [Target Workflow](TARGET_WORKFLOW.md).

## Verification

- **Ring 1:** focused deterministic test or static check while editing.
- **Ring 2:** changed module/package build, lint, and related integration tests.
- **Ring 3:** full child-required checks once at workstream exit.

The child defines breadth; there is no universal latency or provider count. Async tests subscribe before triggering and await a bounded signal. Fixed sleeps are prohibited unless elapsed time is the behavior under test.

## Failures and Git Safety

Class A direct regressions are fixed in-phase. Class B induced ripples are aligned only when bounded; structural absorption needs a Decision Brief. Class C failures require reproduction on untouched base, bounded evidence, and quarantine.

Use child branches/worktrees according to upstream policy. Filter worktree
inspection to the assigned task. Stage literal phase-owned product files and
inspect the staged diff; local task docs remain ignored unless the target
explicitly requires them tracked. Do not create commits without explicit
instruction. Keep review worktrees until merge or explicit teardown, and retain
ignored task material before removal.

## Secrets, Evidence, and Tooling

Resolve secrets through child authority. Never place credentials, cookies, personal data, or provider payloads in source, tests, plans, logs, screenshots, evidence, or examples. Evidence contains safe commands, versions, outcomes, and reason categories.

Use graph tooling for impact analysis when available. Otherwise use search, language references, build metadata, and source reading. Optional graph absence does not block routine work.

## Completion Report

Report resolved clone/worktree Cwd, instruction and skill paths, task artifact
locations, file inventory, boundaries, checks and outcomes, unavailable
validation, quarantined baseline failures, and assumptions resolved from the
target contract. See
[Agentic Context Engineering](AGENTIC_CONTEXT_ENGINEERING.md).
