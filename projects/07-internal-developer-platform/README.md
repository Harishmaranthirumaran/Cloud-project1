# Internal Developer Platform

## Keynote

This is the capstone project. It combines application delivery, environment promotion, security, observability, and reusable platform modules into one coherent repo.

## Best for

- DevOps engineer with 3+ years of experience
- Platform engineer candidate
- Senior cloud engineer candidate

## Core AWS services

- VPC
- ECS Fargate or EKS
- ECR
- ALB
- Route 53
- ACM
- IAM
- Secrets Manager
- CloudWatch
- SNS
- Terraform
- GitHub Actions

## What it proves

- Platform thinking
- Production deployment workflow design
- Promotion and rollback strategy
- Security and observability by default

## Starter structure

```text
projects/07-internal-developer-platform/
├── platform/
├── services/
├── .github/workflows/
├── docs/
└── README.md
```

## Build prompt

> Help me build a production-style internal developer platform on AWS as a GitHub portfolio project. Use Terraform and GitHub Actions. Default to ECS Fargate unless there is a strong reason to pick EKS. I want a platform that supports one sample microservice, modular infrastructure, dev-stage-prod environments, CI/CD, image scanning, secrets management, observability, alarms, dashboards, and operational runbooks. Generate the repository in phases. For each phase, create production-style files, explain tradeoffs briefly, and keep the implementation practical for one engineer building a portfolio project.

## Environment flow

- Bootstrap remote state once, then use the environment examples in `platform/environments/dev`, `platform/environments/stage`, and `platform/environments/prod`.
- Run each environment from its own folder so state, variables, and promotion steps stay explicit.
- Use `dev` for automatic deploys, `stage` for validation, and `prod` for approval-gated releases.
- Set these repository variables after you apply Terraform:
  - `AWS_REGION`
  - `ECR_REPOSITORY_URI`
  - `ECS_CLUSTER_NAME`
  - `ECS_SERVICE_NAME`
  - `ECS_CLUSTER_NAME_STAGE`
  - `ECS_SERVICE_NAME_STAGE`
  - `ECS_CLUSTER_NAME_PROD`
  - `ECS_SERVICE_NAME_PROD`
- Set `AWS_ROLE_TO_ASSUME` as a repository secret for workflow authentication.
