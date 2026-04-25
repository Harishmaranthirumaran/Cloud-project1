# Architecture

## Goal

Turn backup retention into a real recovery program with scheduled drills and measurable outcomes.

## Main layers

1. AWS Backup protects workloads and copies recovery points.
2. Cross-region vaults preserve a secondary recovery option.
3. EventBridge schedules restore drills and evidence collection.
4. Lambda coordinates the restore test and records the result.
5. CloudWatch and SNS capture failures and notify operators.

## Operational notes

- Test restore time, not only backup completion.
- Keep drill evidence in a durable location.
- Tie recovery objectives to business impact and service priority.
