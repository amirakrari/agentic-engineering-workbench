# Rule File Schema (Authoritative)

Path-scoped rules under `.agents/rules/` supplement the intent contract. A harness may auto-load them when an edited path matches a `paths` glob.

## Required Frontmatter

| Field | Type | Requirement |
|---|---|---|
| `name` | string | kebab-case; normally matches filename |
| `description` | string | one sentence stating when the rule applies |
| `paths` | string[] | valid globs relative to the cockpit root, including explicit clone and `repos/*/.worktrees/*/` forms where hidden-directory matching matters |
| `related_skills` | string[] | existing skill names |
| `related_docs` | string[] | existing shared docs under `docs/` or child-repository docs |
| `minimum_tests` | string[] | child-relative targets or commands declared by `project.yaml` |
| `related_intents` | string[] | ids from `.agents/contract/intents.yaml` |

## Required Body Sections

1. `# Title`
2. `> **Applies to:** ...`
3. `> **Authority:** ...`
4. `## Rules` with a Correct/Wrong table
5. `## Must-Reads for This Path`
6. `## Anti-Patterns (Forbidden on These Paths)`
7. `## Verification`
8. `## Related`

## Rules Table Contract

Use columns `#`, `Rule`, `Correct`, and `Wrong`, with 5-10 concise rows sourced from canonical docs and skills. Link [Quick Reference](../../docs/QUICK_REFERENCE.md) rather than copying global invariants.

## Authoring Limits

- Keep rules short, path-specific, and free of diagrams or duplicated catalogs.
- Run commands from the resolved target clone or task-worktree working
  directory; routing metadata paths remain cockpit-relative.
- Include explicit globs for clone-local `dev/active/`, `dev/backlog/`, and
  `dev/notes/` artifacts when the rule governs them. Do not assume a broad glob
  traverses hidden `.worktrees/` directories in every harness.
- Child architecture, compatibility, contribution, and license requirements are authoritative over cockpit examples.
- Use graph data when available; otherwise use language-server navigation and repository search, then verify direct source evidence.
- Validate metadata, globs, links, intent ids, skill names, and test targets as configuration. Do not pin prose with product tests.
