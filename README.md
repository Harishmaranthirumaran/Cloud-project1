# AWS Project Pack

This repository is a practical project pack built from the ideas in two cloned
learning roadmaps:

- [`60DaysToCloud`](60DaysToCloud-source): a 60-day weekly cloud foundations curriculum.
- [`cloud-skills-roadmap`](cloud-skills-roadmap-source): a longer month-by-month cloud, DevOps, hybrid infrastructure, AI, and interview roadmap.

Those source repos are learning guides: notes, links, checklists, and project
directions. This repo turns those topics into standalone portfolio projects with
Terraform, app scaffolds, docs, runbooks, and deployment patterns.

## Source vs This Project Pack

| Area | `60DaysToCloud-source/` | `cloud-skills-roadmap-source/` | `projects/` in this repo |
| --- | --- | --- | --- |
| Purpose | Learn cloud concepts across 60 days | Build job-ready cloud, DevOps, hybrid, AI, and interview skills over months | Build demonstrable cloud portfolio projects |
| Structure | Week-by-week curriculum folders | Month-by-month roadmap folders plus advanced skills and resources | Numbered project folders, each with its own scope |
| Content style | Notes, links, checklists, and study guidance | Longer roadmap, project prompts, interview prep, certifications, and resource banks | Real project starters with infra, app code, docs, and operations notes |
| Best use | Follow the fast foundations path | Use as the broader career roadmap and project inspiration source | Pick a project, implement it, deploy it, and document the outcome |
| Output | Knowledge and practice direction | Skill plan, project ideas, interview preparation, and learning resources | GitHub-ready portfolio artifacts |

The source repos are useful as roadmaps. These new project folders are the
hands-on implementations you can use to prove the skills from those roadmaps.

## Repository Layout

```text
.
+-- 60DaysToCloud-source/        # Cloned reference curriculum from GitHub
+-- cloud-skills-roadmap-source/ # Cloned month-by-month skills roadmap
+-- projects/                    # New standalone AWS project pack
|   +-- 01-static-website-platform/
|   +-- 02-ecs-fargate-app/
|   +-- ...
|   +-- 31-multi-region-backup-drill-platform/
+-- .github/                     # Repo-level PR templates and automation
+-- README.md                    # This guide
```

## Project Tracks

| Track | Folders | Focus |
| --- | --- | --- |
| Foundational delivery | `01` to `03` | Static hosting, containers, serverless, and event-driven basics |
| Governance and platform engineering | `04` to `07` | Landing zones, EKS, observability, and internal developer platforms |
| Senior portfolio projects | `08` to `13` | AIOps, guardrails, resilience, integration, data, and global delivery |
| Tooling and delivery | `14` to `18` | GitOps, Terraform blueprints, Ansible, Jenkins, and Maven delivery |
| Core AWS control plane | `19` to `24` | S3 governance, networking, KMS/secrets, policy-as-code, IAM, and backup |
| Advanced platform themes | `25` to `31` | Edge security, managed data, orchestration, streaming, zero trust, FinOps, and DR drills |

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
| [`projects/25-edge-delivery-security-platform`](projects/25-edge-delivery-security-platform) | Edge Delivery Security Platform | Cloud Security / Platform Engineer | CloudFront, WAF, ACM, Route 53, and ALB as a global edge delivery story. |
| [`projects/26-managed-data-platform`](projects/26-managed-data-platform) | Managed Data Platform | Senior Data / Platform Engineer | RDS, Aurora, DynamoDB, ElastiCache, and OpenSearch in one governed data stack. |
| [`projects/27-deep-systems-orchestration-platform`](projects/27-deep-systems-orchestration-platform) | Deep Systems Orchestration Platform | Senior Cloud / Platform Engineer | ECS, EKS, Lambda, Step Functions, and EventBridge for mixed-compute orchestration. |
| [`projects/28-event-streaming-analytics-platform`](projects/28-event-streaming-analytics-platform) | Event Streaming Analytics Platform | Senior Data / Platform Engineer | Kinesis, Firehose, Lambda, Glue, Athena, and OpenSearch for near-real-time analytics. |
| [`projects/29-zero-trust-workforce-access-platform`](projects/29-zero-trust-workforce-access-platform) | Zero Trust Workforce Access Platform | Cloud Security / IAM Engineer | Identity Center, Verified Access, Client VPN, and audit controls for internal access. |
| [`projects/30-cloud-cost-intelligence-platform`](projects/30-cloud-cost-intelligence-platform) | Cloud Cost Intelligence Platform | FinOps / Platform Engineer | CUR, Athena, QuickSight, Budgets, and SNS for spend visibility and response. |
| [`projects/31-multi-region-backup-drill-platform`](projects/31-multi-region-backup-drill-platform) | Multi-Region Backup Drill Platform | Senior Cloud / Reliability Engineer | AWS Backup, restore drills, cross-region copy, and recovery evidence. |

## How To Work On This Repo

1. Use `60DaysToCloud-source/` when you want a fast weekly learning sequence for a topic.
2. Use `cloud-skills-roadmap-source/` when you want a longer role-focused roadmap, hybrid/AI direction, resources, or interview preparation.
3. Use `projects/` when you want to build something portfolio-ready from those topics.
4. Pick one project folder and read its `README.md`.
5. Review the project docs, usually under `docs/`, before touching infrastructure.
6. Copy `terraform.tfvars.example` to `terraform.tfvars` only inside the project you are working on.
7. Run Terraform from the project infrastructure folder, usually `infra/`.
8. Commit each meaningful milestone separately: scaffold, infrastructure, app, CI/CD, docs, and cleanup.

Typical Terraform workflow:

```bash
cd projects/01-static-website-platform/infra
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

Use the same pattern for other project folders that contain an `infra/` or
`platform/` directory.

## What Changed From The Old Files

- The old files in `60DaysToCloud-source/` are mostly weekly README files.
- The old files in `cloud-skills-roadmap-source/` are mostly monthly roadmap README files, advanced skills notes, resources, and project prompts.
- The new files under `projects/` are implementation-oriented and split by portfolio project.
- The new structure adds Terraform roots, example variables, runbooks, architecture notes, app scaffolds, CI/CD examples, and policy/security examples.
- The project pack is no longer just a study guide. It is meant to produce deployable examples and interview-ready walkthroughs.
- Each project is independent, so you can build one project without completing every previous folder.

## How The Roadmaps Map To Projects

| Roadmap topic | Best project folders |
| --- | --- |
| Cloud foundations and first deployment | `01-static-website-platform`, `02-ecs-fargate-app` |
| Infrastructure as Code and Terraform modules | `04-landing-zone-starter`, `15-terraform-blueprint-registry`, `20-vpc-network-foundation-platform` |
| Configuration automation | `16-ansible-ops-automation` |
| Containers and orchestration | `02-ecs-fargate-app`, `05-eks-platform-starter`, `14-kubernetes-gitops-platform`, `27-deep-systems-orchestration-platform` |
| Monitoring and observability | `06-observability-platform`, `08-ai-ops-incident-copilot` |
| CI/CD pipelines | `17-jenkins-cicd-pipeline-factory`, `18-maven-cloud-service` |
| Cloud security and guardrails | `09-multi-account-security-guardrails`, `21-kms-encryption-and-secrets-platform`, `22-policy-as-code-security-gates`, `23-iam-identity-boundary-platform`, `25-edge-delivery-security-platform`, `29-zero-trust-workforce-access-platform` |
| Hybrid, AI, and RAG-inspired systems | `08-ai-ops-incident-copilot`, `27-deep-systems-orchestration-platform` |
| Cost optimization and FinOps | `30-cloud-cost-intelligence-platform` |
| Incident thinking, resilience, and recovery | `10-disaster-recovery-resilience-platform`, `24-backup-restore-governance-platform`, `31-multi-region-backup-drill-platform` |

## Recommended Path

Start with `01-static-website-platform` for the fastest end-to-end AWS result.
Then move through `02` and `03` for containers and serverless. After that, pick
projects based on the role you want to target:

- DevOps: `02`, `05`, `14`, `16`, `17`, `18`
- Cloud platform: `04`, `07`, `15`, `20`, `27`
- Security: `09`, `21`, `22`, `23`, `25`, `29`
- SRE and resilience: `06`, `10`, `24`, `31`
- Data and FinOps: `12`, `26`, `28`, `30`

## Repo Conventions

- Each project lives in its own folder under `projects/`.
- Each project should have a `README.md` with scope, architecture, usage, and next steps.
- Infrastructure examples should keep secrets out of git and use `terraform.tfvars.example` for placeholders.
- Project docs should explain decisions, operations, cost, security, and failure handling where relevant.
- The cloned `60DaysToCloud-source/` and `cloud-skills-roadmap-source/` folders are reference material. Do not edit them unless you intentionally want to update those source copies.
