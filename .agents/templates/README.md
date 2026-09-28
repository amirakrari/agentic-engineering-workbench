# Technology Template Catalogs

Templates are optional implementation references for a target repository that already uses the named stack. They are not skills, are never auto-loaded, and do not establish cockpit-wide architecture.

Before using a template:

1. Resolve the target and read its `AGENTS.md`, `CLAUDE.md`, `README`,
   `CONTRIBUTING`, scoped instructions, and native skill descriptions when
   present.
2. Confirm the target's architecture and contribution policy.
3. Confirm supported runtime/library versions and compatibility commitments.
4. Confirm dependency and snippet licensing under the target's license policy.
5. Adapt names, commands, providers, and test strategy to existing child patterns.
6. Run all commands from the resolved clone or task-worktree Cwd and use
   commands declared in `project.yaml`.

A template loses every conflict with the child repository's architecture, compatibility, security, contribution, or license requirements. Copying a pattern is never a reason to introduce its libraries.
Keep compatible cockpit workflow, but do not use a template to overrule target
requirements. See [Target Workflow](../../docs/TARGET_WORKFLOW.md) for execution
root and worktree lifecycle; templates do not own task paths or exclusions.

## Available Catalog

The populated catalog under [`dotnet/`](dotnet/) contains seven flattened references: clean architecture, CQRS with mediator-style dispatch, persistence, authentication/authorization, transactional outbox, observability/error tracking, and query optimization. Presentation-library theming material is intentionally excluded under the extraction specification's final exclusion.

The [`python/`](python/README.md), [`typescript/`](typescript/README.md), and [`rust/`](rust/README.md) catalogs document extension points only. They contain no implementation guidance yet.
