# Kubernetes GitOps Platform

## Keynote

This project shows a production-minded Kubernetes platform story on AWS. It combines EKS, GitOps, ingress, rollout patterns, and service delivery so it reads like real platform engineering rather than a demo cluster.

## Best for

- Senior platform engineer
- Kubernetes engineer
- DevOps engineer moving into platform ownership

## Core AWS and Kubernetes tools

- Amazon EKS
- EC2 managed node groups
- Amazon ECR
- Argo CD
- Helm
- Kustomize
- AWS Load Balancer Controller
- ExternalDNS
- Prometheus
- Grafana
- Terraform

## What it proves

- Kubernetes platform design
- GitOps promotion flow
- Ingress and service exposure
- Deployment, rollout, and observability patterns
- Containerized sample service with health checks and a Dockerfile

## Starter structure

```text
projects/14-kubernetes-gitops-platform/
├── docs/
├── gitops/
├── infra/
└── services/
```

## Build prompt

> Create a production-style Kubernetes GitOps platform on AWS. Use Terraform to provision EKS, node groups, VPC networking, and a sample ECR repository. Add Argo CD, Helm, Kustomize, ingress, and service manifests for a sample application. Include rollout notes, observability hooks, and a realistic path to multi-environment promotion for a senior portfolio.
