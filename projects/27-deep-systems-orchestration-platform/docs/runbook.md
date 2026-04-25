# Runbook

## Common checks

- Confirm EventBridge rules are matching the expected sources.
- Confirm Step Functions executions are succeeding and not timing out.
- Confirm ECS services and EKS workloads are healthy.
- Confirm Lambda error rates and retries stay within tolerance.

## Failure triage

1. If events stop flowing, check the EventBridge rule targets and IAM permissions.
2. If workflows stall, inspect the Step Functions execution history.
3. If only one compute layer fails, verify its logs and deployment revision separately.

## Safe changes

- Deploy workflow changes behind a versioned state machine definition.
- Roll out compute changes independently for ECS, EKS, and Lambda.
- Add alarms before widening event fan-out.
