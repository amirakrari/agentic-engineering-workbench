# Quick Reference

> **Audience:** Contributors | AI agents
> **Status:** Reference
> **Owner:** Agent Context
> **Last Verified:** 2026-09-27
> **Source Anchors:** [`AGENTS.md`](../AGENTS.md), [`project.yaml`](../project.yaml), [Target Workflow](TARGET_WORKFLOW.md), [Agentic Context Engineering](AGENTIC_CONTEXT_ENGINEERING.md)

## Critical Rules

1. Target repositories live at `repos/<name>` and keep their own Git history.
2. Start with target `AGENTS.md`, `CLAUDE.md`, `README`, `CONTRIBUTING`, scoped
   instructions, and native skill descriptions when present.
3. Load matching exact target skill paths alongside compatible cockpit skills.
   Target requirements win overlapping conflicts without discarding compatible
   cockpit workflow.
4. Run build, test, lint, format, and Git commands with `Cwd` set to the resolved
   clone or task worktree. `project.yaml` commands are execution-root-relative
   and never contain `cd`.
5. Breaking-change freedom requires explicit child greenfield opt-in.
6. Never assume reads are anonymous; use the child's authorization contract.
7. Classify work at criticality 0-4 and use the highest implicated level.
8. Planning creates the sole triad at
   `repos/<project>/dev/active/<task>/`. Isolated execution moves the
   whole task directory to
   `repos/<project>/.worktrees/<task>/dev/active/<task>/`.
9. In-tree execution remains clone-local. If target policy forbids this layout,
   follow target policy and record actual paths.
10. Put exact task exclusions and `/.worktrees/` only in resolved shared
    `info/exclude`; verify tracked collisions and effective ignores first. Never
    edit tracked/global ignores or force-stage local task files.
11. Keep clone-root task backlog and notes under `dev/backlog/` and `dev/notes/`;
    keep reusable journal material under cockpit `knowledge/` and ethical reports
    under `islamic-value-sensitive-design/` as
    `i-vsd-<project>-<task>.md`. Reusable knowledge retains source project/task
    provenance.
12. Write behavioral tests before production changes; derive expected values independently.
13. Verify through public seams; mock only genuine external boundaries.
14. Use Ring 1 focused checks, Ring 2 changed-domain gates, and Ring 3 child-required exit checks.
15. Triage failures as A (direct), B (induced ripple), or C (proven baseline). Do not yak-shave unrelated rot.
16. Use a graph when available; repository search and language tooling are the fallback.
17. Preserve external provenance while excluding third-party source expression.
18. Never hard-code secrets or emit sensitive values in logs, errors, evidence, or examples.
19. Keep `context.md` compact. Git is commit history.
20. Stage literal owned paths, never `.` or broad directories as phase ownership.
21. Retain ignored task material before authorized worktree cleanup.
22. Graduate only durable, evidenced knowledge; import no source-project tasks or findings.
23. Keep the three `.agents/rules` and `.omo/rules` twins byte-identical.

## Criticality

| Level | Scope | Default rigor |
|---|---|---|
| 0 | Money, safety, irreversible authority | Adversarial intake, exhaustive tracing, independent review |
| 1 | Security and trust boundaries | Threat modeling, fail-closed tests, independent review |
| 2 | Personal-data lifecycle | Data-flow tracing, redaction/erasure tests, independent review |
| 3 | Domain state and persistence contracts | Bounded impact tracing and behavioral integration |
| 4 | Standard UI, docs, agent context | Local reading and lightweight checks |

## Triad, Rings, and Failures

| Artifact | Responsibility |
|---|---|
| `plan.md` | Architecture, scenarios, risks, rollback, decisions |
| `tasks.md` | Red/Green/Refactor tasks, verification, commit contracts |
| `context.md` | Compact resume state, blockers, evidence, baseline failures |

| Ring | Scope |
|---|---|
| 1 | Smallest deterministic behavior slice |
| 2 | Changed package/module and focused integration |
| 3 | Full checks required by the child |

| Failure | Action |
|---|---|
| A - direct regression | Fix before phase close |
| B - induced ripple | Align if bounded; otherwise Decision Brief |
| C - baseline rot | Prove on untouched base, record, quarantine |

## Completion

Re-read the request, inspect the final diff, run available validators once, distinguish passed/unavailable/pre-existing results, confirm no cockpit file is staged in the child, and report inventory plus validation limits.
For path setup, exclusions, triad movement, resume, and cleanup use
[Target Workflow](TARGET_WORKFLOW.md).
