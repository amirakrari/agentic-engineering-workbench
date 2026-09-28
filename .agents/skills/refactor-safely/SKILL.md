---
name: refactor-safely
description: "Load for behavior-preserving rename, move, decomposition, dead-code removal, dependency cleanup, or contract-shape migration requiring caller, flow, test, and impact analysis; not for feature work or trivial cleanup."
type: workflow
enforcement: suggest
priority: high
---

# Refactor Safely

## Rules

- Define observable behavior and lock the consumer seam before changing structure. Do not weaken tests or hide migration gaps behind indefinite compatibility shims.
- Map impact, callers, callees, affected flows, serialization, storage, generated artifacts, and tests. Prefer graph evidence; use bounded structural/LSP fallback when unavailable.
- Use semantic rename/move tooling when available and preview all references.
- Change the innermost owning contract first, then migrate every caller outward. Generated artifacts change through their generator.
- Stop and reclassify if evidence reveals new feature behavior rather than structural transformation.

## Expand/Contract for wide refactors

1. **Expand:** introduce the new contract alongside the old while preserving compatibility and green checks.
2. **Migrate:** move callers, persisted data, and tests in bounded batches; instrument remaining old-form use.
3. **Contract:** prove zero old consumers/data, remove the obsolete form and temporary compatibility, then rerun full contract verification.

Child repository compatibility, release, and schema rules override this generic sequence.

## Workflow

1. Record the behavior contract and blast radius.
2. Add/identify a focused regression at a public seam.
3. Preview the transformation and classify identity, equality, construction, mutability, collection ownership, serialization, presence semantics, framework mutation, and diagnostic privacy where relevant.
4. Make the smallest structural edit and migrate callers without unrelated cleanup.
5. Run diagnostics, affected tests, configured architecture checks/build, and
   one real consumer surface from the execution root resolved by the
   [target workflow](../../../docs/TARGET_WORKFLOW.md).
6. Inspect the resulting diff/flow map for unexpected behavior and report any expand/contract residue.
