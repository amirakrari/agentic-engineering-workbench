# Authentication And Authorization Reference

> Optional .NET patterns. Preserve the child's identity protocols, threat model, compatibility, dependencies, and licenses. Never introduce a provider named here merely because it is an example.

## Trust Boundaries

- Keep access/refresh tokens outside browser-readable storage. A server-side session or backend-for-frontend can hold credentials in secure cookies and forward server-side tokens.
- Derive current user and tenant/account scope once through a canonical service or principal extension. Do not create divergent extraction helpers.
- Purpose-bound schemes such as API keys, setup secrets, service identities, and erasure receipts validate separate claims at their authentication boundary; do not merge them into ambient user identity.
- Request body identifiers are targets, not proof of current authority.
- Enforce resource authorization on the server. Client affordances improve UX but never establish permission.

## Token Validation

Validate issuer, intended audience/client, signature, lifetime, and only a small documented clock skew. Some identity providers represent intended client in `aud`, others in an authorized-party claim; accept the exact child-approved rules and pin them with negative tests. Never log raw tokens.

Centralize identifier parsing with an explicit fallback order justified by the provider contract. Parse only valid identifier formats. If an external subject is not a local identifier, resolve an exact linked account; do not guess via email or another mutable claim. A missing link is an authentication outcome.

## Middleware/Filter Order

A common sequence is:

1. exception handling and trusted forwarded-header processing;
2. correlation/security logging;
3. routing and pre-auth scope hint resolution;
4. request timeout controls;
5. authentication;
6. authenticated scope binding;
7. authorization;
8. endpoint execution.

Adapt to the child framework pipeline. Forwarded headers must be trusted before host-based scope resolution. Scope mismatch and unresolved multi-tenant context fail closed without disclosing another scope's existence.

## Authorization Provider

A local or remote policy evaluator should:

- validate supported actions before dispatch;
- apply emergency safe mode as a one-way fail-closed latch where required;
- enforce machine/API-key scope ceilings and owner scope;
- batch checks to avoid authorization N+1 queries;
- pre-resolve stable authority facts once per batch;
- keep privileged bypasses narrow and explicit;
- expose outage, timeout, stale-policy, and recovery behavior.

For action lists, a Candidate -> Normalize -> Batch Authorize -> Materialize pipeline avoids per-item calls and ensures only server-approved actions reach the client.

## Machine Principals

Treat machine scope as a maximum capability, not proof of resource ownership. Apply both scope ceiling and resource owner/context checks. Explicitly bar high-risk operations that are not intended for automation even when a broad write scope exists.

## Adversarial Tests

Pin forged/missing identity, wrong audience/client, expired tokens, replay, wrong tenant/account, untrusted headers, provider outage, stale authority, over-posting, client-only gating, and sensitive log leakage. Verify 401 versus 403 behavior without resource enumeration.

## Minimal Example

```csharp
Guid? userId = principal.GetCanonicalUserId();
if (userId is null)
    return Results.Unauthorized();

bool allowed = await authorizer.IsAllowedAsync(userId.Value, resource, action, ct);
if (!allowed)
    return Results.Forbid();
```

Names are placeholders; reuse the child's canonical identity and authorization services.

## Verification

From the resolved clone or task-worktree Cwd, run focused positive and negative
auth tests, isolation tests, architecture checks, configured build, and safe
runtime probes. Inspect logs/errors/traces for secrets or personal data. Verify
dependencies and protocol changes against child compatibility and license
policy.
