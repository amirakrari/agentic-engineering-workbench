# Cold-Start Benchmarks

Cold-start benchmarks evaluate whether a fresh agent can use the cockpit and a child repository's own rules to make a correct, scoped change without prior conversation memory. This directory intentionally contains no benchmark YAML and no automated hooks.

## Manual Method

1. Select a real, closed child issue or create a synthetic prompt that contains no hidden hints.
2. Start a fresh session at the cockpit root and resolve the selected clone under
   `repos/`.
3. Record whether the agent read target `AGENTS.md`, `CLAUDE.md`, `README`,
   `CONTRIBUTING`, and scoped instructions when present; discovered the target's
   native skill catalog; and loaded matching exact target and cockpit skill
   paths.
4. Record whether planning created the sole triad under the clone, isolated
   execution moved that whole task directory into `.worktrees/<task>/`, every
   subagent received the resolved worktree Cwd/contracts/skills, and no cockpit
   workflow file entered the target's tracked set.
5. Verify task-local exclusions through the selected clone's resolved shared
   Git `info/exclude`, including exact task paths and `/.worktrees/`. A benchmark
   fails if it edits a tracked `.gitignore`, changes global excludes, overlooks
   a tracked collision, or relies on force staging.
6. Record whether the agent selected the correct intent/criticality, stayed
   within owned paths, and ran configured verification.
7. Measure live context, repeated unchanged reads, oversized search results, and
   unnecessary whole-file loads when the harness exposes those values.
8. Store the dated report with the clone-root task notes at
   `dev/notes/<task>/benchmark.md`. Promote only a reusable,
   evidenced lesson to `knowledge/journal.md`.

| Outcome | Meaning |
|---|---|
| PASS | Behavior and scope are correct, required available checks pass, and context limits are met |
| PARTIAL | Correct result with one non-critical acceptance or context-budget miss |
| FAIL | Wrong intent/criticality, unsafe scope, missed behavior, or required check failure |

Triage failures in this order: routing error; context duplication/overflow;
missing decision evidence; out-of-scope edit; skipped verification; architecture
violation. Improve the smallest routing or rule surface that addresses the
cause. Do not add broad must-read lists by default.

Benchmarks are evidence, not active product tasks. Never import scenarios,
scores, or findings from another repository. See
[`AGENTS.md`](../../AGENTS.md),
[Agentic Context Engineering](../../docs/AGENTIC_CONTEXT_ENGINEERING.md),
[Target Workflow](../../docs/TARGET_WORKFLOW.md), and
[promotion rules](../../knowledge/PROMOTION_RULES.md).
