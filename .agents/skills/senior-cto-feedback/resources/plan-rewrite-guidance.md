# Plan Rewrite Guidance

Refine the requested clone/worktree-local `plan.md`, `context.md` and `tasks.md` in place
when the user has invoked this refinement workflow. Never create a competing
review sidecar, branch/worktree, or product implementation. Explicit user
read-only review instructions override the default editing workflow.

## Rewrite Principles

Make the plan smaller, sequenced, testable, contract-aware and explicit about
authority, privacy, migration, recovery, deletion and verification. Target
architecture, license, compatibility and contribution policy remain authoritative.
Do not erase requested scope merely to improve a score or shrink a PR.

Every phase names owned paths, behavior, exit criteria, commit outcome and
authorization. Keep accepted requirements and risks; eliminate duplicate prose,
not decision-relevant information.

## Zero-Loss Information Preservation

| Review result | Canonical destination |
|---|---|
| Completeness, Correctness, Coherence scorecard | Plan metadata and compact context review state |
| Verified current code, callers, tests and seams | Plan current-state evidence |
| Socratic challenge and resolved choice | Behavior scenarios and architecture decisions |
| Worst credible break | Risk register, testing strategy and Red invariant task |
| Ranked risks and minimum acceptable repairs | Risk register with owners/detection; active blockers in context |
| Breaking/removal decisions | Migration/compatibility section under target policy |
| Sequence, path ownership and commit contract | Tasks ledger |

Chat is the executive summary, not the sole location of a material finding.
Unaccepted advice remains identified as a recommendation, not fabricated approval.
A compact context links durable detail rather than duplicating it.

## Whole-Triad Reconciliation

1. Correct the plan's evidence, behavior and architecture.
2. Bring tasks into alignment with those phases and acceptance criteria.
3. Update current context, next action, blockers and review/approval state.
4. Remove obsolete tasks only when their behavior was explicitly replaced or
   dropped; account for every original acceptance criterion.
5. Check ethical refresh triggers and mark stale mappings before handoff.
6. Resolve and keep the sole canonical triad at execution-root-relative
   `dev/active/<task>/`. It may already be in the task worktree after
   authorized movement under the [target workflow](../../../../docs/TARGET_WORKFLOW.md).
   Review edits that existing location without moving it or recreating the
   clone-local path. In-tree execution remains clone-local.

## I-VSD Invalidation

Read the relevant
[integration contract](../../i-vsd/resources/integration-contract.md) section.
Changes to provider authority, stakeholders, defaults/rights, data/AI/telemetry,
moderation, monetization, portability, deployment responsibility, escalation or
`IVSD-*` mappings make the ethical report stale until revalidated.

Record input revision and why a refresh is or is not required. Wording/status
corrections without a responsibility change need not invalidate substantive
ethical analysis. Never manufacture a plan-aligned disposition.

## Recommended Plan Shape

Use the canonical
[plan template](../../implementation-plan/resources/plan-template.md), including:

- metadata, current-state evidence and deferrable unknowns;
- observable requirements before implementation design;
- constraints, architecture decisions and reviewable phases;
- testing, documentation/release impact and I-VSD mappings;
- authority/privacy, applicable cross-cutting concerns and operations;
- migration, risk, definition of done and implementation/reporting contracts.

Use heading names rather than stale numeric references when the template evolves.
Do not duplicate a competing template here.

## Context And Tasks Shapes

Use [operational artifacts](../../implementation-plan/resources/operational-artifacts.md).
Context starts with exact target/configuration/Cwd, current state, blockers and
next action; keep it below 300 lines and 15 KB.

Tasks contain observable assertions, dependencies, exact paths, risk-appropriate
Red/Green sequences, configured checks and declarative commit packets. Record
type/scope, title, rationale, actual target release treatment, required trailers,
literal paths and authorization. Material divergence needs an explicit revised
contract. Review describes future commands; it does not run commits.

Never forbid necessary runtime/browser verification globally. Ring 1 is focused,
Ring 2 is canonical integration, and Ring 3 exercises the real affected surface
and target-required complete checks. No source-specific flags or release validator
may survive as a generic command.

## Test-First Invariant Rewrite

Replace “implement the handler, then add tests” for a high-risk state boundary:

```text
Red: specify stale-version rejection at the public operation.
Files: verified target regression-test path.
Acceptance: test compiles and fails on the violated state-preservation invariant.

Green: implement the owning state transition.
Files: verified owning implementation paths.
Acceptance: the same invariant and affected existing tests pass.

Refactor: simplify the state boundary without changing behavior.
Acceptance: the relevant slice remains green; diagnostics and wiring are valid.
```

Use the target's error contract and redaction mechanism. Mock external boundaries,
not the interaction whose correctness is being claimed.

## Compatibility Rewrite Pattern

When the target explicitly permits a breaking change, specify the obsolete
behavior, why it should disappear, affected clients/data/configuration, generated
artifacts, deployment ordering, recovery and required user/operator docs.

When compatibility is required, characterize current consumers, expand the new
seam, migrate bounded cohorts, then contract only after usage is zero and the
target's policy permits removal. Do not substitute a greenfield assumption.

## Four-Point Right-Sizing

Check independent “and also” intents, more than 8–10 major tasks, big-bang layer
mixing, and independently shippable value. Two or more symptoms justify a
concrete split proposal, not unilateral loss of requested scope.

Prefer coherent vertical value with bounded risk. A foundational storage change,
public contract, UI consumer or operator migration may be independent only if
each slice remains buildable and useful. Keep generated outputs with inputs.
Task-local backlog belongs under the configured clone's
`dev/backlog/<task>/`, locally excluded from upstream contributions.

## Anti-Patterns

| Weak instruction | Evidence-bound replacement |
|---|---|
| Keep compatibility “for now” | Name the target policy, consumers and removal/migration gate |
| Add tests | Name the invariant, public seam, oracle and configured command |
| Make it isolated | Name identity source, enforcement boundary and cross-boundary rejection |
| Add configuration | Define default, validation, injection, docs and failure behavior |
| Add a worker | Define idempotency, retry limit, dead-letter state, telemetry and recovery |
| Update UI | Define observable affordances, states and render/interaction checks |
| Commit everything | Name one reviewable outcome, owned paths and actual authorization |

## Completion

All material findings are mapped, all three artifacts agree, task execution is
unambiguous, and the final brief states remaining blockers and the exact next
step. A critique is not evidence that the future implementation has passed tests.
