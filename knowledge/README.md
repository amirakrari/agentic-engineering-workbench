# Shared Engineering Knowledge

The journal stores durable, reusable, evidenced knowledge discovered while working across child repositories. It is not an activity log, task tracker, transcript, or destination for copied upstream documentation.

Start with [`FINDING_TEMPLATE.md`](FINDING_TEMPLATE.md) and apply
[`PROMOTION_RULES.md`](PROMOTION_RULES.md). Project-specific active state stays in
the selected clone/worktree's locally excluded `dev/active/<task>/`.
Project backlog and notes belong to the configured clone's excluded
`dev/backlog/<task>/` and `dev/notes/<task>/`. See
[target workflow](../docs/TARGET_WORKFLOW.md) for ownership and retention.

This cockpit directory is intentionally versionable, unlike target-local task
notes. Promote only evidenced lessons useful across tasks or repositories.
Do not move every project note here merely because a worktree is being removed.
The journal starts empty: add findings only after direct investigation.

A finding must identify its child project and revision, observation, evidence, scope, consequence, and revalidation condition. Never record secrets, personal data, restricted source expression, raw logs, or unsupported conclusions.
