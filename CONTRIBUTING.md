# Contributing to Agentic Engineering Workbench

Thank you for improving the workbench. Contributions should strengthen portable
engineering workflow without turning the repository into a bundled collection of
target-, stack-, or vendor-specific skills.

## Before Opening an Issue or Pull Request

Read:

- [README](README.md), especially **Context-Agnostic by Design**;
- [Governance](docs/GOVERNANCE.md), including the
  [Core Admission Rule](docs/GOVERNANCE.md#context-agnostic-core-admission-rule);
- [Target Workflow](docs/TARGET_WORKFLOW.md);
- [Licensing and Provenance](docs/legal/LICENSING.md).

Security vulnerabilities should be reported privately through
[GitHub Security Advisories](https://github.com/amirakrari/agentic-engineering-workbench/security/advisories/new),
not a public issue.

## What Belongs Here

Good contributions improve target-independent:

- instruction and skill discovery;
- planning, implementation, debugging, refactoring, and review;
- risk-scaled verification and quality gates;
- worktree and local task-state lifecycle;
- research, provenance, documentation, and reusable knowledge flow.

Product/domain rules, language/framework implementation skills, and vendor,
SaaS, SDK, issue-tracker, or documentation-platform integrations belong in the
target repository or a separate optional skill catalog.

Skill proposals must explain how they satisfy all five context-agnostic admission
conditions. Frequent use of one tool is not evidence that its integration belongs
in the core.

## Local Setup

```bash
git clone https://github.com/amirakrari/agentic-engineering-workbench.git
cd agentic-engineering-workbench
```

Target repositories under `repos/` are local workspace inputs. They remain
visible for editor trees, search, and chat `@` mentions, but **must never be
included in a workbench contribution**.

Create `repos/` locally when needed:

```bash
mkdir -p repos
cd repos
git clone https://github.com/OWNER/REPOSITORY.git
cd ..
```

Every child remains an independent Git repository. Run target commands and target
Git operations from that child's Cwd; run workbench checks from the workbench root.

## Change Workflow

1. Open or reference an issue for material behavior or policy changes.
2. Keep the change focused and preserve unrelated work.
3. Update the canonical owner rather than duplicating policy.
4. Add or update verification appropriate to the artifact.
5. Preserve exact third-party notices and provenance in the same change.
6. Use a conventional commit such as:

   ```text
   docs(readme): clarify visible target repository workflow
   feat(workbench): add portable review gate
   fix(skills): preserve target instruction precedence
   ```

## Staging Safety: `repos/` Is Never Contribution Content

Because `repos/` is visible, the parent may show nested repositories as untracked.
Never use root-wide staging commands such as:

```text
git add .
git add -A
git add --all
```

Stage exact workbench paths instead:

```bash
git add -- README.md docs/GOVERNANCE.md
```

Then run the mandatory guard:

```bash
bash eng/check-workbench-staging.sh
git diff --cached --check
git diff --cached --stat
git diff --cached --name-only
```

Any added, copied, modified, renamed, type-changed, or unmerged `repos/**` path is
a blocker, including a nested repository staged as a gitlink. If a target was
staged accidentally:

```bash
git restore --staged -- repos/
```

Do not delete or reset the child repository merely to clean the parent index.

## Verification

At minimum:

- parse changed JSON/YAML configuration;
- validate skill frontmatter, directory/name identity, and the 250-line cap;
- validate changed local Markdown links and heading anchors;
- run `git diff --check`;
- run `bash eng/check-workbench-staging.sh`;
- confirm removed skills or routes have no remaining active references.

Do not run unrelated target builds or tests for workbench-only documentation and
workflow changes.

## Pull Requests

Complete the pull-request template with:

- purpose and user-visible workflow impact;
- context-agnostic admission rationale when applicable;
- exact verification commands and observed results;
- licensing/provenance impact;
- confirmation that no `repos/**` path is included.

Keep pull requests independently reviewable. Do not combine a workflow change
with unrelated skill or documentation cleanup.
