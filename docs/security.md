# Security

## IAM guidance

- GitHub Actions should use OIDC, not static AWS keys.
- The deploy role should only have access to the site bucket and CloudFront invalidation.
- Avoid granting write access to other AWS services in the deploy path.

## S3 and CloudFront

- Keep the S3 bucket private.
- Use CloudFront Origin Access Control for origin access.
- Block all public bucket access.
- Attach a response headers policy to enforce browser security headers.

## TLS

- Use ACM in `us-east-1` for CloudFront.
- Add DNS validation only when a custom domain is enabled.

## Edge protection

- Enable CloudFront WAF for the production workspace.
- Keep the rate limit conservative to avoid noisy false positives.

## Operational security

- Revoke unused GitHub secrets and rotate role assumptions if the repo changes ownership.
- Review CloudFront invalidations and S3 object versions during incident recovery.
