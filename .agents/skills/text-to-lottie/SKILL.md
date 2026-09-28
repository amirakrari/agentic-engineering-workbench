---
name: text-to-lottie
description: "Load when creating, editing, or debugging Lottie/Bodymovin JSON for logo/type/SVG animation, loaders, icons, microinteractions, lower thirds, charts, diagrams, scenes, effects, slots, or controls; not for static art, CSS-only motion, or video editing."
type: workflow
enforcement: suggest
priority: medium
---

# Text to Lottie

## Rules

- Read [player contract](references/player-contract.md) for every task and verify with the repository's actual player/runtime.
- Resolve the explicit target path and re-read before overwrite; never replace an unknown non-placeholder scene.
- Include valid top-level metadata and treat `op` as exclusive.
- Default logos, icons, loaders, overlays, lower thirds, and SVG-derived assets to transparent; full-frame scenes use one deliberate background.
- Prefer native text with a shipped matching font; use vector text only for path-specific effects.
- Inspect real frames. JSON validity alone cannot prove layout, timing, rendering, or player compatibility.
- Keep treatment restrained: hierarchy, whitespace, scale, weight, brightness, and timing before ornament.

## Route references just in time

| Need | References |
|---|---|
| data model/keyframes/shapes/assets/slots | `lottie-spec-map.md` |
| logo/type/lower third | matching `recipe-*` plus `motion-taste.md` or `design-taste.md` |
| loader/icon/microinteraction | matching recipe plus `motion-taste.md` |
| SVG | primary recipe plus `svg-compatibility.md` |
| camera/diagram/data/promo/effects | matching recipe |
| long-form transition | `chapterization-transition-grammar.md` |

## Workflow

1. Read current JSON, player contract, and the smallest matching reference set.
2. Define dimensions, frame rate, duration, background, safe area, hierarchy, and beats.
3. Edit the scene; add editable controls/slots only when useful and supported.
4. Validate JSON using an available repository-native parser/validator; do not introduce helper scripts.
5. Load in the real player and inspect frame 0, representative midpoints/transitions, and `op - 1`; fix assets, crop, overflow, layer order, easing, and compatibility.

Use `evals/` only when changing routing or quality behavior. Treat fixtures as machine-consumed contracts. Publishing rendered assets requires explicit user authorization.
