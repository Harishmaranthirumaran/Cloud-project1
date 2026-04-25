# Runbook

## Common checks

- Confirm database and cache subnets are in private ranges.
- Confirm security groups only allow application access.
- Confirm backups, snapshots, and maintenance windows are configured.
- Confirm search domain health and indexing lag are acceptable.

## Failure triage

1. If the app cannot connect, verify security groups, subnet placement, and secret values.
2. If reads are slow, inspect cache hit rate before scaling the database.
3. If search results are stale, check indexing lag and domain health.

## Safe changes

- Apply database parameter changes in a maintenance window.
- Increase cache size before changing application read paths.
- Reindex OpenSearch in a controlled rollout when mapping changes are required.
