---
name: review-pr
description: "Load for pre-PR self-review or pull-request review that must verify matched intent, allowed scope, required tests/docs, forbidden actions, architecture gates, release contracts, and merge readiness; not for code-quality review alone."
type: guardrail
enforcement: block
priority: high
---

# Pull Request Merge Gate

## Workflow

1. **Resolve the review root and guidance.** Apply the
   [target workflow](../../../docs/TARGET_WORKFLOW.md) to select the clone or
   worktree, discover native instructions and matching target skills, and
   reload them when the reviewed revision changes.
2. **Establish freshness safely.** Identify configured base branch from
   `project.yaml` and inspect local/remote evidence. Network fetches, pushes,
   publication, and other external writes require the authorization defined by
   repository/user rules; do not mutate merely to review.
3. **Re-identify intent.** Match `.agents/contract/intents.yaml`; combine checklists for multiple intents without loading unrelated entries.
4. **Apply child authority.** Read the child repository's contribution, license, security, release, and change-log contracts. They override generic defaults.
5. **Check scope.** Every file must be in scope, none forbidden, and unrelated
   work must be split. For a workbench pull request, run
   `bash eng/check-workbench-staging.sh --tree HEAD` and reject every tracked
   `repos/**` path or nested-repository gitlink.
6. **Run two-axis review.** Apply [review-changes](../review-changes/SKILL.md): standards/Fowler smells independently from intent/spec fidelity.
7. **Collect evidence.** Run non-null `project.yaml` commands from the selected
   execution root exactly as configured, plus child-mandated checks. Never
   report expected output as observed.
8. **Review operations/docs.** Check public contracts, schema/data migration, rollback, observability, release notes, user docs, and durable findings as applicable.
9. **Approval gate.** Any forbidden-without-approval action needs explicit
   evidence. External-system writes and publication actions require explicit
   user authorization.

## Universal blockers

- Missing checklist evidence or failing required check.
- Out-of-scope/forbidden file or unapproved irreversible/external action.
- Type/lint suppression used to conceal a defect.
- Secret, credential, sensitive data, or contaminated third-party expression.
- Any target repository, gitlink, or other tracked workbench path under `repos/`.
- Nondeterministic tests, fixed sleeps, weakened assertions, or mocks that bypass asserted integration.
- Unresolved incompatible contract/release/schema change.

## Output contract

```text
Intent: <id(s)>
Base and scope: <evidence>
Files: <count; scope result>
Build/lint/tests: <exact commands and observed result>
Docs/release/data: <result>
Approvals: <evidence or none required>
Blocking findings: <ordered list or none>
Residual risk: <list or none>
Verdict: ready | not ready
```
