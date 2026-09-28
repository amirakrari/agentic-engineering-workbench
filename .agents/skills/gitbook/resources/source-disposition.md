# Source Resource Disposition

The portable package preserves the GitBook router's reusable resource library: API, blocks, configuration, content authoring, frontmatter, Git Sync, OpenAPI, integrations, migration, customization, and site-structure guidance, plus configuration templates.

`resources/example-site/` was inspected but intentionally not imported. It is a large project implementation fixture (148 Markdown pages plus HTML, YAML, JSON, and marker assets), not a reusable workflow reference. Importing it would contradict the clean-room requirement not to carry external/project implementation content. The resource index points to focused portable guidance instead.

No implementation scripts or generated media were imported. Version-sensitive GitBook behavior must be checked against current official documentation before remote operations.
