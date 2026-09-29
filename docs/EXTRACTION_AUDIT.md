# Portable cockpit extraction audit

The initial extraction sections below are historical evidence, not the current
workspace procedure. The later approved redesign supersedes their parent-owned
planning layout. Current behavior is defined in [Target Workflow](TARGET_WORKFLOW.md).

## Scope and source boundary

This repository implements the owner-supplied Portable Agentic Engineering
Cockpit extraction specification dated 2026-09-27. The source checkout was used
read-only; no source application, history, hooks, benchmark scenarios, secrets,
active tasks, journal findings, or project-specific legal agreements belong here.

The destination already existed at commit
`21287a870305fcebf5b862c7938637ef2907ea05` with a single README.
Preserve that independent history; do not initialize over it or manufacture a
new initial commit. Extraction does not authorize a commit, push, or publication.

Source baseline:

- HEAD: `cb30706b8f3d9f8bb0d9ae40bbf37b7261239ca9`.
- Working tree: clean.
- Aggregate SHA-256 of sorted per-file hashes covering root instruction files,
  canonical agent files, rule twins, internal documentation and journal:
  `4ef14c9a5fa925a4bf82e2955454d71fb0e4db49d4d561abddb5595cb14a7a47`.

## Initial extraction decisions (historical)

1. Preserve 23 portable skills with their applicable resources, eight profiles,
   seven optional technology references, schemas, rules/twins, and the complete
   governance lifecycle. Technology-specific source examples are generalized,
   not activated as mandatory architecture.
2. The specification classifies `design-system` twice. Its final explicit
   exclusion and seven-file template list govern: do not extract it.
3. The source IP policy contains project-specific ownership, contribution
   agreements, distribution promises and tooling. Preserve its clean-room and
   provenance controls, not its licensing assumptions. No new license is selected
   or ownership asserted by this extraction.
4. Preserve source schema semantics while fixing links and obsolete metadata.
   “As-is” never requires retaining broken paths or source-only policies.
5. Greenfield breaking-change freedom applies only when the target declares it.
   Public read endpoints, identifier types, entity mapping and validation
   construction are target architecture choices, not universal security defaults.
6. Commands are relative to a validated child working directory. Do not combine
   a child `Cwd` with another `cd repos/...` inside the command.
7. A shipped unconfigured `project.yaml` must prevent accidental execution.
   Missing target details are configuration work, not permission to invent a
   repository or execute placeholder commands.
8. Parent discovery differs across harnesses. Explicitly bootstrap the contract,
   verify loaded instructions, and load the selected skill by path when native
   discovery is unavailable. Instruction files are not a filesystem sandbox.
9. Keep planning and evidence in the parent even when code work uses child
   worktrees. Never copy cockpit files into a contribution to make discovery work.
10. Preserve the report's empty journal, backlog and ethical workspaces. This
    audit is implementation provenance, not an imported finding or live task.

## Initial verification record (historical)

Verified on 2026-09-27:

| Check | Evidence |
|---|---|
| Configuration | `ajv validate --spec=draft2020` accepts the shipped configuration; a ready fixture passes; incomplete-ready and traversal fixtures are rejected |
| Intent routing | All ten entries contain the contribution-contract and five criticality fields; referenced documents and skill routers exist |
| Skill metadata | All 23 routers parse as YAML frontmatter, match their directory names, use valid type/enforcement/priority values and stay within 250 lines |
| Agent metadata | All eight profiles contain the seven required fields |
| Internal links | 531 local Markdown links, including five heading anchors, resolve |
| Rules | Three byte-identical canonical/OmO twins; routing covers test, tests, spec, e2e, test/spec filenames and feature files |
| JSON resources | All JSON files under `.agents/` parse |
| Diagrams | Mermaid CLI rendered all 11 diagrams; each was visually inspected, including repaired path labels and state/verification transitions |
| Git isolation | An ignored scratch child was initialized; child `git add -A` staged only its README, parent tracked no child files, and child Cwd/top-level checks passed |
| Source protection | Final source HEAD, clean working tree and aggregate fingerprint exactly match the baseline above |
| Destination history | Original HEAD remains unchanged, parent index is unchanged, no commits or publication occurred |
| Empty stores | Active/backlog and ethical subdirectories contain only markers; the cumulative journal contains no imported findings |

YAML/JSON language-server diagnostics were attempted but their configured
servers were not installed. Parser/schema validation supplied the relevant
machine checks instead. No product application exists here, so no product build
or unrelated source test suite was run. Native harness auto-discovery was not
tested across every harness; explicit bootstrap and its limits are documented.

Local verification dependencies, rendered images and the scratch child are
ignored under `.verification/` and `repos/cockpit-smoke/`. They are not part of
the cockpit distribution. No custom helper script or workflow daemon was added.

## Resource accounting

Each portable tree was compared with the source inventory:

| Skill | Source files | Portable files |
|---|---:|---:|
| agentic-research | 4 | 4 |
| conventional-commit | 1 | 1 |
| criticality-guardrail | 2 | 2 |
| cto-consultation | 2 | 2 |
| debug-issue | 1 | 1 |
| epistemic-mad-review | 1 | 1 |
| explore-codebase | 1 | 1 |
| finding | 1 | 1 |
| grill-me | 1 | 1 |
| implementation-plan | 6 | 6 |
| implement-tasks | 1 | 1 |
| ip-clean-room | 6 | 6 |
| i-vsd | 35 | 35 |
| refactor-safely | 1 | 1 |
| review-changes | 1 | 1 |
| review-pr | 1 | 1 |
| robin-neutral | 1 | 1 |
| senior-cto-feedback | 8 | 6 |
| skill-authoring | 10 | 10 |

The two project-specific CTO resources are explicitly excluded by the report.
Category C skills, source
application files, hooks, benchmark scenarios and trigger configuration are absent.
Seven stack references flatten the selected source patterns under the optional
technology-template directory; future stack catalogs are explicitly unpopulated.

## Initial integration corrections (historical)

An independent read-only audit identified stale target-specific scoring,
implicit commit authorization, obsolete triad filenames, a prohibition on
real-surface tests, unilateral scope pruning/misplaced architecture records and
incomplete test globs. These were reconciled against the root contract.
Planning/execution now keep one parent triad, resolve actual target commands,
respect target compatibility and preserve requested scope until a deferral is
accepted. The architecture guide also retains the lightweight-workflow boundary
without copying the source executable guard.

## Approved target-local workspace redesign

The owner's subsequent approval changes workspace ownership while retaining the
shared cockpit:

- Plans start in `repos/<project>/dev/active/<task>/`; the containing clone
  already supplies project identity for target-local task state.
- Isolated execution uses `repos/<project>/.worktrees/<task>/` and moves the
  whole sole task folder into that checkout's `dev/active/`.
- Target-local `info/exclude` protects worktrees and exact task directories;
  upstream `.gitignore` and global exclusions are not changed.
- Project backlog/notes remain clone-local and excluded; reusable findings move
  to cockpit `knowledge/`. Cockpit-root `dev/` is removed.
- Root/scoped target instructions and relevant native skills are discovered
  before contribution work; compatible cockpit workflows remain active, while
  target guidance wins overlapping conflicts. Exact paths/revisions follow
  delegated work and worktree transitions.
- Cleanup accounts for ignored material and normally returns the triad to the
  clone before removing the worktree. Clean status is not a disposal decision.

The final naming correction removes redundant project prefixes from every
target-local task directory. A clone now owns `dev/active/<task>/`,
`dev/backlog/<task>/`, `dev/notes/<task>/`, and
`.worktrees/<task>/dev/active/<task>/`. Project identity remains explicit in
shared cockpit artifacts such as `i-vsd-<project>-<task>.md` and reusable
knowledge provenance.

### Protected source baseline for this redesign

The source already had a user-owned `CLAUDE.md` modification when redesign began.
It must be preserved, not reverted to the initial extraction baseline:

- HEAD: `cb30706b8f3d9f8bb0d9ae40bbf37b7261239ca9`.
- Working tree: only `CLAUDE.md` modified.
- `CLAUDE.md` SHA-256:
  `586fdf6d612d96ec07ec7cb128091ec20b80d213ced123f277be018e9b424f0e`.
- Aggregate SHA-256 over the same source-governance inventory:
  `028fa574fd5031f334dd0ac61ddb30e0f39634f6393b83d7def4a8de0a6de43f`.

### Redesign verification

Independent review found two remaining contract defects. CTO re-review now
resolves and edits the sole existing execution-root triad, including after its
move into a worktree, without recreating the clone copy. Target-bound ethical
reports now include project identity in their filenames and metadata; planning
reports use `i-vsd-<project>-<task>.md`, with identity checked before reuse.

- Shipped and ready-target configurations pass schema validation. The obsolete
  nested journal field and an escaping worktree path are rejected.
- All 19 retained skill routers, eight agent profiles, ten intent routes and three exact
  rule-twin pairs pass their metadata/reference checks; JSON resources parse.
- Full local verification checked 248 deliverable files, 604 Markdown links and
  seven heading anchors with no link or whitespace failures. Subsequent wording
  corrections passed focused whitespace checks and introduced no new links.
- All 11 architecture diagrams render; every diagram was visually inspected.
  The cold-start flow explicitly loads target instructions/native skills before
  classifying intent and criticality.
- A disposable local clone exercised shared `info/exclude` across a real linked
  worktree. Normal `git add -A` staged no private files in either checkout.
- The full triad plus nested evidence moved into the worktree and returned to
  the clone with the same relative-tree fingerprint:
  `2430d86807fd96272f9089ed21e3ab21a52afc48fcd5e4c94e58baa65c697c42`.
  The source task directory was absent after the move.
- Negative fixtures proved that an overriding target ignore rule exposes files
  and that exclusions do not untrack staged files. Both gates detected the
  problem, and only fixture-owned state was restored.
- Cleanup removed the worktree without force only after retaining the task,
  evidence, clone backlog and notes. No tracked ignore file or commit was added.
- The protected source HEAD, dirty-file list, `CLAUDE.md` hash and aggregate
  fingerprint exactly match this redesign's baseline above.
- The cockpit's original HEAD and index remain unchanged. Its root `dev/` is
  absent; shared knowledge and all portable skill resource trees remain.

Detailed local fixture evidence is ignored under `.verification/`; the retained
scratch clone is under `repos/cockpit-layout-check/`. These are not shipped
runtime tools. YAML/JSON language servers remain unavailable; parser/schema
checks are the applicable substitute. No product build applies to this
documentation/configuration change. Cross-harness automatic discovery was not
claimed or exhaustively exercised; explicit target discovery remains an agent
procedure.
