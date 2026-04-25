# Architecture

## Goal

Deliver a public web application through the AWS edge while keeping the origin private and controllable.

## Main layers

1. Route 53 routes the custom domain to CloudFront.
2. CloudFront terminates viewer traffic and applies the response headers policy.
3. AWS WAF inspects requests before they reach the origin.
4. The ALB serves as the origin and load-balances traffic to the app tier.
5. ACM provides the viewer certificate for HTTPS.

## Operational notes

- Keep the ALB private to CloudFront if you can enforce origin access controls.
- Add WAF rate-based rules for abuse scenarios and allow-list known health checks.
- Use CloudWatch alarms for 4xx, 5xx, and origin latency.
