---
name: plane-mcp
description: "Load when the user asks to find, create, update, assign, label, prioritize, transition, or organize Plane work items, cycles, modules, or projects via MCP; not for local todo lists or implementation-plan markdown."
type: pattern
enforcement: suggest
priority: high
---

# Plane MCP

## Authorization and configuration

Plane reads may proceed when requested. **Every Plane write requires explicit user authorization for the concrete mutation in the current task.** Creation, update, assignment, transition, comments, relations, cycle/module membership, and bulk operations are writes. Do not infer authorization from credentials or prior sessions.

Read [workspace configuration](resources/workspace-configuration.md). Never default workspace, project, state, label, cycle, module, or member identifiers; resolve them from user input or live read-only discovery.

## Rules

- Search before create; compare likely matches and prevent duplicates.
- Resolve human identifiers to canonical IDs immediately before mutation.
- Derive state from evidence; descriptions do not prove completion.
- Apply only fields requested or required by an explicitly accepted project contract.
- Keep descriptions concise; use stable repository paths; never include secrets, PII, or large source blocks.
- Confirm destructive, bulk, or ambiguous scope explicitly.
- Read back every mutation and report canonical identifiers and resulting fields.

## Workflows

### Find
Resolve workspace/project from explicit context, search strongest terms, retrieve candidates, and report ambiguity without writing.

### Create
Search/deduplicate, present intended target/fields, obtain explicit authorization, create, then separately add cycle/module membership if requested and supported. Read back.

### Update
Retrieve current item, show requested delta, obtain explicit authorization, patch only those fields, then read back.

### Bulk
Discover all candidates first, deduplicate, show bounded mutation set and failure semantics, obtain explicit authorization, execute bounded independent writes, and return per-item success/failure with safe retry set.

## Verification

Each write has current authorization plus read-back evidence. New items have no known duplicate and contain only explicitly resolved identifiers; partial failures are never hidden.
