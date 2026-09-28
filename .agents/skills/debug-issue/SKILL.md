---
name: debug-issue
description: "Load when diagnosing a bug, exception, regression, wrong result, failing flow, or unknown root cause using deterministic reproduction, hypotheses, callers/callees, and impact analysis; not for implementing an already-proven fix."
type: workflow
enforcement: suggest
priority: high
---

# Debug Issue: Six-Phase Diagnosis

## 1. Deterministic RED loop

Before speculative fixes, create one bounded command that drives the exact symptom through the narrowest real public seam and fails for the reported reason. Prefer an existing focused test; otherwise add a regression test or minimal integration harness. Do not use fixed sleeps: subscribe to the exact event/state signal before triggering asynchronous work and await it with a bounded timeout.

## 2. Reproduce and minimize

Confirm the observed failure matches the report. Remove one input/setup element at a time until every remaining element is load-bearing.

## 3. Rank falsifiable hypotheses

Write 3-5 hypotheses as: "If X is the cause, changing/observing Y will produce Z." Rank by explanatory power and cheapness to falsify.

## 4. Probe the flow

Trace entrypoint, callers, callees, configuration, persistence, effects, and tests. Use an available graph; otherwise use bounded symbol/reference/import/route search. Tag temporary probes `[DEBUG-<unique>]` so cleanup is mechanically checkable.

## 5. Fix the cause

Place the durable regression at the correct consumer seam. If no clean seam exists, record the seam deficiency. Apply the smallest root-cause fix, observe GREEN, then rerun the original unminimized scenario.

## 6. Cleanup and verify

- Original and minimized reproductions pass.
- Relevant configured tests/build pass from the selected execution root resolved
  by the [target workflow](../../../docs/TARGET_WORKFLOW.md).
- Search confirms no `[DEBUG-` probes remain.
- Impacted flows and real user-visible surface are exercised once.
- Final report states symptom, root cause, successful hypothesis, fix, evidence, and residual risk.

Respect child rules and command strings/null in `project.yaml`; never invent a command for a null entry.
