# AWS Static Website Platform

Production-style static website hosting on AWS with Terraform, CloudFront, S3, Route 53, ACM, IAM, and GitHub Actions.

## What this repository contains

- Private S3 origin behind CloudFront
- Optional custom domain support through Route 53
- ACM certificate provisioning for HTTPS
- GitHub Actions deployment workflow with OIDC
- Sample static website and clean repo structure
- Runbook and architecture notes

## Architecture

```mermaid
flowchart LR
  User[Visitor] --> CF[CloudFront]
  CF -->|OAC| S3[(Private S3 Bucket)]
  DNS[Route 53 Optional] --> CF
  ACM[ACM Certificate in us-east-1] --> CF
  GH[GitHub Actions] -->|OIDC| AWS[AWS IAM Role]
  AWS --> S3
  AWS --> CF
```

## Repo layout

```text
app/
infra/
docs/
.github/workflows/
```

## Assumptions

- Default AWS region: `ap-south-1`
- Custom domain is optional
- The first deployment can run with only the S3 bucket and CloudFront distribution

## Quick start

### 1. Bootstrap remote state

```bash
cd infra/bootstrap
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform apply
```

Record the bucket and table names from the outputs, then create `infra/backend.hcl` from `infra/backend.hcl.example`.

### 2. Initialize the main stack with remote state

```bash
cd ..
cp backend.hcl.example backend.hcl
terraform init -backend-config=backend.hcl
terraform plan
terraform apply
```

### 3. Configure GitHub Actions deployment

1. Set up AWS credentials for Terraform bootstrap or use your existing AWS auth.
2. Copy `infra/terraform.tfvars.example` to `infra/terraform.tfvars` and fill in any optional domain values.
3. Set the GitHub repository secrets or variables listed below.
4. Push to `main` to trigger the deploy workflow.

### GitHub Actions deploy

Set these repository secrets or variables:

- `AWS_ROLE_TO_ASSUME`
- `AWS_REGION`
- `S3_BUCKET_NAME`
- `CLOUDFRONT_DISTRIBUTION_ID`

If you enable a custom domain:

- `DOMAIN_NAME`
- `HOSTED_ZONE_ID`

## Milestones

1. Repository skeleton and docs
2. Terraform infrastructure
3. Sample static site
4. GitHub Actions deploy pipeline
5. Security and cleanup guidance

## Notes

- CloudFront invalidation is included in deploys.
- ACM certificate validation is only created when a domain name and hosted zone are provided.
- Route 53 records are optional and can be enabled later.
