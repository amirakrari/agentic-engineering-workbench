# Plane Workspace Configuration

This portable skill intentionally ships with **no workspace identifiers**.

For each operation, resolve and record:

```yaml
workspace: <explicit slug or id>
project: <explicit identifier or id>
states: {}
labels: {}
cycles: {}
modules: {}
members: {}
resolved_at: <timestamp>
source: <user input or live read-only lookup>
```

Do not persist credentials. Treat cached IDs as hints and refresh before writes. If more than one workspace/project matches, stop before mutation and present a self-contained choice. Explicit authorization must name or unambiguously imply the target and mutation; authentication alone is not authorization.
