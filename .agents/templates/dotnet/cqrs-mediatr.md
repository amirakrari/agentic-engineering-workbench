# CQRS and MediatR Reference

> Optional .NET example. Do not introduce CQRS or MediatR into a child that does not already need them. Child architecture, compatibility, contribution, and license rules prevail.

## Contract Shape

- Commands express requested state changes; queries express reads.
- Concrete requests and results should be immutable valid-state values. Positional records suit short stable contracts; nominal `init`/`required` members suit long, optional, attributed, or presence-sensitive contracts.
- Requests carry client intent, not current authority. Trusted adapters supply current identity and scope.
- Use named success/failure factories when a result can otherwise represent contradictory states.
- API failures should use the child's standard error envelope; RFC 7807 is a common HTTP choice.

## Handler Boundary

Handlers orchestrate one use case:

1. Validate input using the child's established validation mechanism.
2. Load entities through repositories or focused read ports.
3. Invoke domain behavior.
4. Persist through the owning transaction boundary.
5. Map entities to application results/read models.
6. Propagate `CancellationToken` through every asynchronous call.

Do not access a concrete `DbContext` from Application when the child architecture forbids it. Do not return `IQueryable`. For multi-entity writes, use the established unit-of-work/transaction mechanism. Persist durable side-effect intent in the same transaction when delivery occurs after commit.

## Endpoint Adapter

Keep controllers/minimal endpoints transport-only: parse input, dispatch a request, map the result to status/headers/body. A typical REST mapping is:

| Outcome | Typical status |
|---|---|
| List/detail success | 200 |
| Create success | 201 plus location |
| Delete success | 204 |
| Shape/validation failure | 400 |
| Unauthenticated / forbidden | 401 / 403 |
| Missing / conflict | 404 / 409 |

These are examples, not imposed conventions. Preserve the child's existing protocol and version compatibility. Rich failure vocabularies should use a centralized mapping policy rather than endpoint-specific switch chains.

## Query Practices

- Return DTOs/read models, not mutable command envelopes.
- Preserve deterministic ordering before pagination.
- Use immutable specification composition when that is the child pattern.
- Read-through caching belongs around a stable query result; mutation invalidates affected keys only after the owning write succeeds.
- Keep authorization predicates and scope filters in the server-owned path.

## Testing Boundaries

Mock external systems you do not control, such as payment/email providers, time, or randomness. Prefer real domain objects and realistic persistence fixtures over mocking internal handlers or aggregates. Tests should pin:

- request construction and equality consumed by callers;
- validation and result-state mapping;
- trusted authority injection;
- transaction and cancellation propagation;
- endpoint status/error mapping;
- cache invalidation and idempotency where relevant.

## Minimal Structural Example

```csharp
public sealed record RenameItem(Guid ItemId, string Name) : IRequest<RenameResult>;

public sealed class RenameItemHandler(IItemRepository repository)
    : IRequestHandler<RenameItem, RenameResult>
{
    public async Task<RenameResult> Handle(RenameItem request, CancellationToken ct)
    {
        Item item = await repository.GetRequiredAsync(request.ItemId, ct);
        item.Rename(request.Name);
        await repository.UpdateAsync(item, ct);
        return RenameResult.Success(item.Id);
    }
}
```

Adapt interfaces, validation, and result style to the child; this snippet establishes no dependency requirement.

## Verification

From the resolved clone or task-worktree Cwd, run focused handler and endpoint
tests, architecture checks when dependency direction changes, the configured
build, and a real request exercise when safely runnable. Confirm public
compatibility and license acceptance before adding packages.
