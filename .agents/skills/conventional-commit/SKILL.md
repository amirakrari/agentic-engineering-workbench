---
name: conventional-commit
description: "Author or review atomic commit messages and declarative commit contracts, including material changes to an approved packet; not for implementing code or re-reading a still-truthful packet."
type: guardrail
enforcement: block
priority: high
---

# Conventional Commits

Child contribution, release, signing and history policy governs. Explicit commit
authorization does not imply push, PR, merge or history-rewrite authorization.

## Fourteen Invariants

1. **Smallest releasable slice:** one independently reviewable outcome, including
   only the layers and artifacts needed for that behavior.
2. **No orphaned generated code:** generator inputs and corresponding outputs
   travel together.
3. **Meaningful scope:** use target-approved capability or engineering scopes,
   not invented layer names. `api` is valid when it names the public capability.
4. **Cross-domain precedence:** use the initiating capability for a coherent
   multi-layer outcome rather than expanding scope to absorb unrelated work.
5. **Subject quality:** imperative, concrete benefit, understandable without the
   conversation; no vague “update things.”
6. **Breaking metadata:** use `!`/`BREAKING CHANGE:` when the target adopts that
   contract; include its required change fragments and migration explanation.
7. **Internal work:** apply the child's changelog policy. Use skip trailers only
   when it requires them; never invent a universal trailer validator.
8. **Safe staging:** inspect the index, stage exact owned paths, and preserve
   unrelated staged work. Path-limited commits isolate files, not mixed-author
   hunks; coordinate when another contributor changed the same file.
9. **Self-sufficient packet:** record type/scope, subject, rationale, release
   treatment, target-required trailers, literal file paths and verification.
   Execution supplies native Git commands, not a generated shell program.
10. **Material divergence:** replace a packet only for changed outcome, split,
    release classification or factual invalidity. Record why and the full new
    contract; stylistic preference is not sufficient.
11. **Execution authority:** show the intended slicing unless already requested.
    Execute a truthful approved commit instruction without repeated permission,
    but plan existence alone does not imply the user requested commits.
12. **History integrity:** preserve published history and target release rules.
    Release-metadata commits follow the child's documented protocol, not a
    fictional universal special commit. Rewriting requires explicit authorization.
13. **Oversized gate:** a large dirty tree calls for more clustering, not one
    umbrella commit covering unrelated behavior, docs and cleanup.
14. **Rare indivisible exception:** retain a large mechanical transformation or
    generated set only when splitting makes an intermediate state invalid.
    State that necessity; “same feature” or “all pending work” is not evidence.

## Generic Scope Registry

| Category | Examples |
|---|---|
| Public | auth, api, ui, search, notifications, privacy, storage, payments |
| Engineering | ci, deps, arch, database, observability, docs, release, testing, build |

These are fallback examples, not a new policy for targets with their own registry.

## File Clustering Priority

1. Vertical feature/fix: behavior, adapters, tests, generated output and required
   user documentation for that one outcome.
2. Independent resilience fix: retries, storage or middleware with its own proof.
3. Test hardening: fixtures or stronger invariant coverage, never weakened tests.
4. Build/package configuration: manifests, lockfiles and CI.
5. Target governance/legal docs: contribution guidance and architecture records.

Parent cockpit plans, journal and evaluations never belong in a child commit.
They may be maintained separately in the parent under its own authorization.

For each candidate, state its benefit in one sentence, remove unrelated files,
and split independently valuable changes. File count is a review signal, not
the definition of atomicity.

## Declarative Contract

```text
Type/scope: fix(storage)
Title: reject stale writes before changing saved state
Rationale: preserve the authoritative version when a client submits stale input
Release impact: user-visible correctness fix
Trailers: only those required by the target
Files: exact owned implementation and regression-test paths
Verification: exact command, Cwd and observed result
```

Before committing, inspect child status and staged diff. Stage literal owned
paths, use a path-limited commit when unrelated staged files must remain, then
inspect the actual committed file list. Never rewrite a published base to
repair prose or use `--force-with-lease` as a routine push flag.

## Verification

Inspect commit subjects against the child's convention and configured base ref.
Check that each committed file supports its stated outcome, required generated
files and release notes are present, and unrelated index entries are preserved.
No commit is needed merely to validate this skill's documentation.

## Reference

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Implementation workflow](../implement-tasks/SKILL.md)
