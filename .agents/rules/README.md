# Path-Scoped Rules

Rules refine the canonical contract for matching paths. Intent routing comes first; [`docs/QUICK_REFERENCE.md`](../../docs/QUICK_REFERENCE.md) and [`docs/GOVERNANCE.md`](../../docs/GOVERNANCE.md) outrank these files.

| Rule | Focus |
|---|---|
| [`ip-clean-room.md`](ip-clean-room.md) | Externally informed work, provenance, and dependency/distribution review |
| [`tests.md`](tests.md) | Deterministic behavioral testing and progressive verification |
| [`work-criticality-matrix.md`](work-criticality-matrix.md) | Criticality levels 0-4 and proportional rigor |

Rules use generic globs because child stacks vary. Always load the child's own rules too; they prevail. Keep rules surgical rather than duplicating whole architecture docs.

The three indexed files have byte-identical regular-file twins under [`.omo/rules/`](../../.omo/rules/). Update both copies in one change; do not use symlinks. No other twin or automation is asserted.

Clone-local workflow paths use explicit globs for
`repos/*/dev/{active,backlog,notes}/` and
`repos/*/.worktrees/*/dev/active/` where relevant. Hidden-directory traversal
differs between harnesses, so a broad `repos/**/*` rule is not the sole match
for worktree content. See [Target Workflow](../../docs/TARGET_WORKFLOW.md).
