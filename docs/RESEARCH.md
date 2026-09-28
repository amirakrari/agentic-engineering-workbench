# Research decisions

Accessed 2026-09-27. Research used web search, official documentation and a
targeted documentation-index lookup. Only functional documentation facts inform
the cockpit; no third-party implementation or copied resource tree was imported.

| Official source | Relevant fact | Cockpit decision |
|---|---|---|
| [AGENTS.md](https://agents.md/) | A root contract and more-specific instructions support local project context. | Load target-local instructions; do not treat the parent as authority to rewrite child policies. |
| [Claude Code memory](https://code.claude.com/docs/en/memory) | Instruction loading varies by version/settings; explicit imports from `CLAUDE.md` are supported. Parent memory and subdirectory memory have different loading times. | Keep a small `CLAUDE.md` with `@AGENTS.md`; confirm loaded memory instead of relying on version assumptions. |
| [Claude Code skills](https://code.claude.com/docs/en/skills) | Native skills use harness-specific discovery locations. | Canonical `.agents/skills/` remains portable documentation; explicitly read selected paths unless installation is verified. |
| [Copilot custom instructions](https://docs.github.com/copilot/customizing-copilot/adding-custom-instructions-for-github-copilot) | Repository-wide and path-specific support depends on the Copilot surface. | Provide the repository pointer, verify instruction references, and make no blanket child-only cloud support claim. |
| [Copilot CLI instructions](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions) | Discovery follows documented repository/current-directory paths. | Start in the cockpit and verify discovery before a contribution. |
| [Agent Skills specification](https://agentskills.io/specification) | `SKILL.md` metadata supports discovery, with deeper resources loaded progressively. | Keep name/description plus the cockpit's type/enforcement/priority fields; do not eagerly load resource trees. |
| [Git ignore](https://git-scm.com/docs/gitignore) and [repository layout](https://git-scm.com/docs/gitrepository-layout) | Shared `info/exclude` is repository-local metadata; tracked files are unaffected and target ignore rules can take precedence. | Exclude exact private task paths locally, verify effective rules, and keep upstream `.gitignore` unchanged. |

The parent-workspace layout isolates Git histories, not process permissions.
Ignoring child directories prevents ordinary parent staging; it does not prevent
`git add -f` or an agent writing arbitrary files. Real-path validation, explicit
Cwd, target instructions and staged-diff review remain necessary.

## Capability boundaries

- No hooks, graph server or automatic skill installer is bundled.
- No global harness configuration is edited.
- A remote agent given only the child repository cannot see parent governance.
- A slash command name in workflow prose describes a skill invocation, not a
  promise that the harness has registered that command.
- The configuration schema validates data shape, not the safety of shell text.

## Practical bootstrap

Open the cockpit root and ask the agent to read `AGENTS.md`, selected
configuration, applicable target instructions and matching native/cockpit skills
by exact path through [target discovery](TARGET_WORKFLOW.md). Target guidance
wins overlapping conflicts. Ask the agent to state target Cwd, clone/worktree
triad location, local exclusion evidence, criticality and verification commands.
Check those four values before the first side effect. Use the harness's loaded
context view where available; do not copy parent files into a target to repair
discovery.
