# Branch Audit: main

This file documents what the repository is about, what was checked, what errors
were found, how they were fixed, and what is still missing or unclear.

## Branches Reviewed

Only one branch exists in the GitHub repository at the time of this audit:

- `main`
- `origin/main`

No `develop` branch or other remote branches were present, so there were no
additional branches to checkout, fix, document, or merge.

## What This Project Is About

This repository is an AWS/cloud portfolio project pack. It combines two cloned
learning roadmaps with hands-on implementation folders:

- `60DaysToCloud-source/`: weekly cloud foundations curriculum and reference notes.
- `cloud-skills-roadmap-source/`: month-by-month cloud, DevOps, hybrid, AI, and interview roadmap.
- `projects/`: portfolio-ready AWS project starters with Terraform, app code, CI/CD examples, operations docs, and security patterns.

The main goal is to help someone move from cloud learning material to concrete,
interview-ready project implementations.

## File And Folder Guide

| Path | What it is for | How to debug or extend it |
| --- | --- | --- |
| `README.md` | Top-level overview, roadmap comparison, project list, and usage workflow. | Keep this updated when project folders or source roadmaps change. |
| `BRANCH_AUDIT.md` | Branch-level audit, verification notes, and missing/unclear items. | Update this after fixing CI/build issues or adding branches. |
| `.github/workflows/terraform-portfolio.yml` | Runs Terraform format, init, and validate for the main Terraform portfolio roots. | If CI fails, run the failing `terraform -chdir=<path> init -backend=false` and `terraform validate` locally. |
| `.github/workflows/ansible-syntax.yml` | Runs Ansible syntax checks for bootstrap and hardening playbooks. | Run `ansible-playbook --syntax-check <playbook>` from `projects/16-ansible-ops-automation`. |
| `.github/workflows/policy-as-code.yml` | Installs Conftest and checks Rego policies against sample inputs. | Use Conftest `v0.60.0`; OPA 1.x requires modern Rego syntax. |
| `.github/workflows/jenkins-check.yml` | Checks Jenkinsfile structure and shell script syntax. | Run `bash -n` on each script under `projects/17-jenkins-cicd-pipeline-factory/ci/scripts`. |
| `.github/workflows/python-and-java-apps.yml` | Runs Python app tests and Maven tests. | Use isolated Python virtualenvs and `mvn test` from the Maven app folder. |
| `projects/01-static-website-platform/` | Static website platform using S3, CloudFront, Route 53, ACM, IAM, and GitHub Actions. | Start with `infra/bootstrap`, then run Terraform in `infra/`. |
| `projects/02-ecs-fargate-app/` | ECS Fargate container app with ALB, ECR, CloudWatch, IAM, and Terraform. | Validate app container config and Terraform in `infra/`. |
| `projects/03-serverless-image-pipeline/` | Serverless image pipeline concept with S3, Lambda, SQS, SNS, DynamoDB, and tests. | Expand Lambda handlers before expecting full end-to-end deployment. |
| `projects/04-landing-zone-starter/` | Landing zone starter with logging, IAM baseline, Config, CloudTrail, and security modules. | Run Terraform validation from `infra/`. |
| `projects/05-eks-platform-starter/` | EKS platform starter with network, IAM, EKS, and GitOps structure. | Validate Terraform in `infra/`; GitOps manifests need a real repo URL before deployment. |
| `projects/06-observability-platform/` | Reusable CloudWatch logs, dashboards, alarms, notifications, and SLO docs. | Validate Terraform in `infra/`; module variable syntax must stay Terraform-compatible. |
| `projects/07-internal-developer-platform/` | Platform engineering capstone with reusable modules and dev/stage/prod examples. | Run Terraform from `platform/` or environment folders depending on the workflow. |
| `projects/08-ai-ops-incident-copilot/` | AIOps incident triage platform concept using Bedrock, Lambda, EventBridge, Step Functions, and observability services. | Start by validating Terraform, then add Lambda/runtime code for full functionality. |
| `projects/09-multi-account-security-guardrails/` | Security guardrails for AWS Organizations, Config, GuardDuty, Security Hub, CloudTrail, and SCP concepts. | Validate Terraform and add account-specific values before planning. |
| `projects/10-disaster-recovery-resilience-platform/` | Disaster recovery and resilience platform with Route 53 failover, health checks, backup, and game-day patterns. | Route 53 failover records must use `failover_routing_policy`. |
| `projects/11-event-driven-integration-factory/` | Event-driven workflow starter using EventBridge, Step Functions, SQS, SNS, Lambda, and DynamoDB. | Validate Terraform and add real workflow payload examples before deployment. |
| `projects/12-data-analytics-lakehouse-platform/` | Governed analytics platform with S3, Glue, Athena, Lake Formation, Redshift Serverless, and sample SQL. | Validate Terraform and review IAM/Lake Formation assumptions carefully. |
| `projects/13-global-active-active-app-platform/` | Multi-region active-active delivery pattern with Route 53, CloudFront, Global Accelerator, and health checks. | Route 53 failover records must use `failover_routing_policy`. |
| `projects/14-kubernetes-gitops-platform/` | EKS GitOps platform with Terraform, Argo CD app manifests, ingress, and a sample Flask service. | Run Python tests in `services/sample-api` and Terraform validation in `infra/`. |
| `projects/15-terraform-blueprint-registry/` | Reusable Terraform blueprint registry with VPC and state-backend modules plus dev/prod composition. | Validate both `environments/dev` and `environments/prod`. |
| `projects/16-ansible-ops-automation/` | Ansible automation for Linux/EC2 bootstrap, hardening, deployment, and roles. | Syntax-check playbooks before running against hosts. |
| `projects/17-jenkins-cicd-pipeline-factory/` | Jenkins declarative pipeline, shell scripts, and Flask sample API. | Run shell syntax checks and Python tests in `app/`. |
| `projects/18-maven-cloud-service/` | Spring Boot service built with Maven and packaged with Docker. | Run `mvn test` from `app/`. |
| `projects/19-s3-storage-governance-platform/` | S3 governance with encryption, lifecycle, access controls, and Terraform. | Validate Terraform and review bucket naming before applying. |
| `projects/20-vpc-network-foundation-platform/` | Reusable VPC/networking foundation with subnets, routing, NAT, endpoints, and flow logs. | Validate Terraform and adjust CIDR/subnet sizing per environment. |
| `projects/21-kms-encryption-and-secrets-platform/` | KMS, Secrets Manager, SSM Parameter Store, and encrypted storage baseline. | Validate Terraform and confirm key policy assumptions before apply. |
| `projects/22-policy-as-code-security-gates/` | Conftest/Rego policy-as-code checks for infrastructure guardrails. | Keep policies compatible with OPA 1.x syntax. |
| `projects/23-iam-identity-boundary-platform/` | IAM permission boundaries, GitHub OIDC, and least-privilege access patterns. | Validate Terraform and review trust policies before use. |
| `projects/24-backup-restore-governance-platform/` | AWS Backup, protected storage, retention, and recovery workflow starter. | Validate Terraform and add restore validation runbooks before production use. |

## Previous Errors Found And Fixed

### Terraform variable block syntax

File:

- `projects/06-observability-platform/modules/log-groups/variables.tf`

Problem:

- Terraform rejected a one-line `variable` block with two arguments separated by a comma.

Fix:

- Converted the block to multi-line Terraform syntax:

```hcl
variable "retention_in_days" {
  type    = number
  default = 30
}
```

### Route 53 failover record schema

Files:

- `projects/10-disaster-recovery-resilience-platform/infra/main.tf`
- `projects/13-global-active-active-app-platform/infra/main.tf`

Problem:

- Terraform AWS provider does not support a direct `failover = "PRIMARY"` or `failover = "SECONDARY"` argument on `aws_route53_record`.

Fix:

- Replaced the unsupported argument with the supported block:

```hcl
failover_routing_policy {
  type = "PRIMARY"
}
```

and:

```hcl
failover_routing_policy {
  type = "SECONDARY"
}
```

### Rego policy syntax for OPA 1.x

File:

- `projects/22-policy-as-code-security-gates/policies/terraform.rego`

Problem:

- Conftest `v0.60.0` uses OPA 1.x, which requires `contains` and `if` for partial-set rules.

Fix:

- Updated old-style rules from `deny[msg] { ... }` to:

```rego
deny contains msg if {
  ...
}
```

### Terraform formatting drift

Files:

- `projects/01-static-website-platform/infra/iam.tf`
- `projects/01-static-website-platform/infra/main.tf`
- `projects/04-landing-zone-starter/modules/iam-baseline/main.tf`
- `projects/07-internal-developer-platform/platform/environments/dev/main.tf`
- `projects/07-internal-developer-platform/platform/environments/prod/main.tf`
- `projects/07-internal-developer-platform/platform/environments/stage/main.tf`
- `projects/07-internal-developer-platform/platform/main.tf`
- `projects/07-internal-developer-platform/platform/modules/iam/main.tf`
- `projects/07-internal-developer-platform/platform/variables.tf`

Problem:

- `terraform fmt -recursive` found formatting differences.

Fix:

- Ran `terraform fmt -recursive` to normalize formatting.

## Verification Performed

These checks were run from a clean clone of `main`:

```bash
python -m pytest -q
mvn test
ansible-playbook --syntax-check playbooks/bootstrap.yml
ansible-playbook --syntax-check playbooks/hardening.yml
bash -n projects/17-jenkins-cicd-pipeline-factory/ci/scripts/*.sh
conftest test examples/ --policy policies/
terraform fmt -recursive
terraform init -backend=false
terraform validate
```

Passing checks:

- Python tests for `projects/14-kubernetes-gitops-platform/services/sample-api`
- Python tests for `projects/17-jenkins-cicd-pipeline-factory/app`
- Maven tests for `projects/18-maven-cloud-service/app`
- Ansible syntax checks for bootstrap and hardening playbooks
- Jenkins shell script syntax checks
- Conftest policy check with Conftest `v0.60.0`
- Terraform validation for the workflow matrix after the fixes above

## Missing Or Unclear

- The GitHub repository currently has only `main`; no `develop` branch exists.
- The root README mentions projects `25` to `31`, but the GitHub clone currently contains only projects `01` to `24`.
- Several project folders are portfolio starters, not complete deployable systems. They validate structurally, but many still need runtime code, real account values, diagrams, or end-to-end deployment proof.
- Terraform `init` generated local `.terraform.lock.hcl` files during validation. These are ignored by the repository `.gitignore`; decide later whether lock files should be committed for reproducible provider versions.
- Conftest currently reports `0 tests` because the provided sample inputs are compliant. Add deliberately failing examples or Rego unit tests if you want stronger policy regression coverage.
- GitOps manifests use placeholder repository URLs such as `https://github.com/example/cloud-project1.git`; replace them before deploying Argo CD.
- Most Terraform roots require real AWS account inputs, globally unique names, and cost review before `terraform plan` or `terraform apply`.

