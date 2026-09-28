---
name: ip-clean-room
description: "Load before external product/design research, competitor comparison, clean-room implementation, or adding/updating code, packages, media, fonts, datasets, generated artifacts, or dependencies whose provenance or license affects distribution."
type: guardrail
enforcement: block
priority: critical
---

# IP Clean-Room and Dependency Gate

## Authority

Read [IP governance](../../../docs/legal/IP_GOVERNANCE.md), the target child repository's license/contribution/release contracts, and [resource index](resources/index.md). Child contracts override generic defaults.

## Invariants

1. Implementation context contains sanitized functional requirements, repository-native design, and permitted standards/interface facts - never third-party source, snippets, ASTs, decompiled output, distinctive structure, copied prose, or assets.
2. Independently design names, decomposition, control flow, data relationships, tests, UI composition, and documentation.
3. Preserve source identity in an audit register while excluding restricted expression from the implementation handoff.
4. A contributor agreement does not grant rights over third-party material. A scanner is evidence, not legal judgment.
5. No new dependency or asset proceeds until license, provenance, version/lock, notices, transitive obligations, distribution model, and release compatibility are recorded.
6. Official external documentation may establish facts; it may not supply implementation code.

## Workflow

1. Classify the input and distribution boundary.
2. Separate researcher and implementer contexts when external implementation could be encountered. Use [research and handoff](resources/research-and-handoff.md).
3. Research behavior only; record title, URL, owner, license, access date, and factual observations.
4. Produce a source-free handoff: inputs, outputs, errors, constraints, standards, and unresolved questions.
5. Start implementation in a fresh context and follow repository-native patterns.
6. For dependencies, apply [dependency license gate](resources/dependency-license-gate.md).
7. Complete [SSO/provenance review](resources/sso-and-provenance-review.md) and [audit record](resources/audit-record-template.md).

## Block conditions

Block on unknown provenance, copied or source-derived expression, incompatible obligations, missing notices, ambiguous redistribution/hosted-service terms, or absent required approval. Report the exact decision owner and evidence needed.

## Verification

- Run configured license, build, test, and documentation checks from `project.yaml` when non-null.
- Inspect the diff for copied expression, undeclared assets/dependencies, lockfile drift, and required notices.
- Link the source register, sanitized handoff, separation attestation, dependency decision, and verification evidence.
