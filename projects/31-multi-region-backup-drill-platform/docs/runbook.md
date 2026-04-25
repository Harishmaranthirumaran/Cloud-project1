# Runbook

## Common checks

- Confirm backup plans cover the intended resources.
- Confirm cross-region copy jobs are completing.
- Confirm scheduled drills are firing on time.
- Confirm evidence and notifications land in the expected destinations.

## Failure triage

1. If a backup is missing, check the selection tags and plan association.
2. If a drill fails, inspect the restore target configuration and IAM permissions.
3. If cross-region copies lag, check vault access policies and regional service health.

## Safe changes

- Start with one non-critical workload before broadening drills.
- Increase retention or frequency only after restore evidence is stable.
- Keep backup copy and restore validation changes separate when possible.
