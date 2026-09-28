
# Authoring Workflow

## Purpose

Use this workflow when a task asks for a new `.agents/skills/<name>/SKILL.md` or a significant resource-library update.

## Sequence

1. Classify the task as `create-agent-context-skill` when the work changes `.agents/skills/**`, skill resources, skill schema tests, or skill-related intent routing.
2. Reuse injected cockpit instructions, apply the
   [target workflow](../../../../docs/TARGET_WORKFLOW.md) when contribution work
   is involved, resolve one intent, read `_SKILL_SCHEMA.md` once, then retrieve
   only the relevant headings from canonical docs and task-owned current
   context. Do not preload plan/context/tasks together.
3. Confirm whether an existing skill folder exists before creating files; do not overwrite unrelated work without reading it.
4. Write the `description` first: concrete positive triggers plus a compact exclusion when a neighboring skill could match.
5. Draft the loaded body from non-inferable rules, ordered workflow steps, just-in-time resources, and realistic verification; delete activation prose and generic advice.
6. Create `resources/index.md` plus focused resource files for depth, templates, checklists, decision frameworks, and domain-specific heuristics.
7. Add or update the intent manifest only when the skill changes routing or should become a first-class task category.
8. Run schema, link, intent-manifest, and diff-check verification before claiming completion.
9. Update the task-owned `context.md` with what changed, verification, next action, and risks only when the work already has a substantial active workstream.

## Quality Bar

A good description makes the load decision correctly without opening the file. A good body changes execution after loading without restating the task or repository-wide rules.

## Handoff Rule

If context is getting large, update the selected execution root's
`dev/active/<task>/context.md` before handoff. Preserve evidence,
decisions, next action and risks; never paste source or conversation history.
