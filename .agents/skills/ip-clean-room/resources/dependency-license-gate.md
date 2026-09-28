
# Dependency License Gate

## Required Record

For each added or changed dependency, record:

- component, version, source, and checksum/lock evidence;
- direct/transitive and runtime/build/test/asset/optional-service role;
- authoritative license expression or contract;
- obligations for public AGPL and each intended alternative offering;
- notices, source, patent, trademark, redistribution, hosting, seat, field-of-use, and sublicensing constraints;
- decision and approver.

## Decision

- **Approve:** the assembled offering can lawfully follow every intended outbound model while the third-party component retains its own terms.
- **Replace/version-pin:** a compatible version or dependency provides the required function.
- **Separate-license review:** documented rights cover every intended build, deploy, and distribution; default/community behavior remains explicit.
- **Block:** terms affect the project-owned material or prohibit an intended outbound model, or authority is unclear.

Passing the child repository's declared dependency-policy check is metadata evidence, not legal certification. Unknown metadata, source-available terms, commercial contracts, scanner overrides, assets, datasets, and generated output require human review.

## Single Supported Dependency Graph

Use the child repository's canonical manifest and deterministic lockfiles as the one supported dependency graph. CI and release builds must reject unlocked or alternate commercial graphs unless the release contract explicitly authorizes them. Every dependency independently passes this gate; a contribution agreement never authorizes a vendor's terms.

## Verification

Run the non-null dependency/license, restore/install, build, and test commands
declared by the child repository and `project.yaml` from the execution root
resolved by the [target workflow](../../../../docs/TARGET_WORKFLOW.md).

Also inspect the actual artifact/SBOM for each distributed runtime and topology.
One build graph does not waive third-party terms or prove container contents;
record the exact artifact identity and keep unrelated exceptions visible.
