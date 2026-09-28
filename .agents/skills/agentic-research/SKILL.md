---
name: agentic-research
description: "Load when asked to research, verify, compare, or look up package behavior, release notes, standards, RFCs, advisories, or unfamiliar APIs; use repository evidence first and official documentation next, not for codebase navigation alone."
type: workflow
enforcement: suggest
priority: high
---

# Agentic Research

## Evidence order

1. Resolve the selected execution root and its native instructions and matching
   skills through the [target workflow](../../../docs/TARGET_WORKFLOW.md), then
   read its license, release contract, code, tests, configuration, and local
   docs. These govern repository behavior.
2. Consult official product, standard, package, runtime, and advisory sources for facts the repository cannot establish.
3. Use broader external sources only for comparison or unresolved ecosystem context. Never import external implementation code.

Maintain a `path or URL + heading/symbol + revision/date + claim` ledger. Separate verified facts, source-backed claims, assumptions, and validation needs. Do not repeat unchanged reads.

## Workflow

1. Turn the question into falsifiable claims and define freshness requirements.
2. Search local evidence first. For architecture navigation use [explore-codebase](../explore-codebase/SKILL.md).
3. Before external queries, load [security boundaries](resources/security-boundaries.md); neutralize proprietary detail and exclude secrets, PII, tokens, and private code.
4. Choose evidence with [source selection](resources/source-selection.md). Prefer normative/version-matched official documentation.
5. Triangulate consequential claims, capture contradictions, and validate applicability against pinned versions and child contracts.
6. Produce a repository-relevant conclusion with citations, confidence, unresolved uncertainty, and a concrete validation method. Do not dump raw search output.

## Resources

- [Source selection](resources/source-selection.md)
- [Security boundaries](resources/security-boundaries.md)
- [Verification matrix](resources/verification-matrix.md)
- [IP clean-room](../ip-clean-room/SKILL.md) for competitor/product research or provenance-sensitive work
- [Context engineering](../../../.agents/CONTEXT_ENGINEERING.md)
- [Governance](../../../docs/GOVERNANCE.md)
- [Target workflow](../../../docs/TARGET_WORKFLOW.md)

## Exit gate

Every material claim has an evidence handle, version/date, applicability check, confidence, and verification path; external implementation expression is absent.
