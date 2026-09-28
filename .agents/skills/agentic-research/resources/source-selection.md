
# Source Selection

## Evidence Order
1. Local code, tests, config, and project files.
2. Local docs and `.agents` files.
3. Official framework, library, runtime, standard, or package documentation.
4. External research/search tools.

## Stay Local When

The answer exists in this repository. Examples:

| Question Type | Where To Look |
|---------------|---------------|
| Route/handler behavior | route definitions and application handlers |
| Dependency registration | composition root, module manifests, service configuration |
| Request pipeline order | server entrypoint and middleware/interceptor configuration |
| UI component behavior | frontend components and render tests |
| Domain entity rules | domain modules and canonical architecture docs |
| Repo conventions | `AGENTS.md`, `docs/GOVERNANCE.md`, `docs/QUICK_REFERENCE.md` |
| Test expectations | configured test suites and testing docs |
| Config/settings | operations docs and repository configuration files |

## Escalate To Official Docs When

- Package, framework, runtime, or SDK behavior is unclear.
- You need authoritative migration or breaking-change guidance for a pinned dependency/runtime version.
- Security-sensitive defaults or middleware behavior must be confirmed.
- API surface of a third-party library is in question.

Prefer official documentation and package registries matching the pinned version.

## Escalate To External Research When

- You need standards, RFCs, advisories, ecosystem comparisons, or broader implementation landscape.
- Official docs are insufficient or do not cover the comparison question.
- Looking for production-tested patterns from the OSS ecosystem.

Use general search only after repository and official sources are insufficient. External implementation code is not an allowed implementation source.

## Stop Conditions
- The repo already answers the question — do not escalate.
- Official docs confirm the behavior you need — do not escalate further.
- Additional sources are repeating the same conclusion without adding value.
- Two external sources agree on the answer — stop.
