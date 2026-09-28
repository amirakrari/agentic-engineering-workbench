---
name: explore-codebase
description: "Load when asked where code lives, how modules relate, what calls or implements a symbol, or for an architecture/codebase tour; not for bug diagnosis, diff review, or refactoring."
type: workflow
enforcement: suggest
priority: medium
---

# Explore Codebase

## Workflow

1. Apply the [target workflow](../../../docs/TARGET_WORKFLOW.md), then read the
   selected execution root's rules, manifests, top-level structure, and
   architecture entrypoints.
2. If a code graph exists, request minimal task context, architecture/community overview, relevant symbols, callers/callees, and execution flows. Keep queries bounded.
3. If graph tooling is absent or stale, use a bounded structural fallback: file search, symbols, definitions/references, imports, routes, configuration registration, tests, and targeted history. State that the fallback was used.
4. Start broad enough to identify ownership, then narrow to the smallest relevant symbols and public seams.
5. Cross-check important relationships in source and tests; generated or dynamic edges need runtime/config evidence.

## Output contract

Report:
- architecture map and owning modules;
- entrypoint-to-effect execution path;
- important callers, callees, configuration, and tests;
- evidence handles (`path:line`, symbol, or graph query);
- unknowns and likely dynamic edges.

Do not edit files, infer runtime behavior from names alone, or present graph output as current without checking its revision.
