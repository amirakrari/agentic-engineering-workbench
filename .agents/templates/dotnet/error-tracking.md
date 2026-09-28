# Error Tracking And Observability Reference

> Optional .NET example. Select telemetry backends and packages from the child repository's operational, compatibility, privacy, and license requirements; no named backend is mandatory.

## Error Contract

Use centralized exception handling and one stable API error shape. RFC 7807 `ProblemDetails` is a common HTTP choice with `type`, `title`, `status`, `detail`, `instance`, plus trace/correlation identifiers and a deterministic field-error dictionary when applicable.

Map validation/malformed input, unauthenticated, forbidden, missing, conflict, semantic validation, rate limiting, and unexpected failure consistently. Hide stack traces and internal details in production. Do not swallow exceptions.

In modern ASP.NET, chained `IExceptionHandler` implementations can handle specific validation exceptions before a global fallback. Review runtime-version behavior for handled-exception diagnostics: framework defaults may suppress logs, metrics, or events after a handler reports success. Make suppression an explicit decision.

## Correlation And Request Logging

Accept a trusted correlation header or generate an identifier; return it in responses and enrich structured logs. Request logs should use message templates and bounded fields such as method, route template, status, duration, authenticated subject identifier, scope identifier, trace id, and correlation id.

Never log credentials, raw tokens, unredacted personal data, full request/response payloads, or provider secrets. High-cardinality values belong in log fields, not labels.

## Tracing

Connect incoming request, use-case dispatch, database operations, and external dependencies under one trace. Use stable operation names and semantic tags. Mark exceptions as errors, but redact message/event data. Prefer framework/provider instrumentation; add custom spans only around meaningful gaps.

Track latency distributions at route and use-case granularity and align warning/error thresholds with documented SLOs rather than arbitrary copied values.

## Metrics

Useful low-cardinality signals include request count/duration, active requests, database duration, external dependency failures, command/query duration, outbox backlog, and domain outcomes. Never label by unbounded user input, raw URL, email, token, or arbitrary tenant unless the set is intentionally bounded and privacy-approved.

Rate-limit rejection should expose the child's standard error body and retry metadata where available. Metrics and logs should explain rejection without leaking identity or payload.

## Logs And Backends

Structured logs can flow to Loki or another child-approved store; metrics can use OpenTelemetry with Prometheus or another exporter; traces can use OTLP. Configure an exporter once and avoid duplicate pipelines unless the child explicitly supports them. Preserve `writeToProviders`-style bridging only when required by the logging architecture.

A UI error boundary should show safe fallback behavior, log through the canonical pipeline, and preserve framework error-boundary semantics. Do not display exception internals.

## Performance Behavior

Pipeline behaviors or endpoint filters may record start/end, duration, and exceptions using request type rather than serialized payload. Thresholds must be configurable or SLO-derived. Database diagnostics should avoid parameter values and rely on provider instrumentation before custom spans.

## Failure And Privacy Tests

Pin centralized mapping, production detail suppression, correlation propagation, rate-limit metadata, handled-exception diagnostics, structured fields, redaction, cardinality, exporter configuration, and telemetry availability during provider/backend failure. Static scans may supplement but do not replace runtime redaction tests.

For async telemetry tests, subscribe to the exact activity/log/metric signal before triggering the action, then await with a bounded timeout; never use fixed sleeps.

## Verification

From the resolved clone or task-worktree Cwd, run focused
handler/middleware/telemetry tests and configured build. Exercise one handled
and one unexpected error through the real surface. Correlate response, logs,
trace, and metrics; verify production redaction and backend outage behavior.
Review any added package against child compatibility and license rules.
