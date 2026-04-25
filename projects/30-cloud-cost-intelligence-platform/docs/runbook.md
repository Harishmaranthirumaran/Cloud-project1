# Runbook

## Common checks

- Confirm CUR files are landing on schedule.
- Confirm Glue catalog tables are current.
- Confirm Athena queries return the expected account and tag dimensions.
- Confirm budget alerts reach the right escalation path.

## Failure triage

1. If billing data is missing, check the report delivery configuration and bucket policy.
2. If dashboards are stale, verify Glue crawler or ETL jobs.
3. If spend spikes, review the top services, accounts, and tags before changing infrastructure.

## Safe changes

- Add new cost allocation tags before enforcing chargeback.
- Introduce budget thresholds gradually so teams can adapt.
- Keep automated actions separate from alert-only thresholds until the data quality is stable.
