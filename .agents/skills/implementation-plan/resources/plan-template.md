# Plan Template

Use execution-root-relative `dev/active/<task>/plan.md` in the configured
clone or existing task worktree after verified local exclusion. Include a descriptive
title and `Last Updated` with the actual date and timezone. Resolve placeholders
before handoff. The plan defines architecture and acceptance; granular checkboxes
belong in `tasks.md`, transient status in `context.md`.

## 0. Planning Metadata

Record original request, project identity, task slug, configuration revision,
target Cwd, workstream directory, planning status, matched intents/rules/skills,
affected layers and evidence-based complexity. Keep project identity and task slug
as separate values; the task-local directory name contains only the task slug.

Record exact cockpit/clone/execution roots, applicable target instructions,
selected native and cockpit skill paths/revisions, conflict resolutions, common
Git directory and local exclusion evidence. Target guidance wins overlapping
conflicts; do not infer which same-named skill a harness selected.

Classify Behavioral Delta (added/modified/removed observable behavior) or
Non-Behavioral Delta (preserved behavior with structural or performance evidence).
Record I-VSD report path/revision/status/disposition, CTO review status, user
approval and resolved intake decisions. Never fabricate approval.

## 1. Executive Summary

State the intended user outcome, proposed change, reason and explicit non-goals.
Do not make the user infer purpose from an internal class name.

## 2. Source-Grounded Current State Report

### 2.0 Pre-Flight Structural Context

Capture a bounded graph/LSP/search slice: target symbol, callers, callees, side
effects, affected flows, tests, source revision and unknowns. A missing graph
does not block discovery or prove that no callers exist.

### 2.1 Evidence Log

Use columns Claim, Evidence, Confidence and Notes. Evidence names actual file
locations or observed commands, not inferred implementation.

### 2.2 Existing Implementation

Describe verified behavior and ownership, including relevant error paths.

### 2.3 Existing Tests And Verification Coverage

Name test paths, protected invariants, coverage gaps and known baseline results.

### 2.4 Existing Documentation And Contracts

Identify public interfaces, schemas, generated artifacts, configuration,
architecture/release policies and applicable operator guidance.

### 2.5 Current Pain Points

Tie correctness, authority, UX, accessibility, performance and maintenance gaps
to evidence. Do not turn unrelated findings into implementation scope.

### 2.6 Deferrable Unknowns

For each unknown, state searches already made, owner, trigger and consequence.
Resolve any unknown that changes scope, architecture, public contracts or task
ordering before finalizing tasks; only genuinely deferrable details remain.

## 3. Proposed Future State: Behavior And Scenarios

Use SHALL/MUST/SHOULD/MAY and observable behavior, not internal type names.
Each requirement has a normal, boundary or failure scenario as relevant:

```text
Requirement: reject a stale update without changing saved state.
GIVEN a newer authoritative version exists
WHEN a caller submits an update based on an older version
THEN the system returns its documented conflict result and preserves state.
```

Include the worst credible failure scenario and its invariant. For a
non-behavioral change, identify behavior that must remain unchanged and the
structural/performance oracle.

## 4. Non-Negotiable Constraints

Reference task-relevant target architecture, security, privacy, compatibility,
licensing, UI and documentation rules. Do not copy the entire cockpit contract.

## 5. Architecture And Design Decisions

For each material decision record Decision, Why, Alternatives, Consequences and
Affected files/layers. Explain state transitions, transaction boundaries,
side-effect ordering, errors, idempotency, observability and recovery where
relevant. A real architectural fork may use `robin-neutral`; ethical analysis
remains in the I-VSD report.

## 6. Implementation Phases

Each phase owns a reviewable outcome, dependencies, literal approved paths,
acceptance, verification and recovery:

```text
Phase: descriptive outcome
Goal:
Depends on:
Relevant files: existing/new
Owned paths:
Related rules/skills:
Acceptance:
Ring 1 slices:
Ring 2 configured build and relevant canonical integration:
Commit outcome and authorization state:
Rollback or forward recovery:
```

Put granular Red/Green/Refactor tasks and declarative commit packets in
`tasks.md`, not here. High-risk tests precede implementation. Compilation failure
is not behavioral Red. Every task contains the assertion proving completion.
Keep generated artifacts with their owning change.

Split independent outcomes rather than creating a huge umbrella commit. A
mechanically indivisible change may remain large with a stated reason. Planned
packets contain type/scope, title, rationale, target release treatment, required
trailers and exact owned paths. Commit execution still needs user authorization.
Preserve unrelated index state and mixed-author files.

## 7. Testing Strategy

Map each meaningful invariant and scenario to a public seam, test and exact
configured command/Cwd. Include concurrency, isolation and failure recovery where
implicated. Derive expected values independently; avoid mock-mirroring.

Ring 1 uses deterministic in-memory slices. Ring 2 uses the touched build and one
canonical integration provider. Ring 3 covers required full matrices, migrations,
architecture and real-surface behavior once at exit. Include browser/render
checks for UI work, not for unrelated layers. Null commands require explicit
not-applicable evidence or remain open gates.

Classify direct regressions, induced ripples and proven baseline rot separately.
Never plan unrelated suite repair or weaken failing assertions.

## 8. Documentation, Configuration And Operations Impact

Name affected technical anchors, user/operator docs, schema/generator inputs,
environment variables, deployment manifests and runbooks, or explain absence.

### 8.1 Release, Changelog And Commit Strategy

Discover the target's actual scope registry, changelog format, release notes,
change-fragment rules, signing and required trailers. Record applicable
feature/fix, breaking/migration/security/operator and internal-only treatment.
Do not invent release automation, fragment identifiers or mandatory skip trailers.

## 9. I-VSD And Moral Boundaries

Record exact report path, reviewed revision, status and disposition. Map every
material `IVSD-F*`/`IVSD-M*` finding or mitigation to a scenario/task, explicit
non-applicability with rationale, or named escalation gate. Trace principle,
stakeholder, provider-controlled decision, risk, mitigation, evidence and
uncertainty. State scholarly escalation needs. Synchronize the compact review
state in all three artifacts without copying moral analysis.

## 10. Security, Authorization, Privacy And Abuse

Cover applicable trust boundaries, server authority, sensitive data, isolation,
rate limits, replay, auditability and abuse. Public reads are deliberate policy,
not an assumed default. UI affordances never replace server enforcement.

## 11. Tenancy, Federation, Localization, Accessibility And Product

Mark each concern Applicable, Not applicable or Needs investigation with evidence.
Do not impose multi-tenancy, a frontend framework or self-hosting on every target.

## 12. Observability And Operations

Specify bounded/redacted logs, metrics, traces, readiness, troubleshooting and
operator-visible failures/recovery where relevant.

## 13. Migration And Compatibility

Follow the target's declared lifecycle. Identify consumers, migration/deployment
ordering, generated contracts and rollback/forward recovery. Use expand/contract
when published compatibility requires it; deletion is not a universal default.

## 14. Risk Register

Columns: Risk, Likelihood, Impact, Mitigation, Detection signal and Owner/task.
Keep the worst break explicit and linked to its adversarial proof.

## 15. Success Metrics And Definition Of Done

Define observable success, required checks and honest handling of external
blockers. Include knowledge graduation: shared lessons go to cockpit `knowledge/`;
project backlog/notes stay in the configured clone's locally excluded task
directories. Target-required ADRs remain tracked. Do not commit private task files;
retain the triad before worktree cleanup unless its disposal is explicitly approved.

## 16. Implementation Agent Contract

Resume from context and active tasks, then only the relevant plan sections.
Update task states immediately, keep context compact, preserve approvals and
failed gates, and rebaseline only when strategy changes. Run the defined rings,
fix attributable failures and execute authorized truthful commit packets.
Record material packet changes instead of silently rewriting them.

## 17. Progress Reporting

Report implemented behavior/design, exact evidence, unresolved work, next action
and which artifacts changed. Teach the owning components and control/data flow
without making the user open the plan.

## 18. Potential Risks And Unknowns

End with the specific area most likely to fail or expand and the next evidence
or decision needed. Do not present a deferred foundational choice as ready.
