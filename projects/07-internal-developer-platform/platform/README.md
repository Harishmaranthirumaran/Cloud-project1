# Platform

This folder is the deployable root module for the internal developer platform.

## What it builds

- VPC and public subnets
- Application Load Balancer
- ECS cluster, task definition, and service
- ECR repository for the sample API
- CloudWatch log group and Secrets Manager secret
- Optional Route 53 and ACM wiring
- Optional WAF attachment
- GitHub OIDC deploy role

## Environment model

- `platform/environments/dev` for automatic release flow
- `platform/environments/stage` for validation and promotion
- `platform/environments/prod` for approval-gated releases

## Operational inputs

- Configure `AWS_ROLE_TO_ASSUME` as a repository secret.
- Set repository variables for `AWS_REGION`, `ECR_REPOSITORY_URI`, `ECS_CLUSTER_NAME`, and the stage/prod cluster and service names.
