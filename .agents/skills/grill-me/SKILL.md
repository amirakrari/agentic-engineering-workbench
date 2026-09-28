---
name: grill-me
description: "Load when the user asks to be grilled or stress-tested on a plan, OR when starting Tier 0 (Sovereign), Tier 1 (Security), or Tier 2 (Privacy) tasks with underspecified requirements."
type: workflow
enforcement: suggest
priority: medium
---

# Grill-Me & Proactive Criticality Intake

## Rules

- Ask exactly one question per response and wait for the answer.
- Give a recommended answer with a concise rationale before each question.
- Resolve upstream decisions before asking about choices that depend on them.
- When repository evidence can answer a question, inspect the codebase and treat the finding as resolved instead of asking the user.
- **Self-Contained Questions**: Questions must be fully understandable on their own. Never reference bare task IDs, phase numbers, or internal doc sections without explaining their functional context inline. The user must not need to open any implementation plan or task file to answer.
- Continue until every relevant branch is resolved and both sides share the same understanding.

## High-Criticality Intake Decision Trees

When triggered by the [criticality guardrail](../criticality-guardrail/SKILL.md) for high-criticality intents, focus questions on:

1. **Tier 0 Sovereign (irreversible value or authority)**:
   - Finalization races and irreversible state transitions.
   - Value-transfer authority routing between responsible actors.
   - Refund, rollback, and allocation boundaries.
2. **Tier 1 Security (identity, isolation, and schema evolution)**:
   - Identity claim precedence and fail-closed behavior.
   - Cross-scope data isolation and fail-closed defaults.
   - Expand/Contract schema evolution and zero-downtime rolling deployment.
3. **Tier 2 Privacy (personal data and erasure)**:
   - Erasure authority commit ordering (authority-first vs. local purge).
   - Anti-resurrection fencing for erased users.
   - Receipt token entropy and cryptographic hashing.

## Workflow

1. Find the nearest unresolved decision that gates the remaining design.
2. Resolve it from repository evidence when possible; otherwise recommend an answer and ask one question.
3. Use the answer to select the next dependent branch, revisiting earlier decisions when it exposes a conflict.
4. When no relevant branches remain, summarize the agreed decisions, assumptions, and open risks.
