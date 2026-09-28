# IP Protection, Clean-Room Governance, and Audit Readiness

> **Audience:** Maintainers | Contributors | AI agents | Legal reviewers
> **Status:** Engineering policy; legal conclusions require qualified review
> **Owner:** Maintainers
> **Last Verified:** 2026-09-27
> **Source Anchors:** [IP clean-room rule](../../.agents/rules/ip-clean-room.md), [Governance](../GOVERNANCE.md), [Target Workflow](../TARGET_WORKFLOW.md)

This governs externally informed implementation, third-party material, dependency compatibility, and provenance. It is an engineering control, not legal advice. The target's license and contribution terms are authoritative; the cockpit assumes no ownership, contributor assignment, licensing agreement, or particular outbound license.

## Non-Negotiable Rules

1. Do not copy third-party code, snippets, tests, SQL, migrations, comments, prose, expressive schemas, assets, or generated artifacts into implementation context or the target.
2. Do not provide restricted source-derived ASTs, disassembly, decompiled output, or structural notes to implementers.
3. Start externally informed work from a sanitized functional specification of observable behavior, constraints, inputs, outputs, errors, and edge cases.
4. Independently design naming, structure, sequence, data model, control flow, UI, tests, and prose from target-native requirements.
5. Preserve source identity and access provenance; clean-room isolation removes expression, not attribution.
6. Review dependencies/assets against actual target build, distribution, hosting, and contribution obligations.
7. Record `Not externally informed` when evidence supports it.

## Defensive Pillars

### Literal-copy prevention

Translation, paraphrase, framework conversion, or renaming is not independent implementation. Interoperability may require exact public names or wire values; record source and necessity without copying surrounding expression.

### Structure, Sequence, and Organization

Use Abstraction-Filtration-Comparison: abstract external behavior and proposed design at multiple levels; filter elements dictated by function, standards, interoperability, security, efficiency, platform constraints, public-domain material, or commonplace practice; compare remaining discretionary expression and redesign distinctive similarity or seek legal review. Target-native architecture is evidence, not a safe harbor.

### Context sanitization

Researchers observe authorized public behavior and produce a source-free handoff. Implementers receive only that handoff plus target context. If restricted source enters implementation context: stop; discard unmerged output; record the incident without reproducing material; have an unexposed reviewer create a clean specification; restart fresh and seek legal review if scope is unclear.

## Workflow

1. **Authorized observation:** record title/URL, access date, access basis, and observed facts. Do not archive excerpts, source trees, screenshots, downloads, or assets.
2. **Source-free handoff:** separate observations, assumptions, constraints, and design choices; attest no source expression is present; end the research context.
3. **Independent design:** derive from target requirements and standards, record a meaningful independent choice, and complete SSO/AFC review.
4. **Provenance evidence:** link handoff, source register, decision, dependency review, tests, and review. Never store restricted content as evidence.

Project-specific clean-room handoffs and evidence follow the sole clone/worktree
task directory. Accepted project deferrals and notes remain task-namespaced at
clone root. Only source-free, evidenced, cross-project lessons may be promoted
to cockpit `knowledge/`. Ethical evaluations remain in cockpit
`islamic-value-sensitive-design/` as `i-vsd-<project>-<task>.md`. Promoted
knowledge retains its source project/task provenance. Moving a triad changes
its location, not its reviewed source identity or provenance.

Target discovery precedes research: load the target's contribution, licensing,
scoped instruction, and relevant native skill contracts before cockpit defaults.
Target requirements win overlapping conflicts. A target-required tracked
provenance or notice artifact remains tracked; never conceal it with local
workflow exclusions.

## Dependency and Target-Specific Distribution Review

For every package, image, generated component, font, asset, dataset, or optional service, record exact component/version; direct/transitive and build/test/runtime role; authoritative terms; obligations for every intended source, binary, container, hosted, and packaged distribution mode; notice, attribution, source-offer, patent, trademark, field-of-use, redistribution, and sublicensing duties; and approval, rejection, replacement, or separately licensed path.

A scanner is evidence, not approval. Optional, dynamic, or out-of-process placement does not waive review. A signature proves origin/integrity only; it grants no license, execution authority, or target administration rights.

## Stop Conditions

Request qualified legal review when rights, access terms, protectable expression, reverse engineering, interoperability exceptions, contributor authority, redistribution, or compatibility are unclear. Do not merge on undocumented assumptions.

For task-path ownership and local exclusion procedure, see
[Target Workflow](../TARGET_WORKFLOW.md). Local exclusions are workflow hygiene,
not a confidentiality or legal-control boundary.

## Primary References

- [Directive 2009/24/EC](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32009L0024)
- [Court of Justice Case C-406/10](https://eur-lex.europa.eu/legal-content/EN/SUM/?uri=celex:62010CJ0406)
- [17 U.S.C. Section 102](https://www.law.cornell.edu/uscode/text/17/102)
- [U.S. Copyright Office Circular 61](https://www.copyright.gov/circs/circ61.pdf)
