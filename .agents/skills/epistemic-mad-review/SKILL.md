---
name: epistemic-mad-review
description: "Load when orchestrating Multi-Agent Debate, adversarial review, or high-criticality deliberation requiring anonymized independent arguments, asymmetric expertise, invariant-breaker tests, and weighted post-hoc voting."
type: workflow
enforcement: suggest
priority: high
---

# Epistemic Multi-Agent Debate Review

## Protocol

1. **Independent asymmetric personas:** choose 2-3 specialists from actual risks (for example security, persistence, performance, privacy, operations). Each receives the same evidence packet and cannot see peers' output.
2. **Absolute anonymization:** strip names, model/vendor identity, role attribution, metadata, and stylistic signatures before cross-evaluation. Label only `Proposal A`, `B`, and so on.
3. **Acyclic topology:** evidence packet -> independent arguments -> optional anonymized cross-evaluation -> post-hoc vote -> synthesis. Never use recursive consensus loops.
4. **Invariant-breakers:** each claimed defect must include a reproducible failure scenario and deterministic test/probe; avoid fixed sleeps and mock-only proof of integration semantics.
5. **Weighted post-hoc vote:** assign weights before viewing conclusions. Primary domain expertise totals 60%; independent secondary expertise totals 40%. Record scores and dissent rather than forcing consensus.

## Workflow

1. Freeze review scope, revision, governing invariants, acceptance criteria, and evidence handles.
2. Generate independent findings with severity, confidence, location, failure mechanism, and proposed test.
3. Normalize and anonymize arguments; merge exact duplicates without deleting dissent.
4. Cross-evaluate only material conflicts, using identical anonymized packets.
5. Aggregate weighted votes. A high-severity plausible defect remains a blocker until falsified even if outvoted.
6. Synthesize structured YAML/JSON with validated findings, rejected claims and reasons, required patches/tests, weights, uncertainty, and residual risk. Identity attribution must be absent.

## Verification

- Check artifacts for identity leakage.
- Check weights total 100 and were assigned by domain relevance.
- Every accepted correctness/security claim has a deterministic reproduction or explicit validation gap.
- Minority dissent and unresolved evidence are preserved.
