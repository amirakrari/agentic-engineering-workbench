---
name: criticality-guardrail
description: "Load for Tier 0 sovereign, Tier 1 security, Tier 2 privacy, Tier 3 domain-state, or Tier 4 standard work when rigor must scale with risk; blocks high-criticality implementation until threat boundaries and invariant-breaker verification are explicit."
type: guardrail
enforcement: block
priority: critical
---

# Criticality Guardrail

## Non-negotiable rules

1. Classify the task before editing. Use the highest tier touched; uncertainty raises rather than lowers rigor.
2. Tier 0-2 require the strongest available reasoning capability and explicit alignment on requirements, edge cases, abuse cases, and recovery. Do not code while material boundaries remain ambiguous.
3. Write deterministic invariant-breaker tests before implementation: races, replay, tampering, cross-scope access, unsafe logging, and recovery failures as applicable.
4. Trace callers, callees, persistence, queues/outbox, external effects, authorization, telemetry, and governing decisions. A graph is optional: use it when available, otherwise perform bounded structural search with symbol references, imports, routes, tests, and configuration.
5. Sensitive values must never reach logs, traces, metrics labels, exception messages, or third-party tooling in plaintext.
6. Use expand/contract for rolling changes to shared schemas, protocols, identifiers, or durable state: expand compatibly, migrate callers/data in bounded batches, then contract only after proving zero old consumers.
7. State changes whose external effects must survive retries use a transactional durable-message mechanism or an equivalent repository-native atomicity guarantee.

## Dynamic Tier Execution Matrix

| Stage | Tier 0: Sovereign | Tier 1: Security | Tier 2: Privacy | Tier 3: Domain State | Tier 4: Standard |
|---|---|---|---|---|---|
| Intake | Mandatory decision brief for money, irreversible state, or scarce capacity | Mandatory threat and trust-boundary brief | Mandatory data lifecycle and authority brief | Clarify ambiguous invariants | Use repository defaults |
| Exploration | Exhaustive state, persistence, effects, locks, recovery | Exhaustive identity, policy, isolation, fail-closed paths | Exhaustive collection, storage, telemetry, export, erasure | Bounded callers/callees and flows | Local surface and direct consumers |
| Tests first | Races, duplicate effect, overflow, replay | Scope escape, forged identity, expiry, policy failure | plaintext leakage, resurrection, over-retention | State transitions and integration seams | Focused behavior/render checks |
| Verification | Real dependencies where semantics matter; recovery drill | Provider parity and negative authorization paths | Lifecycle test plus telemetry scan | Affected unit/integration suites | Fast checks plus configured build |
| Review | Epistemic MAD | Epistemic MAD | Epistemic MAD | Independent peer review | Self-review |
| Handoff | State machine, reconciliation, recovery | Threat resolution and isolation evidence | retention, deletion, audit evidence | changed contracts and flows | concise behavior summary |

## Workflow

1. Resolve the intent and tier from `.agents/contract/intents.yaml`; if unavailable, classify from actual effects.
2. Record a self-contained decision brief for Tier 0-2: decision, context, options, recommendation, risks, and exact user input needed.
3. Build a context ledger and blast-radius map. Resolve the clone or worktree
   execution root, active triad, and native target guidance through the
   [target workflow](../../../docs/TARGET_WORKFLOW.md). Child rules, license,
   and release contracts override generic defaults.
4. Select recipes from [adversarial archetypes](resources/adversarial-archetypes.md), subscribe to exact async signals before triggering work, and obtain deterministic RED evidence.
5. Implement fail-closed behavior with the smallest change.
6. Run commands declared in `../../../project.yaml` from the child repository. A command may be a child-relative string or `null`; never invent a replacement for `null`.
7. Run [epistemic MAD review](../epistemic-mad-review/SKILL.md) for Tier 0-2, then report evidence and residual risk.

## Exit gate

- Tier, invariants, blast radius, and governing child contracts are recorded.
- Each named exploit or race has deterministic evidence.
- Required configured checks pass from the child repository.
- No sensitive value appears in captured telemetry.
- Expand/contract stage and rollback/recovery are explicit when durable contracts changed.
