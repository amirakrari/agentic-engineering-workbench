# Documentation Style Guide

> **Audience:** Contributors | AI agents
> **Status:** Reference
> **Owner:** Contributor Experience
> **Last Verified:** 2026-09-27
> **Source Anchors:** [Documentation Architecture](DOCUMENTATION_ARCHITECTURE.md)

## Principles

- Write for action: what to do, where to look, and what is enforced.
- Prefer factual, direct language over promotion.
- Prioritize non-inferable keys, ordering, defaults, and constraints.
- Separate implemented behavior from proposals.
- Link drift-prone claims to concrete source anchors.
- State genuine uncertainty and validation limits.

## Structure and Formatting

Use a one-sentence purpose, core rules, practical notes, and related docs. Keep headings simple. Use inline code for identifiers and paths, tables for real comparisons, and short code blocks. Mermaid diagrams need prose/table fallbacks.

Use ASCII punctuation unless an existing required name uses Unicode. Do not add synthetic comment headers. Use the metadata block defined by [Documentation Architecture](DOCUMENTATION_ARCHITECTURE.md#metadata-and-anchors).

## Content Rules

Do not duplicate large sections; link to authority. Do not test prose wording. Do not show secrets or realistic credentials. Do not use bare phase IDs in human reports. Do not imply optional tooling or automation exists. Keep child terminology in child docs and generic cockpit terminology here.

Use [Target Workflow](TARGET_WORKFLOW.md) as the procedural owner for target
discovery, local exclusions, triad transfer, worktrees, resume, and cleanup.
State only the local invariant needed by another page and link there instead of
copying the procedure. Write path placeholders with braces in Mermaid labels,
for example `{task}`; angle-bracket labels can disappear in
renderers. Prefer `\n` inside quoted Mermaid nodes over HTML break tags.

## Review Checklist

Are exact claims anchored? Is status accurate? Are instructions
execution-root-relative and free of embedded `cd`? Do links resolve? Is the page
useful without Mermaid? Are Mermaid placeholders renderer-safe? Are provenance,
privacy, security, and licensing claims bounded? Was stale duplication removed?
