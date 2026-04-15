# Runbook

## Deploy

1. Update the static files in `app/`.
2. Run the GitHub Actions workflow or deploy manually with Terraform outputs.
3. Invalidate CloudFront after upload.

## Rollback

1. Restore the previous asset version in S3.
2. Re-run the invalidation workflow for the affected paths.

## Cleanup

1. Remove DNS records if you created a custom domain.
2. Run `terraform destroy` from `infra/`.
3. Delete the S3 bucket objects if the destroy process leaves versioned content behind.

## Troubleshooting

- `403` from CloudFront: check the S3 bucket policy and OAC settings.
- TLS errors: verify the ACM certificate is in `us-east-1` and validated.
- Deploy fails: confirm the GitHub OIDC role trust policy and permissions.

