
# Verification Matrix

## Change Type To Verification Mapping

| Change Type | Minimum Verification | Escalation Trigger |
|---|---|---|
| Docs-only Markdown | Structure review, link/path checks, reference existence, code/doc alignment spot-check | Touches API contracts or architecture rules |
| `.agents` Markdown (skills/agents) | Referenced file existence, consistency with repo conventions, formatting | Modifies enforcement rules or blocking constraints |
| `.agents` JSON (skill-rules, settings) | JSON syntax validation, trigger/reference review, no broken refs | Changes hook wiring or permission model |
| `.agents` hooks | Build/validate the hook with its declared toolchain and verify it runs | Modifies security checks or file tracking |
| Tooling or command docs | Confirm commands/settings exist in repo config or documented workflow | Changes CI/CD or deployment procedures |
| Executable behavior | Non-null build/test commands from `project.yaml`, run in the child repository | Any shared contract, dependency wiring, or request-pipeline change |

## Escalation Rules

1. Start with the minimum sufficient check for the change type.
2. Escalate when the change affects:
   - Shared contracts (interfaces, DTOs, entities)
   - Runtime behavior (middleware, DI, background services)
   - Security-sensitive flows (auth, tenant isolation, secrets)
   - Cross-layer dependencies
3. Run any architecture suite declared by the child repository or `project.yaml`; do not invent one when absent.

## Verification Commands Quick Reference

| Check | Command |
|-------|---------|
| Build | `commands.build` from `project.yaml` when non-null |
| Architecture tests | child repository's declared architecture suite when present |
| Unit tests | `commands.test_unit` from `project.yaml` when non-null |
| JSON syntax | Open file in editor or use `jq . < file.json` |
| Hook validation | command declared by the hook package/repository |
| Link validation | Verify target files exist at referenced paths |
