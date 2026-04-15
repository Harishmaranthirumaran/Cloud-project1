# Jenkins CI/CD Pipeline Factory

## Keynote

This project shows how I structure Jenkins for cloud delivery. It focuses on declarative pipelines, build/test/package stages, container publishing, and deployment handoff so the repo demonstrates CI/CD ownership rather than only infrastructure.

## Best for

- DevOps engineer
- Build and release engineer
- Platform engineer owning delivery pipelines

## Core tools

- Jenkins
- Declarative Pipeline
- Docker
- AWS ECR
- AWS ECS or EKS handoff
- Quality gates
- Artifact promotion

## What it proves

- Pipeline design
- Build automation
- Release gating
- Delivery to cloud targets
- Sample application build and container packaging

## Starter structure

```text
projects/17-jenkins-cicd-pipeline-factory/
├── ci/
├── docs/
├── Jenkinsfile
└── README.md
```

## Build prompt

> Create a production-style Jenkins CI/CD project for an AWS workload. Add a declarative Jenkinsfile, reusable shell scripts, quality gates, Docker image build and push stages, and deployment handoff steps. Make it feel like a real pipeline factory for a portfolio with 3+ years of DevOps experience.
