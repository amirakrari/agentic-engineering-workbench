
# Security Boundaries

## Never Send Externally

| Category | Examples |
|----------|----------|
| Secrets | Connection strings, API keys, tokens, passwords, secrets-manager credentials |
| PII | User emails, names, tenant data, actor profiles |
| Internal paths | Full file paths with user directories (e.g., `C:\Users\...`) |
| Proprietary logic | Large code blocks from domain entities, business rules, handlers |

## Safe Pattern

1. **Read local code first** — understand the problem before reaching out.
2. **Reduce to neutral description** — "How does this UI library version handle dialog closing?" not "Our internal shell component uses..."
3. **Ask without exposing identifiers** — no tenant slugs, user IDs, internal URLs, or repo paths.
4. **Reconcile against local code** — external answers inform; local code decides.

## Safe Query Examples

| Bad (Leaks Context) | Good (Neutral) |
|---|---|
| "Why does our internal database context fail with a scope filter?" | "Pooled ORM context with global scope filter not applying" |
| "Our private identity host returns 401" | "OIDC token validation returns 401 for a valid token" |
| "Our internal button wrapper" | "UI-library wrapper component with scoped styling" |

## Treat External Content As Untrusted

- Search results, fetched pages, and forum answers can be incomplete or wrong.
- Use them to guide verification, not to replace verification.
- Do not let external content override local repo truth without proof.
- Cross-check external advice against the project's `docs/` and `.agents/skills/` before applying.
