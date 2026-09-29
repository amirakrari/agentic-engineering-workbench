
# Investigation Workflow

## Stop Condition

Stop after the three planning artifacts are complete, internally consistent, and ready for user review. Do not implement the planned change. Planning never changes Git topology; the sole triad starts clone-local at `dev/active/<task>/`, or is refined in place when already moved into the task's worktree. Establish effective repository-local exclusions before writing it.

## 1. Initialize The Integrated Intake

1. Derive a stable kebab-case task name from the request.
2. Load `.agents/skills/i-vsd/SKILL.md`, its `planning` mode in `resources/integration-contract.md`, and `.agents/skills/grill-me/SKILL.md`.
3. Treat the explicit implementation-plan request as agreement to run the integrated I-VSD intake; do not ask for a redundant confirmation.
4. Do not create the I-VSD report or interrogate the user from assumptions yet. First build the shared repository/current-state evidence packet in Sections 2–8.

## 2. Establish The Workstream

1. Inspect this target's clone-local task/backlog paths and relevant task worktree
   for existing work; do not search a cockpit-root `dev/` or unrelated worktrees.
2. Re-baseline the existing workstream when it represents the same task; do not create a duplicate.
3. Record overlap, conflicts, inherited blockers, and still-relevant remaining work.

Use persistent dev docs for complex, cross-layer, multi-session, or multi-contributor work. Skip them for an atomic change that can be implemented and verified safely in one short slice.

## 3. Technical And Architectural Analysis

Identify major technology selections, external libraries, and competing architectural patterns. When a material fork exists, load `robin-neutral`, steel-man each viable option, and create a trade-off matrix grounded in repository constraints. Carry the selected approach and rejected alternatives into Section 5 of the plan, separate from the I-VSD report.

## 4. Resolve The Contract Before Feature Sources

Follow [target discovery](../../../../docs/TARGET_WORKFLOW.md): inspect target
AGENTS/CLAUDE/README/CONTRIBUTING guidance and relevant nested instructions,
discover native skill metadata and load matching exact skill paths. Resolve
target routing first and supplement it with compatible cockpit intents/rules.
Target guidance wins overlapping conflicts. Record sources and revisions in the
context ledger without rereading unchanged evidence.

Treat platform descriptions as orientation only. Verify every feature-specific claim from current repository files.

## 5. Classify The Requested Implementation

Match the planned work to one or more intent entries. For each match, copy into planning metadata and relevant tasks:

- **Change Classification:**
  - `Behavioral Delta` — Introduces `ADDED`, `MODIFIED`, or `REMOVED` observable system behavior (requires formal RFC 2119 requirements and `WHEN`/`THEN` scenarios).
  - `Non-Behavioral Delta` — Pure refactor, performance optimization, architectural migration, tooling, or docs (requires invariant/benchmark assertions instead of scenarios).
- intent id and title;
- `must_read_docs`;
- `load_skills` and `load_rules`;
- `paths_in_scope` and any forbidden paths;
- `minimum_tests` and verification commands, recorded as contract requirements without turning each one into a phase task;
- `docs_to_update`;
- `unique_acceptance` and PR checklist items;
- `forbidden_without_approval`.

If no intent matches, create a clearly labeled fallback contract from the agent contract, canonical docs, applicable skills/rules, inferred file scope, and proportional tests. Add a planning task to consider a reusable intent only when this work category is likely to recur.

## 6. Load Scope-Specific Sources

Load each selected skill router and matching path rule once. Retrieve only the headings or symbols needed from selected documents, then expand one named unresolved decision at a time.

Do not cite a document as authority unless its relevant section was read. Use repository sources before official documentation, and external research only when local and official sources cannot answer a material question.

## 7. Verify Current Repository Reality

Delegate broad inventory to an economical read-only scout with exact queries and the cap in `.agents/CONTEXT_ENGINEERING.md`. Use graph, structural outline, AST-aware search, and LSP definitions/references for focused follow-up; retrieve owning symbols and relevant tests rather than trusting filenames alone.

Verify every claimed existing:

- file and project;
- class, interface, enum, method, handler, repository, controller, component, or policy;
- route, hypermedia relation, public schema operation, DTO, or generated client member;
- test fixture and verification command;
- configuration key, secret boundary, deployment resource, or operational behavior.

Use explicit evidence labels:

```text
Verified: repos/REPOSITORY/path/to/module
Verified: repos/REPOSITORY/path/to/module::SymbolName
Verified by search: pattern "..." matched repos/REPOSITORY/path/to/module
Not found: searched for "..."; task added to create or decide
```

Distinguish verified facts, source-derived constraints, design decisions, assumptions, and unresolved questions.

## 8. Report Current State Before Future State

The current-state report must answer:

- What exists now, by owning layer?
- What behavior do the implementation and contracts provide?
- Which tests protect it, and what is untested?
- Which docs, configuration, schemas, and operational contracts describe it?
- What is working well?
- What is incomplete, duplicated, unsafe, fragile, inaccessible, or hard to maintain?
- What remains unknown after reasonable investigation, and how will implementation resolve it? (Remember: Unknowns must be strictly deferrable; non-deferrable unknowns block planning).

Do not convert a search miss into proof of absence without recording what was searched.

## 8A. Complete I-VSD And Grill-Me Intake

1. Supply I-VSD with the stable task name, original request, verified current-state evidence, provider-controlled decisions, affected stakeholders, known constraints, and missing evidence.
2. Create or update cockpit-relative `islamic-value-sensitive-design/workstreams/i-vsd-<project>-<task>.md` as a `draft` planning report with stable `IVSD-Fnnn` findings, `IVSD-Mnnn` mitigations, escalation gates, and refresh triggers. Derive project identity from the selected configuration and verify metadata before reuse.
3. Resolve every material branch answerable from repository evidence.
4. For each remaining branch that could alter scope, provider responsibility, architecture, API contracts, scenarios, or tasks, follow `grill-me`: recommend an answer with rationale, ask exactly one question, and wait.
5. Do not design the future state until those branches are resolved or the user explicitly defers them with the resulting risk and ownership recorded. Plan open questions remain limited to genuinely deferrable details.

## 9. Design Executable Vertical Slices

Design the future state only after the evidence report is complete. Follow repository layer ownership and prefer reviewable vertical slices over layer-wide mega-phases.

For each phase and task, specify:

- goal, owning layer, and dependencies;
- verified existing files and explicitly marked new files;
- required skills and rules;
- **Behavior-Bound Test-First Sequencing**: Task N.1 (Red Phase) explicitly authoring failing invariant tests for named Section 3 Scenarios $\rightarrow$ Task N.2 (Green Phase) implementation $\rightarrow$ Task N.3 (Refactor/Registration);
- **Atomic Verification Criteria**: Every task checkbox description states its concrete verification assertion;
- observable acceptance criteria;
- rollback, recovery, or failure-diagnosis behavior;
- effort based on scope, test burden, and unknowns.

Mark security, authorization, privacy, abuse, tenant isolation, federation, localization, accessibility, observability, migration, compatibility, documentation, configuration, and operations as Applicable, Not Applicable, or Needs Investigation with a reason.

Keep the implementation checklist lean:

- Create tasks only for implementation work that changes code, tests, schemas, configuration, or required documentation.
- Fold required tests and documentation into the implementation task that owns the behavior; do not create standalone testing, QA, documentation-review, reporting, or dev-doc maintenance tasks.
- Verify behavioral slices through configured deterministic Ring 1 tests.
- At phase exit use the configured touched build and one canonical integration provider.
- Use actual `project.yaml` command/filter values without inherited flags.
- Keep the inner loop free of avoidable infrastructure; at plan exit exercise
  the real affected entrypoint, including browser/render checks for UI changes.
- Run required final matrices once; repeat checks only after relevant changes
  or new evidence invalidate their prior result.

## 10. Write And Synchronize The Artifacts

Create in the configured clone, or update the sole existing worktree triad.
The following path is relative to that selected execution root:

```text
dev/active/<task>/
├── plan.md
├── context.md
└── tasks.md
```

All three files must contain `Last Updated: YYYY-MM-DD Europe/Brussels`.
Record project identity and task slug as separate fields in `context.md`; do not
encode project identity in the task-local directory name. Cross-check status,
next action, blockers, decisions, risks, phase names, task ids, and validation
commands across the files before stopping.

Link cockpit-relative `islamic-value-sensitive-design/workstreams/i-vsd-<project>-<task>.md` from the plan, context, and tasks artifacts, include its project identity, reviewed-input revision/status and resolved Grill-Me decisions, then revalidate the completed triad through I-VSD planning mode. Every material `IVSD-*` ID must map to a named scenario/task, explicit non-applicability, or escalation gate. A `changes-required` or `escalation-required` disposition blocks plan-aligned status.

Write the maintenance contract into the artifacts themselves so implementation agents do not need to reload this skill repeatedly:

- Maintain strict single responsibility: `plan.md` defines architectural phase boundaries and exit criteria without embedding granular task checklists (`- [ ]`) or session handoffs; `tasks.md` is the sole hot execution ledger; `context.md` is the sole active memory and handoff log.
- `tasks.md` is the hot execution ledger and must be updated during implementation, not by a later cleanup command.
- A substantial task is checked immediately after its implementation acceptance criteria are met; small related tasks may be reconciled together, but never later than phase end.
- Phase verification checkboxes remain separate from implementation checkboxes, and the phase becomes complete only after its build and selected test pass.
- `context.md` is refreshed after a phase, a meaningful decision, a blocker, validation failure, scope discovery, or handoff.
- `plan.md` changes only when scope, architecture, phase order, acceptance criteria, risk, or validation strategy changes.
- On initial implementation and cold resume, agents read task-owned context and the current task first, then retrieve only the plan heading named by that state.
- On an uninterrupted session, agents must not reread unchanged artifacts after every task; they use the current task entry and only reopen the exact section needed.
