# CTO Consultation Framework

## Contract
Classify the decision as product, architecture, infrastructure, workflow, governance, or organization. State whether conclusions use repository evidence, current external research, or explicit assumptions. Date and cite volatile market, vendor, legal, pricing, licensing, and library claims.

## Context Discovery
1. Read `project.yaml` and the
   [target workflow](../../../../docs/TARGET_WORKFLOW.md); validate the
   configured clone, main/base branches, lifecycle, selected execution root,
   and supported child-relative commands. `null` means unsupported and commands
   never contain `cd`.
2. Read applicable child product, architecture, security, operations, licensing, contribution, and release policy. Child policy is authoritative.
3. Inspect relevant code, tests, configuration, history, and callers. Use a graph when useful, with bounded LSP/search and direct-read fallback.
4. Distinguish fact, inference, assumption, forecast, and recommendation.
5. Name missing evidence that could reverse the decision.

## Decision Lenses
| Lens | Ask |
|---|---|
| Value | Which user or operator outcome changes and how is it measured? |
| Authority | Who owns truth, policy, execution, override, and appeal? |
| Trust | Where are identity, authorization, validation, and data boundaries enforced? |
| Data | Is state durable, derived, cached, personal, sensitive, portable, or erasable? |
| Deployment | Which environments and modes must work; which dependencies are optional? |
| Operations | What changes in secrets, health, backup, restore, upgrade, rollback, retention, and support? |
| Integration | Which APIs, schemas, generated outputs, webhooks, imports, or providers change? |
| Extensibility | Is the need core, a typed extension, or governed custom data? |
| Exit | How can the project reverse, replace, export, or retire the choice? |

Never assume SaaS, self-hosting, enterprise scale, multi-tenancy, greenfield status, public reads, or a protocol. Derive each from child evidence.

## Recommendation
Provide the decision, current facts, two to four realistic options (including defer or experiment), weighted criteria, one recommendation, rejected alternatives and revival triggers, the worst credible break with detection/containment/recovery, reversible implementation slices, verification, and dated revisit triggers.

Score options across value, differentiation, implementation, migration, security, privacy, operating cost, team capability, deployment compatibility, licensing, lock-in, interoperability, and reversibility. High complexity requires proportional validated value or risk reduction.

## Infrastructure Optionality
Classify dependencies as required, optional profile, internal detail, or operator-facing control. For each, cover ownership, versioning, secrets, health, degradation, backup, restore, upgrade, rollback, observability, cost, and replacement. Diagnostic dashboards are not product truth.

## Build vs Buy
Evaluate differentiation, integration and migration cost, security ownership, uptime and support dependency, pricing cliffs, data portability/deletion, license compatibility, vendor viability, internal capability, and exit. Prefer a bounded experiment when assumptions can be measured cheaply; define adoption and rejection thresholds.

## Market, Legal, and Standards
Compare product categories before named vendors and verify current claims. Describe technical controls rather than presenting jurisdiction-specific legal conclusions. Route legal and license interpretation to qualified counsel with a concrete technical record.

## Boundary
Consultation can propose slices but cannot authorize code edits, purchases,
migrations, commits, pushes, or PRs. Later implementation routes through
planning: the triad starts under the configured clone's
`dev/active/<task>/`. In-tree execution keeps it there; authorized
isolated execution moves the whole folder to the selected in-clone worktree.
