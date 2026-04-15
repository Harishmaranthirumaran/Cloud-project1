# ECS Fargate App

## Keynote

This project shows how to ship a containerized web app on AWS without going into Kubernetes. It is the cleanest step up from the static site project because it adds build, registry, orchestration, and load balancing while staying operationally simple.

## Best for

- Junior DevOps engineer
- Intermediate cloud engineer
- Developer moving into platform engineering

## Core AWS services

- ECS Fargate
- ECR
- ALB
- VPC
- CloudWatch Logs
- Secrets Manager
- IAM
- GitHub Actions

## What it proves

- Container build and deployment
- Load balancing and health checks
- Task execution and service IAM design
- CI/CD automation

## Starter structure

```text
projects/02-ecs-fargate-app/
├── app/
├── infra/
├── docs/
└── .github/workflows/
```

## Build prompt

> Create a production-style AWS ECS Fargate project for a small web application. Use Terraform, ECR, ECS Fargate, ALB, CloudWatch Logs, Secrets Manager, and GitHub Actions. Generate the app, Dockerfile, Terraform, workflows, health checks, autoscaling basics, and documentation. Follow least privilege and environment separation.

