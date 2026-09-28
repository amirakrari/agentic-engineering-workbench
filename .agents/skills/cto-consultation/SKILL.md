---
name: cto-consultation
description: "Load when the user asks for CTO advice on product strategy, architecture, build-vs-buy, infrastructure, market position, roadmap, deployment, cost, or organizational trade-offs; not for review of an existing implementation-plan triad."
type: workflow
enforcement: suggest
priority: high
---

# CTO Consultation

## Context
- [AGENTS](../../../AGENTS.md)
- [Quick reference](../../../docs/QUICK_REFERENCE.md)
- [Governance](../../../docs/GOVERNANCE.md)
- [Operations](../../../docs/OPERATIONS.md)
- [Context engineering](../../../docs/AGENTIC_CONTEXT_ENGINEERING.md)
- [Documentation architecture](../../../docs/DOCUMENTATION_ARCHITECTURE.md)
- [Documentation style](../../../docs/DOCUMENTATION_STYLE_GUIDE.md)
- [IP governance](../../../docs/legal/IP_GOVERNANCE.md)
- [Target workflow](../../../docs/TARGET_WORKFLOW.md)
- [Consultation framework](resources/consultation-framework.md)

Resolve the configured clone and its native instructions through the target
workflow. Read applicable product, architecture, security, operations,
licensing, contribution, and release policies there. Child policy overrides
cockpit defaults.

## Invariants
1. Separate verified facts, assumptions, forecasts, value judgments, and recommendations.
2. Define the decision, stakeholders, constraints, horizon, reversibility, and success measures before comparing options.
3. Map authority and trust boundaries; do not collapse operator, organization, user, client, service, and infrastructure roles.
4. Treat optional dependencies as explicit deployment choices with health, fallback, cost, recovery, and documentation impact.
5. Evaluate build-vs-buy through differentiation, total cost, lock-in, exit, security, operations, licensing, and team capability.
6. Never assume enterprise, self-hosted, SaaS, multi-tenant, greenfield, or public-read semantics.
7. Date and cite market, legal, pricing, vendor, and library claims; label uncertainty.
8. Recommend one option with rejected alternatives, triggers that change the decision, a phased path, risks, and exit criteria.
9. A graph is optional; use bounded LSP/search and direct reads when absent or stale.
10. Advice does not authorize implementation, commits, pushes, purchases, migrations, or PRs.

## Output
1. Decision and recommendation
2. Verified current facts and child-policy constraints
3. Options and explicit criteria
4. Trade-off scorecard and rejected alternatives
5. Worst credible failure and mitigations
6. Cost, security, operations, licensing, and exit impact
7. Phased experiment or implementation path
8. Verification, documentation, and revisit triggers

## Verification
Every factual claim has a repository source, dated external source, or uncertainty label; the recommendation covers reversibility, cost, operations, security, licensing, and child policy; no implementation or publication action occurred.
