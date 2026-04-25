# Runbook

## Common checks

- Confirm the CloudFront distribution is deployed and the alternate domain name is attached.
- Confirm the ACM certificate is issued in `us-east-1`.
- Confirm the Route 53 alias record points to CloudFront.
- Confirm the ALB target group reports healthy targets.

## Failure triage

1. If users see TLS errors, check the certificate status and domain mapping.
2. If users get `403` or `429`, review WAF logs and managed rule actions.
3. If users get `5xx`, check ALB target health and origin logs.

## Safe changes

- Roll out WAF rule updates in count mode first.
- Validate DNS changes with a lower TTL before cutover.
- Use CloudFront invalidations only when content changes require them.
