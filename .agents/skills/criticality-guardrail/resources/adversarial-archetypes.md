# Adversarial Test Archetypes

Use these behavior-level recipes without copying framework-specific implementation. Every test must drive a public seam, synchronize on exact events rather than sleeps, and prove the intended failure mode.

## Tier 0: concurrency and duplicate effect

Arrange one remaining unit of scarce capacity and two independently authenticated requests. Subscribe to the transaction/effect completion signal, release both requests through a barrier, and assert exactly one committed transition and one deterministic rejection. Also assert one external effect and a reconciled durable record.

## Tier 0/1: replay and idempotency tampering

Submit a valid request with an idempotency key, then replay the same key with a changed payload. Assert the original result remains authoritative, the mutation is rejected, and no second effect or state transition occurs.

## Tier 1: scope isolation and spoofing

Create resources in scopes A and B. Authenticate as A, then request B's resource through every accepted identifier/header path. Assert fail-closed behavior, no existence disclosure beyond the documented contract, and no cross-scope cache or telemetry leakage.

## Tier 1: expiry and policy outage

Exercise expired credentials, revoked authority, clock boundaries, and unavailable policy dependencies. Assert writes fail closed and any documented read-only degradation is narrow and observable.

## Tier 2: telemetry leakage

Attach an in-memory capture at the real logging/tracing boundary. Send unique sentinel values in every sensitive field. Assert no sentinel appears in messages, structured properties, traces, metrics labels, errors, or outbound diagnostics.

## Tier 2: erasure/resurrection race

Race deletion against queued updates, imports, retries, and backup-derived restore paths using synchronization barriers. Assert the terminal lifecycle rule wins, stale work cannot recreate the subject, and the audit record reveals no erased content.

## Tier 3: invalid state transition

Drive an out-of-order transition through the public application seam. Assert state and durable effects remain unchanged and the documented domain error is returned.

## Evidence contract

Record the invariant, public seam, synchronization mechanism, RED output, GREEN output, and real dependencies used. A mock-only test is insufficient when locking, transactions, policy evaluation, serialization, or delivery semantics are the subject.
