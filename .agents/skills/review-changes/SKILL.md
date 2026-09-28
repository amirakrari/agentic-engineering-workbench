---
name: review-changes
description: "Load when reviewing a local diff for correctness, regressions, blast radius, affected flows, code smells, and missing tests; use review-pr for intent checklist and merge readiness."
type: workflow
enforcement: suggest
priority: high
---

# Review Changes: Two Independent Axes

Never let clean code mask missed requirements, or correct behavior mask structural risk.

## Axis 1: Standards and Fowler 12-Smell Baseline

| Smell | Review question |
|---|---|
| Mysterious Name | Do names reveal domain intent? |
| Duplicated Code | Is the same logic shape repeated? |
| Feature Envy | Does behavior belong with data it mostly uses? |
| Primitive Obsession | Are domain concepts represented as unvalidated primitives? |
| Data Clumps | Do the same related values travel together? |
| Shotgun Surgery | Does one change require scattered unrelated edits? |
| Divergent Change | Does one unit change for unrelated reasons? |
| Speculative Generality | Is unused abstraction present? |
| Message Chains | Does navigation expose excessive structure? |
| Middle Man | Does a layer only delegate? |
| Repeated Switches | Is type/state branching duplicated? |
| Refused Bequest | Does inheritance expose behavior a subtype rejects? |

Also check child repository rules, security/privacy, error handling, concurrency, data compatibility, and test quality.

## Axis 2: Spec and Intent Fidelity

Map every acceptance criterion and explicit exclusion to diff evidence and tests. Check edge cases, failure behavior, scope creep, omitted docs/migrations/operations, and whether the user-visible result matches the request.

## Workflow

1. Establish merge-base/diff scope without mutating remote state.
2. Map changed symbols to callers, callees, flows, tests, and durable contracts. Use graph analysis if available; otherwise bounded structural/LSP search.
3. Review Axis 1 and Axis 2 separately.
4. Validate suspected defects against source and executable evidence. Do not report style preferences as defects.
5. Order findings by severity; each finding includes location, violated invariant, concrete failure scenario, and smallest correction. If none, say so and note residual testing gaps.

## Output

`Standards & Code Smells`, then `Spec & Intent Fidelity`, then `Verification Gaps`. Findings come first; summaries never bury blockers.
