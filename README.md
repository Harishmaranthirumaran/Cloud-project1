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
| [`projects/08-ai-ops-incident-copilot`](projects/08-ai-ops-incident-copilot) | AI Ops Incident Copilot | Senior DevOps / AIOps Engineer | Bedrock-assisted incident triage, log summarization, and runbook automation. |
| [`projects/09-multi-account-security-guardrails`](projects/09-multi-account-security-guardrails) | Multi-Account Security Guardrails | Cloud Security / Platform Architect | Organization-level guardrails with SCPs, centralized logging, Config, GuardDuty, and Security Hub. |
| [`projects/10-disaster-recovery-resilience-platform`](projects/10-disaster-recovery-resilience-platform) | Disaster Recovery and Resilience Platform | Senior Cloud / SRE | Multi-region failover, backup/restore, health checks, and game-day automation. |
| [`projects/11-event-driven-integration-factory`](projects/11-event-driven-integration-factory) | Event-Driven Integration Factory | Intermediate to Senior Cloud Engineer | Durable business workflows with EventBridge, Step Functions, SQS, SNS, and Lambda. |
| [`projects/12-data-analytics-lakehouse-platform`](projects/12-data-analytics-lakehouse-platform) | Data Analytics Lakehouse Platform | Cloud Data / Platform Engineer | Governed analytics on S3, Glue, Athena, Lake Formation, and Redshift Serverless. |
| [`projects/13-global-active-active-app-platform`](projects/13-global-active-active-app-platform) | Global Active-Active Application Platform | Senior DevOps / Platform Engineer | Multi-region delivery with Route 53, CloudFront, Global Accelerator, and replicated data. |
| [`projects/14-kubernetes-gitops-platform`](projects/14-kubernetes-gitops-platform) | Kubernetes GitOps Platform | Senior Platform / Kubernetes Engineer | EKS, Argo CD, Helm, Kustomize, and progressive delivery patterns. |
| [`projects/15-terraform-blueprint-registry`](projects/15-terraform-blueprint-registry) | Terraform Blueprint Registry | Senior Cloud / DevOps Engineer | Reusable Terraform modules, environments, and remote state conventions. |
| [`projects/16-ansible-ops-automation`](projects/16-ansible-ops-automation) | Ansible Ops Automation | DevOps / SRE Engineer | Idempotent EC2 bootstrap, patching, and hardening with Ansible. |
| [`projects/17-jenkins-cicd-pipeline-factory`](projects/17-jenkins-cicd-pipeline-factory) | Jenkins CI/CD Pipeline Factory | DevOps / Build Engineer | Declarative pipelines, gated releases, quality checks, and artifact promotion. |
| [`projects/18-maven-cloud-service`](projects/18-maven-cloud-service) | Maven Cloud Service | Java / Cloud Engineer | Spring Boot service built with Maven, containerized, and ready for AWS deployment. |

## Current status

- Project 1 is the most complete implementation and includes full Terraform, docs, workflow templates, remote state bootstrap, WAF, and environment examples.
- Projects 4 through 18 now include Terraform entrypoints, platform scaffolds, or deployment pipelines in addition to their briefs and supporting docs.
- The new projects emphasize senior-level AWS DevOps and AIOps themes: security guardrails, incident automation, resilience, event-driven integration, data platforms, and global delivery.
- The added projects extend the showcase into Kubernetes, Terraform modular design, Ansible, Jenkins, and Maven-based Java delivery.

## How to use this repo

1. Open the project folder you want to work on.
2. Read that folder’s `README.md`.
3. Copy its prompt into Claude to generate or extend the project in phases.
4. Commit each milestone separately.

## Repo conventions

- Each project lives in its own folder under `projects/`.
- Each project folder has its own keynote, README, and starter structure.
- Repo-level templates live in the root `.github/` directory.
