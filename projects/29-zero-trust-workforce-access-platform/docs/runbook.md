# Runbook

## Common checks

- Confirm Identity Center assignments are correct.
- Confirm Verified Access policies match the expected device posture.
- Confirm internal ALB health checks pass.
- Confirm audit logs are flowing into the security account or central log bucket.

## Failure triage

1. If users cannot sign in, check identity provider and assignment mapping.
2. If access is denied unexpectedly, review Verified Access policy conditions.
3. If applications are unreachable, verify ALB targets, VPN routes, and security groups.

## Safe changes

- Roll out access policy changes to a pilot group first.
- Add new internal applications with explicit role mappings.
- Keep cloud audit controls in place before widening access.
