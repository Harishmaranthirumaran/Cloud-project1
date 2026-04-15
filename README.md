# AWS Project Pack

This repository is now organized as a pack of separate AWS project folders.

## Projects

| Folder | Project | Role | Keynote |
| --- | --- | --- | --- |
| [`projects/01-static-website-platform`](projects/01-static-website-platform) | Static Website Platform | Junior Cloud / Entry DevOps | Fast, secure static hosting with S3, CloudFront, Route 53, ACM, and GitHub Actions. |
| [`projects/02-ecs-fargate-app`](projects/02-ecs-fargate-app) | ECS Fargate App | Junior to Intermediate DevOps | Container deployment story with ALB, ECS, ECR, logging, and CI/CD. |
| [`projects/03-serverless-image-pipeline`](projects/03-serverless-image-pipeline) | Serverless Image Pipeline | Intermediate Cloud Engineer | Event-driven async architecture with S3, Lambda, SQS, SNS, and DynamoDB. |
| [`projects/04-landing-zone-starter`](projects/04-landing-zone-starter) | Landing Zone Starter | Cloud Architect | Multi-account governance, logging, security baselines, and account strategy. |
| [`projects/05-eks-platform-starter`](projects/05-eks-platform-starter) | EKS Platform Starter | Advanced DevOps / Platform Engineer | GitOps and Kubernetes platform with ingress, monitoring, and cluster add-ons. |
| [`projects/06-observability-platform`](projects/06-observability-platform) | Observability Platform | Advanced Cloud / SRE | Reusable alarms, dashboards, log groups, and incident response patterns. |
| [`projects/07-internal-developer-platform`](projects/07-internal-developer-platform) | Internal Developer Platform | Senior DevOps / Platform Engineer | End-to-end platform experience with promotion, security, observability, and service templates. |

## Current status

- Project 1 is the most complete implementation and includes full Terraform, docs, workflow templates, remote state bootstrap, WAF, and environment examples.
- Projects 2 through 7 are organized as separate folders with differentiated briefs and starter scaffolds.

## How to use this repo

1. Open the project folder you want to work on.
2. Read that folder’s `README.md`.
3. Copy its prompt into Claude to generate or extend the project in phases.
4. Commit each milestone separately.

## Repo conventions

- Each project lives in its own folder under `projects/`.
- Each project folder has its own keynote, README, and starter structure.
- Repo-level templates live in the root `.github/` directory.

