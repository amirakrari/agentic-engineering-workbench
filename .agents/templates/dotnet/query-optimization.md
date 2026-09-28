# EF Core Query Optimization Reference

> Optional measurement-first reference for children already using EF Core. Child provider support, repository boundaries, compatibility, and license policy prevail.

## Preserve Semantics First

Before optimizing, pin tenant/account filters, authorization predicates, ordering, pagination, null/collation behavior, tracking expectations, and result shape. Repositories should not leak `IQueryable` merely to move optimization responsibility outward.

Measure query count, generated SQL, duration, rows, allocations, and representative cardinality before and after. A syntactically smaller query is not evidence of lower cost.

## Diagnostic Categories

- N+1 from lazy loading or per-row repository calls.
- Over-fetch from loading full entities/graphs for summary output.
- Cartesian expansion from multiple collection includes.
- Unneeded tracking on read-only loads.
- Premature materialization before filters/projection/pagination.
- Repeated query compilation on a proven hot path.
- Missing/ineffective indexes, spills, sorts, or poor join estimates.
- Provider-specific translation, collation, or null-semantics differences.

## Smallest-Fix Ladder

1. Move filters and ordering before materialization.
2. Replace existence `Count` with `Any`.
3. Project only fields needed by the read model.
4. Remove lazy loading or repository calls from loops.
5. Add `AsNoTracking()` for genuinely read-only entity loads.
6. Use identity resolution only when duplicate instances matter.
7. Use explicit includes only when a full entity graph is needed.
8. Consider `AsSplitQuery()` for measured collection-join explosion, accounting for extra round trips and consistency.
9. Use compiled queries only when measurements show compilation overhead is material.
10. Use parameterized raw SQL only after the higher-level query shape cannot meet requirements.

## Inspection

`ToQueryString()` helps inspect translation but does not execute the query or prove performance. Enable completed database-command diagnostics without sensitive parameter values in a safe local environment. Never enable sensitive-data logging in shared or production environments.

For PostgreSQL, `EXPLAIN (ANALYZE, BUFFERS)` with representative parameters can reveal index use, rows, sort/spill behavior, join cardinality, and I/O. A sequential scan is not automatically wrong for small or low-selectivity sets. Other providers require their own plan tools and behavior tests; do not apply one engine's assumptions universally.

## Index Decisions

Add an index only for a measured access pattern. Consider equality/range order, sort order, selectivity, filtered/partial predicates, included columns, write cost, storage, and migration rollout. Verify the planner uses it under representative data, then document why it exists.

## Tracking And Writes

A read-only optimization can break later updates if callers relied on tracked entities. Trace all callers before adding no-tracking or projection. Keep command paths explicit about load-for-update semantics and concurrency tokens.

## Test Data

Tiny fixtures hide N+1 and plan regressions. Use representative cardinality and distribution without production personal data. Query-count assertions should observe the real integration boundary and avoid provider mocks that cannot reproduce translation.

## Verification

From the resolved clone or task-worktree Cwd:

- compare before/after query count, SQL, rows, duration, and allocation evidence;
- run the caller's integration test with realistic volume and isolation/authorization cases;
- inspect plans for measured hot paths;
- run each supported provider's behavioral checks;
- run configured build and targeted tests once;
- revert speculative changes that do not improve the measured bottleneck.
