# Planning Quality Gates

## Intake And Ethical Alignment

- The actual I-VSD report is linked with revision, date, current status and
  plan-aligned disposition after triad revalidation.
- Every material `IVSD-*` finding/mitigation maps to a scenario/task, justified
  non-applicability or named escalation gate.
- Provider authority, affected stakeholders, harms, mitigation and uncertainty
  are explicit. A technical choice does not substitute for ethical analysis.
- Material product/architecture/failure questions are resolved from evidence or
  focused `grill-me` decisions; already supplied answers are reused.

## Evidence

- Existing paths, symbols, tests, settings and contracts have source evidence.
- Proposed or missing items are labeled, never described as implemented.
- Facts, constraints, decisions, assumptions and unknowns remain distinguishable.
- Related work is checked for overlap without inspecting unrelated private state.
- Graph absence has a bounded LSP/search fallback and explicit coverage limits.

## Contract And Executability

- All matching intents, highest criticality, paths, tests, docs and forbidden
  actions are reflected.
- Behavioral/non-behavioral delta is declared. Observable SHALL/MUST requirements
  have WHEN/THEN scenarios; internal design stays in Architecture.
- Every task has exact files or bounded discovery, dependencies and an observable
  completion assertion. Non-deferrable choices are not parked as open questions.
- High-risk invariants have a Red-before-Green sequence and public-seam oracle.
- Tests do not mirror mocks, source prose or framework implementation mechanics.
- The child's compatibility, architecture, license and release policies govern.
- Every coherent increment has a declarative commit packet, with actual release
  metadata and authorization state; no source-only validator is assumed.

## Verification

- Ring 1 uses configured deterministic in-memory slices.
- Ring 2 uses the touched build and one relevant canonical integration provider.
- Ring 3 covers required complete matrices and actual affected entrypoints once
  at exit. UI work includes appropriate render/browser checks.
- Commands resolve from `project.yaml`, execute at the child Cwd, and contain no
  inherited stack flags or second `cd`. Null checks are explained or remain open.
- Direct regressions and induced ripples block completion; unrelated rot is
  quarantined only with untouched-base reproduction.
- No product builds/tests run just to author a plan or edit workflow prose.

## Fowler 12-Smell Baseline

Review the [canonical two-axis baseline](../../review-changes/SKILL.md), including
all twelve named smells. Record only evidence relevant to the intended outcome;
smell discovery does not authorize unrelated refactoring.

## Continuity

- All three artifacts agree on project, scope, status, phases, acceptance,
  risks, I-VSD revision/disposition, CTO review and user approval.
- `plan.md` owns architecture; `tasks.md` owns executable checkboxes;
  `context.md` owns compact current state.
- Task state changes are recorded immediately. Context remains below 300 lines
  and 15 KB, retaining open blockers and failed gates.
- The sole triad starts clone-local and moves as a whole into the task worktree
  only after destination/ownership/exclusion checks; in-tree work does not move it.
- Target root/scoped instructions and relevant native skills were discovered;
  exact skill paths and target-first conflict resolutions are recorded.
- Shared lessons go to cockpit `knowledge/`; task backlog/notes remain clone-local
  and excluded. Ignored files are retained before authorized worktree cleanup.

## Scope And Handoff

Planning changes only its authorized artifacts and narrowly scoped shared local
exclusions, not product code, upstream `.gitignore`, global settings or Git topology.
No commit, publication or destructive cleanup is implied.

Present a self-contained executive brief: proposed outcome and architecture,
descriptive phase roadmap, key decisions/trade-offs, worst break and risks, exact
approval question if needed, and immediate next action. Do not claim the feature
works when only the plan exists.

For skill changes, validate frontmatter, links, routing and whitespace. For the
plan itself, inspect evidence, consistency and acceptance completeness. Future
implementation suites belong to implementation.
