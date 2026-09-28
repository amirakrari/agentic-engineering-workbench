
# Verification And Tests

## Minimum Commands

Run a diff whitespace check for files touched:

```bash
git diff --check -- .agents/contract/intents.yaml .agents/skills
```

Validate changed frontmatter against `.agents/skills/_SKILL_SCHEMA.md` and
resolve every changed resource link manually.

## When To Run More

Run the full build only when shared test infrastructure, project files, or
application code changed. Prose-only skill changes do not run product tests.

## Manual Checks

- `SKILL.md` has valid required frontmatter.
- The description alone supports the pre-load decision and disambiguates adjacent skills.
- The loaded body contains no repeated activation section.
- Resource links resolve.
- Resource index links every resource.
- Resource files contain no synthetic branding/metadata comments.
- No skip-list exception was added.
- No claim exceeds the available evidence.

## Command portability

Use only commands verified in the child repository or non-null commands from
`project.yaml`. A command string is execution-root-relative; run it from the
clone or worktree selected by the
[target workflow](../../../../docs/TARGET_WORKFLOW.md). Do not invent a filter
syntax or substitute a command when the configured value is null.
