# Clean Architecture Reference for .NET

> Optional example only. Use it only when the child repository already follows compatible layering. Child architecture, compatibility, contribution, and license policy prevail.

## Layer And Dependency Model

A common inward dependency direction is:

| Layer | Owns | May depend on |
|---|---|---|
| Domain | Entities, value objects, lifecycle invariants, domain events | Runtime primitives only |
| Application | Use cases, commands/queries, ports, validation, result contracts | Domain |
| Persistence/Infrastructure | Database mappings, repositories, external adapters | Application and Domain |
| Presentation | HTTP/UI transport and composition | Inner layers as child policy permits |

Keep framework types out of Domain. Application should not reference concrete persistence. Adapters implement ports defined inward. Presentation translates transport concerns instead of pushing status codes or rendering models into use cases.

## Placement Decisions

- Business invariant: Domain.
- Use-case orchestration and authorization request: Application.
- Database access or mapping: Persistence.
- External provider: Infrastructure behind an operation-specific port.
- HTTP, serialization, rendering, or composition: Presentation.

Entities with identity and lifecycle normally remain classes. Small semantic values may use immutable value types. Select class/record/struct from behavior, equality, and compatibility rather than a layer-wide conversion rule.

## Boundary Rules

- Repositories return domain entities or child-approved projections, never a provider query object that leaks persistence outward.
- Transport DTOs do not become domain models. Map at the owning boundary.
- Generated contracts remain generator-owned; do not create handwritten mirrors merely to bypass generation.
- Current user/tenant authority comes from a trusted adapter, not request-body identifiers.
- Concentrate invariants and state transitions in the owner. Prefer a deep module over pass-through services.

### Deletion Test

Imagine deleting an intermediate wrapper. If complexity disappears, the wrapper probably adds no value. If invariant handling scatters across callers, the module is earning its place and should own that complexity explicitly.

## Common Violations And Repairs

| Violation | Repair |
|---|---|
| Domain references ORM or web framework | Move mapping/configuration to the adapter layer |
| Application consumes `DbContext` | Depend on a focused repository/port |
| Handler returns `IActionResult` | Return an application result; map it in the endpoint |
| Infrastructure references controllers/components | Pass data through inward-defined contracts |
| Repository returns presentation DTOs | Return entities or a deliberately owned read model |
| Business rules live in controllers | Move invariant to Domain or use-case owner |
| Generic gateway exposes `Send(object)` | Expose typed provider operations |

## Refactor Sequence

1. Map the contract from domain ownership through use case, adapters, public schema, and consumers.
2. Pin behavior and compatibility with focused tests.
3. Change the innermost owner first.
4. Migrate outward callers in one coherent slice; use a compatibility shim only when child policy requires a staged migration.
5. Remove obsolete paths after all callers move.

## Verification

From the resolved clone or task-worktree Cwd, run child-declared architecture
tests, focused behavior tests, and the configured build. Inspect project
references for inward dependency direction and verify the real public contract
when boundary shape changes.
