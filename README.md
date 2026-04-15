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
| [`projects/19-s3-storage-governance-platform`](projects/19-s3-storage-governance-platform) | S3 Storage Governance Platform | Cloud Storage / Security Engineer | Versioning, encryption, lifecycle, logging, and access control for S3 at scale. |
| [`projects/20-vpc-network-foundation-platform`](projects/20-vpc-network-foundation-platform) | VPC Network Foundation Platform | Senior Cloud / Network Engineer | VPC, subnets, NAT, endpoints, route tables, and flow logs for a reusable network core. |
| [`projects/21-kms-encryption-and-secrets-platform`](projects/21-kms-encryption-and-secrets-platform) | KMS Encryption and Secrets Platform | Cloud Security / DevOps Engineer | Multi-purpose KMS design with aliases, key policies, SSM parameters, and Secrets Manager. |
| [`projects/22-policy-as-code-security-gates`](projects/22-policy-as-code-security-gates) | Policy as Code Security Gates | DevSecOps Engineer | OPA/Conftest-style checks, Terraform policy rules, and pipeline enforcement. |
| [`projects/23-iam-identity-boundary-platform`](projects/23-iam-identity-boundary-platform) | IAM Identity Boundary Platform | Cloud Security / IAM Engineer | Least-privilege roles, permission boundaries, OIDC, and access patterns. |
| [`projects/24-backup-restore-governance-platform`](projects/24-backup-restore-governance-platform) | Backup and Restore Governance Platform | Senior Cloud / Reliability Engineer | AWS Backup, restore validation, S3 protections, and operational recovery patterns. |

## Current status

- Project 1 is the most complete implementation and includes full Terraform, docs, workflow templates, remote state bootstrap, WAF, and environment examples.
- Projects 4 through 24 now include Terraform entrypoints, platform scaffolds, deployment pipelines, or policy automation in addition to their briefs and supporting docs.
- The new projects emphasize senior-level AWS DevOps and AIOps themes: security guardrails, incident automation, resilience, event-driven integration, data platforms, and global delivery.
- The added projects extend the showcase into Kubernetes, Terraform modular design, Ansible, Jenkins, Maven-based Java delivery, storage governance, network foundations, KMS/secrets, policy-as-code, IAM boundaries, and backup governance.

## How to use this repo

1. Open the project folder you want to work on.
2. Read that folder’s `README.md`.
3. Copy its prompt into Claude to generate or extend the project in phases.
4. Commit each milestone separately.

## Repo conventions

- Each project lives in its own folder under `projects/`.
- Each project folder has its own keynote, README, and starter structure.
- Repo-level templates live in the root `.github/` directory.
