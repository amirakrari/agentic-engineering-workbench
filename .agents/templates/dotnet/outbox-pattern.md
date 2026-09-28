# Transactional Outbox Reference

> Optional .NET/relational-storage example for systems requiring reliable post-commit delivery. Child architecture, data-store semantics, compatibility, operations, and license policy prevail.

## Reliability Contract

Write business state and outbox intent in the same database transaction. A background processor claims committed messages and dispatches them after commit. Delivery is at least once: dispatchers and consumers must tolerate duplicates. Never perform remote I/O inside the business transaction and never claim exactly-once delivery.

## Message Model

A practical record contains:

| Field | Purpose |
|---|---|
| `Id` | Globally unique, preferably time-ordered where supported |
| Aggregate type/id | Source identity and diagnostics |
| Event type/version | Dispatch routing and payload compatibility |
| Payload | Serialized, versioned event data |
| Status | Pending, Processing, Completed, Failed, DeadLettered |
| Created/processed timestamps | Ordering and retention |
| Retry count / next retry | Backoff scheduling |
| Last error | Bounded, redacted diagnostics |
| Max retries / dead-letter timestamp | Terminal failure policy |

Use database-generated time-ordered UUIDs only where provider/version support is explicit. Payload storage may use JSON-capable types, but schema/version compatibility remains part of the event contract.

## State And Claiming

Expected transitions are Pending -> Processing -> Completed, or Processing -> Failed -> Processing on retry, with Failed -> DeadLettered after the configured limit. Claim optimistically and return false on contention rather than treating another worker's claim as an exception.

A relational claim can be a conditional update on `id` and `status = Pending`, with row-lock/skip-locked variants where supported. Design for a worker crash after dispatch but before completion; this is why consumer idempotency is mandatory.

## Polling And Retry

A periodic worker is simple and portable. Configuration should expose enabled state, poll interval, batch size, retry limit, initial delay, maximum delay, and diagnostic verbosity. Exponential backoff is commonly:

```text
delay = min(initialDelay * 2^retryCount, maximumDelay)
```

Add jitter if the child standard requires it. Avoid fixed sleeps in tests: subscribe to completion/state change before triggering work and await it with a bounded timeout.

## Dispatcher Contract

```csharp
public interface IOutboxDispatcher
{
    Task DispatchAsync(OutboxMessage message, CancellationToken cancellationToken);
}
```

Dispatchers throw on failure so the processor owns retry/dead-letter transitions. Distinguish transient and permanent failures when useful. A logging/no-op dispatcher may be a safe development default only if startup and operations make the non-delivery state unmistakable.

## Idempotency

Consumers can record processed message IDs, use naturally idempotent upserts/conditional writes, or enforce a domain idempotency key. A producer-side dedup index helps accidental duplicate creation but does not remove duplicate delivery.

Keep independent outbox variants separate when their payload, ownership, retention, or processor semantics differ. Shared infrastructure is acceptable only when it does not erase domain-specific contracts.

## Indexes And Operations

Index pending polling by status, next retry, and creation order. Add aggregate lookup only when operations need it. Monitor failed/dead-letter counts, age of oldest pending item, dispatch latency, retry rates, and processor health. Retain dead letters until an explicit replay/discard decision; clean completed records by reviewed retention policy.

## Verification

From the resolved clone or task-worktree Cwd, test atomic business+outbox
commit, rollback, concurrent claims, duplicate dispatch, transient backoff,
permanent dead-letter, cancellation, worker restart, and idempotent replay.
Exercise metrics/logs and operator recovery. Run configured build/tests and real
database checks for each supported provider.
