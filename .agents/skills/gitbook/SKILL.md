---
name: gitbook
description: "Load when configuring GitBook sites, authoring GitBook-flavored Markdown and blocks, integrating OpenAPI specs, operating Change Requests, or building GitBook platform integrations; not for generic markdown or unrelated API generation."
type: workflow
enforcement: suggest
priority: high
---

# GitBook Platform and Documentation

## Safety and transport

1. Prefer connected GitBook MCP for supported operations, then official REST API when authorized and credentials are present. Never echo or commit tokens.
2. For Git Sync spaces with a local checkout, edit via Git. Do not bypass review with direct content pushes unless explicitly authorized for that path.
3. **All publication and GitBook writes require explicit user authorization:** creating sites/spaces/CRs, pushing content, requesting reviewers, comments, resolutions, verdicts, notifications, merges, and publication.
4. For each Change Request report both the app diff URL and rendered preview URL containing `/~/changes/<number>/`.
5. Preserve lossless Markdown round trips: account for separately stored title fields and integration-block formatting.
6. Quote frontmatter values containing YAML-significant characters.

## Resource routing

Start at [resource index](resources/index.md), then load only the relevant guide:

| Task | Primary guide |
|---|---|
| Site IA, spaces, Git Sync, customization | [site configuration](resources/site-configuration.md) |
| Pages, frontmatter, blocks, variables | [content authoring](resources/content-authoring.md) |
| OpenAPI references and interactive runner | [OpenAPI integration](resources/openapi-integration.md) |
| Change Request create/review/comment/resolve | [change requests](resources/change-requests.md) |
| ContentKit app, manifest, runtime | [integrations platform](resources/integrations-platform.md) |
| Migration from another docs system | [migration guide](resources/migration-guide.md) |

## Workflow

1. Read child documentation architecture/style, local GitBook config, Git Sync state, and requested publication boundary.
2. Discover target site/space/CR identifiers read-only; never default identifiers.
3. Prepare and validate local changes. For state-changing remote work, present exact mutation and obtain explicit authorization.
4. Execute only authorized mutations, read back state, and report canonical IDs plus both CR links where applicable.
5. Verify strict `SUMMARY.md` grammar, links, frontmatter, OpenAPI validity, secrets hygiene, and rendered preview.

The large source example-site implementation corpus is intentionally omitted; see [source disposition](resources/source-disposition.md). The retained resources contain the reusable workflows, schemas, and official platform facts without importing a project implementation.
