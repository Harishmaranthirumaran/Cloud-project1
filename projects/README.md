# Project Index

Use this folder as the launcher for the portfolio packs. Each project is designed to stand on its own, but the set is arranged to show progression from foundational cloud delivery to senior-level platform, security, resilience, data, and AIOps work.

## Tracks

- Foundational delivery: `01` to `03`
- Governance and platform engineering: `04` to `07`
- Senior portfolio projects: `08` to `13`
- Tooling and delivery projects: `14` to `18`
- Core AWS control plane projects: `19` to `24`
- Edge, data, orchestration, security, and FinOps portfolio projects: `25` to `31`
- Terraform roots now exist across the governance, platform, and senior tracks so each folder can act as a real starter stack.

## Folder conventions

Each numbered folder is a standalone project. Its root `README.md` explains the
project goal, target role, core services, proof points, and starter structure.

Primary component folders use these names consistently:

- `app/` or `services/`: application code, runtime manifests, tests, and Dockerfiles.
- `infra/`: Terraform roots, variables, providers, outputs, and backend examples.
- `docs/`: architecture notes, runbooks, cost notes, security notes, and operations guides.
- `gitops/`: Kubernetes manifests, Argo CD applications, Helm, and Kustomize assets.
- `functions/`: Lambda handlers and shared serverless code.
- `modules/` or `blueprints/`: reusable infrastructure building blocks.
- `examples/`, `queries/`, and `policies/`: sample inputs, analytics queries, and policy rules.
- `environments/`: environment-specific configuration and promotion structure.

Keep secrets, local state, generated artifacts, and real `terraform.tfvars`
files out of git. Commit examples, templates, documentation, and reusable source
files instead.

## Suggested order

1. Start with `01-static-website-platform` if you want the fastest end-to-end AWS story.
2. Move into `02-ecs-fargate-app` and `03-serverless-image-pipeline` for compute and event-driven depth.
3. Use `04-landing-zone-starter`, `05-eks-platform-starter`, `06-observability-platform`, and `07-internal-developer-platform` to show platform maturity.
4. Finish with the senior projects for security, AIOps, resilience, data, edge delivery, and multi-region systems.
5. Use `14` through `18` to show Kubernetes, Terraform module design, Ansible automation, Jenkins pipelines, and Java build tooling.
6. Use `19` through `24` to show storage governance, networking, encryption, policy-as-code, IAM, and backup operations.
7. Use `25` through `31` to show edge security, managed data services, deep orchestration, streaming analytics, zero-trust access, FinOps, and restore drill automation.
