# Output Template — Chat Response Structure

Senior CTO feedback **never** writes or generates any `*-cto-review.md` or
feedback files beside the actual clone/worktree-local
`dev/active/<task>/` triad. Zero review files on disk.

Instead:
1. **Direct Triad Refinement**: 100% of the CTO's review brain and architectural rigor goes directly into updating the workstream triad in place:
   - Execution-root-relative `dev/active/<task>/plan.md`
   - Execution-root-relative `dev/active/<task>/context.md`
   - Execution-root-relative `dev/active/<task>/tasks.md`
   Resolve the sole existing triad first; review never moves it or recreates a
   clone copy after isolated execution began.
2. **Authorized Refinement**: Apply requested refinements without repeated
   permission. For an explicit read-only review, report findings without edits
   and describe recommendations as proposed rather than applied.
3. **Crisp Chat Reporting**: All findings, decisions, and applied modifications are reported back to the user in a crisp, high-signal chat response.

## Required Chat Response Structure

The finishing chat response must follow this structure:

```markdown
## Senior CTO Feedback & Triad Refinements Applied

### Executive Verdict & Direction
**Verdict:** [Approved as Refined | Split Applied | Scope Pruned & Aligned]
[A direct, punchy 2-3 sentence executive statement explaining the architectural assessment, why the triad was updated, and the overall readiness of the workstream.]

---

### Key Decisions Made
- **[Decision 1 — e.g. Architectural Boundary]**: [Decision summary, e.g., Enforced server-side server-provided affordances and moved validation out of frontend framework UI into request orchestration command pipeline.]
- **[Decision 2 — e.g. Compatibility]**: [Preserved or replaced a contract under the target's evidenced lifecycle policy.]
- **[Decision 3 — e.g. Sequencing / PR Right-Sizing]**: [Proposed a coherent split, or applied an explicitly accepted deferral to the locally excluded clone backlog.]
- **[Decision 4 — e.g. Invariant Verification]**: [Mandated failing Red-phase tests for concurrency race on order capture before handler implementation.]

---

### Changes Applied to the Triad

#### 1. Implementation Plan (`plan.md`)
- **Architecture & Boundaries**: [Key modifications made in Section 5]
- **Behavioral Scenarios**: [Added/refined WHEN/THEN specifications in Section 3]
- **Phasing & Exit Criteria**: [Restructured phases, clarified exit criteria]
- **Breaking Changes**: [Explicitly documented deleted legacy paths in Section 12]
- **Metadata**: Updated CTO Review status to `Applied & Aligned (YYYY-MM-DD)`

#### 2. Context (`context.md`)
- **Quick Resume & Status**: [Synchronized active status, updated NEXT pointer to Phase 1 Red task]
- **Key Decisions**: [Recorded architectural forks, breaking change positions, and scoping boundaries]
- **Validation Baseline**: [Updated targeted test commands and baseline verification checks]
- **Blockers & Risks**: [Removed stale items, documented active dependency gates]

#### 3. Task Checklist (`tasks.md`)
- **Test-First Invariant Ordering**: [Restructured tasks into explicit Task N.1 Red Phase (failing tests) -> Task N.2 Green Phase (handler) -> Task N.3 Refactor]
- **Anti-Tautology**: [Replaced shallow mock assertions with domain invariant and contract assertions]
- **Atomic Commit Contracts**: [Authored complete Conventional Commit packets for every phase, with path-limited git commands and benefit-led titles]
- **Scope Right-Sizing**: [Pruned un-actionable tasks; graduated deferred items to backlog]

---

### Top Risks Resolved / Mitigated
- **"The Worst Break" Adversarial Scenario**: [Named catastrophic failure mode and how the Red phase invariant test prevents it]
- **Tenant Isolation & Security**: [How fail-closed tenant checks or authz boundaries were tightened]
- **Delivery & Rollback**: [How migration safety or self-hoster recovery was ensured]

---

### Execution Readiness & Next Step
[Clear, direct guidance on the exact next step for the developer or implementing agent to run, e.g.:
"The triad is fully refined and execution-ready. Begin implementation with **Phase 1, Task 1.1** (authoring the failing invariant tests in `tests/...`). Run:
the verified `commands.test_unit` and `commands.test_filter` from the selected configuration, with the child Cwd."]
```

## Answer Style Rules

- **Zero review markdown files**: Never create `*-cto-review.md` beside the
  actual clone/worktree-local `dev/active/<task>/` triad.
- **Direct in-place edits**: Requested refinement edits the canonical triad;
  explicit read-only review leaves it untouched.
- **Durable triad preservation (Never chat-only)**: Chat is strictly an executive summary. All technical rigor, scorecards, worst-break invariants, and risk mitigations MUST be written into `plan.md`, `context.md`, and `tasks.md` first. Never leave critical review insights only in ephemeral chat.
- **Start with the verdict**: Be decisive and direct.
- **High-signal, bounded length**: Crisp and clear—do not overwhelm the user with walls of text, but never skip critical technical details (concrete class names, endpoints, test classes).
- **Concrete evidence**: Cite real project paths, types, commands, and phase numbers.
- **No generic praise**: Provide blunt, senior architectural leadership.
