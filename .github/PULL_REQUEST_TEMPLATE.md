## Summary

<!-- What changed and what workbench outcome does it improve? -->

## Why

<!-- What problem or failure mode does this solve? -->

## Change Type

- [ ] Workflow or agent contract
- [ ] Skill or skill-authoring policy
- [ ] Documentation or onboarding
- [ ] Configuration or schema
- [ ] Verification or contributor tooling
- [ ] Licensing or provenance

## Context-Agnostic Admission

<!-- Required for new or materially expanded skills/workflows. -->

- [ ] Useful across languages, frameworks, vendors, deployment models, and domains
- [ ] Owns reusable engineering process rather than target implementation context
- [ ] Defers to target-native instructions and skills
- [ ] Requires no mandatory external integration
- [ ] Verifies through target-configured commands or observable behavior
- [ ] Not applicable; this change does not add or expand a core capability

## Scope and Safety

- [ ] No target repository, gitlink, or other path under `repos/` is included
- [ ] `bash eng/check-workbench-staging.sh` passed
- [ ] Unrelated worktree changes were preserved
- [ ] No secret, credential, private task state, or sensitive target data is included
- [ ] External writes or publication were not performed without explicit authorization

## Verification

<!-- List exact commands and observed results. Do not write “should pass.” -->

```text
Command:
Result:
```

## Documentation and Compatibility

- [ ] Canonical documentation and routing references are updated
- [ ] Local links and heading anchors pass
- [ ] Machine-consumed JSON/YAML parses
- [ ] Breaking workflow or schema effects are documented
- [ ] Not applicable

## Licensing and Provenance

- [ ] No third-party material was introduced
- [ ] Exact source, revision, scope, license, and notice were added
- [ ] Unresolved permission blocks publication and is stated explicitly

## Reviewer Focus

<!-- Name the highest-risk decision, omission, or behavior reviewers should challenge. -->
