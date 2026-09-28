# EF Core Persistence Reference

> Optional EF Core example. Apply only to children already using compatible versions and patterns. Child architecture, provider support, compatibility, contribution, and license policy prevail.

## Context And Mapping

- Keep `DbContext` scoped to a unit of work; pooled contexts must not capture unsafe scoped state.
- Discover `IEntityTypeConfiguration<T>` mappings consistently when that is the child convention.
- Keep database defaults, provider types, relationships, and delete behavior in persistence configuration rather than domain entities.
- Choose inheritance mapping, key generation, and relationship deletion from child requirements; no one strategy is universal.
- Preserve semantic values in stable scalar columns unless separate identity/query needs justify a different model.

## Repository Boundary

Interfaces normally live inward and implementations in Persistence. Return entities or deliberately owned read models, not transport DTOs or `IQueryable`. Use `AsNoTracking()` for read-only entity loads unless identity resolution/tracking is required later. Apply filters, ordering, and pagination before materialization.

## Isolation And Global Filters

Separate named filters for concerns such as soft deletion and tenancy where the supported EF version permits selective disablement:

```csharp
modelBuilder.Entity<Item>()
    .HasQueryFilter("SoftDelete", item => !item.IsDeleted)
    .HasQueryFilter("Tenant", item => item.TenantId == currentTenantId);
```

Keep filters enabled by default. Disable only the exact filter required by an explicit administrative, audit, or migration flow. Unqualified `IgnoreQueryFilters()` can disable isolation and is usually unsafe in request paths. Pin wrong-scope behavior with adversarial tests.

## Migrations

Migration files and model snapshots are generator-owned artifacts.

1. Change the model/configuration or repository migration generator.
2. Generate through the child command.
3. Inspect generated operations and provider SQL.
4. Run pending-model detection and real-provider lifecycle tests where required.
5. Apply only through the reviewed rollout path.

Never edit or remove an applied migration. Create a generated corrective migration. Remove and regenerate only an unapplied development migration using supported tooling. Keep changes focused and names descriptive.

For expand/backfill/contract work, prevent startup automation from collapsing stages. Backfills must be restartable, bounded, observable, and compatible with old/new application versions according to child policy.

## Seeds And Constraints

- Stable lookup IDs/codes need explicit parity and idempotent missing-row repair.
- Insert migration-dependent rows before backfills that consume them.
- Validate malformed-row behavior and generated constraint SQL for every supported provider.
- Some providers apply constraint DDL non-transactionally; use a bounded, sensitive-data-free preflight before multi-constraint changes.
- Do not assume one provider's collation, null semantics, type syntax, or index behavior elsewhere.

## Transactions

Keep related writes atomic. Do not perform remote I/O inside a database transaction. Store outbox intent atomically, then dispatch after commit. Retry handling must distinguish transaction retries from message-delivery retries and preserve idempotency.

## Query Defaults

- Project only required columns for summaries.
- Use includes when the entity graph is needed; consider split queries for proven collection join explosion.
- Preserve filters, authorization, ordering, and result semantics.
- Parameterize raw SQL and use it only after measured need.

## Verification

From the resolved clone or task-worktree Cwd, run model/pending-change checks,
focused persistence tests, architecture checks, each supported provider's
behavioral tests, and configured build. Review generated SQL for destructive
changes and exercise migration/rollback according to the child's release policy.
