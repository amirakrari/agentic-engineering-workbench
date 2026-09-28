---
name: slidev
description: "Load when creating or editing a Slidev slides.md developer talk/workshop with Markdown slides, Vue components, code, Mermaid/LaTeX, presenter notes, or PDF/PPTX export; not for native presentation files or general docs."
type: workflow
enforcement: suggest
priority: medium
---

# Slidev Authoring

## Invariants

1. Start with headmatter and separate slides with `---`.
2. Keep one primary idea per slide; move delivery detail into presenter notes.
3. Store local static assets in the deck's `public/` directory and use stable root-relative references.
4. Keep code legible and focused; use highlighting only when it teaches sequence or change.
5. Follow repository documentation style and accessibility guidance: [style](../../../docs/DOCUMENTATION_STYLE_GUIDE.md), [governance](../../../docs/GOVERNANCE.md).
6. Publishing, deployment, or uploading exported artifacts requires explicit user authorization.

## Reference routing

Load only relevant files from `references/`:
- syntax/headmatter/frontmatter/imports: `core-syntax.md`, `core-headmatter.md`, `core-frontmatter.md`, `syntax-*`;
- layouts/components/styling: `core-layouts.md`, `core-components.md`, `layout-*`, `style-*`;
- code/live editors: `code-*`, `editor-*`;
- diagrams/math: `diagram-*`;
- animation/presentation: `core-animations.md`, `animation-*`, `presenter-*`;
- build/export/hosting: `core-cli.md`, `core-exporting.md`, `core-hosting.md`, `build-*`.

## Workflow

1. Read the existing deck, package scripts, theme, audience, duration, and requested output.
2. Outline narrative beats and one takeaway per slide before styling.
3. Author minimal slides with notes, accessible contrast, readable type, alt text, and offline-safe assets.
4. Run the child project's configured dev/build/export commands from the
   execution root resolved by the
   [target workflow](../../../docs/TARGET_WORKFLOW.md); inspect the real rendered
   deck.
5. Check representative viewport sizes, code clipping, assets, transitions, notes, and links. Open requested exports and inspect pages rather than trusting command success.

The preserved [reference library](README.md) contains syntax and official-feature summaries; verify version-sensitive behavior against the installed Slidev version and official documentation.
