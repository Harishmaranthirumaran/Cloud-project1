# EKS Platform Starter

## Keynote

This is the Kubernetes-heavy option. It is the most operationally complex project here and should be used when the role explicitly values EKS, GitOps, ingress controllers, and cluster lifecycle management.

## Best for

- Advanced DevOps engineer
- Platform engineer
- SRE transitioning to cloud platform work

## Core AWS services and tools

- EKS
- ECR
- IAM Roles for Service Accounts
- AWS Load Balancer Controller
- ExternalDNS
- Karpenter or Cluster Autoscaler
- Prometheus
- Grafana
- Argo CD
- Terraform

## What it proves

- Kubernetes platform operations
- GitOps delivery
- Secure workload patterns
- Cluster add-on management

## Starter structure

```text
projects/05-eks-platform-starter/
├── infra/
├── gitops/
├── services/
└── docs/
```

## Build prompt

> Build an AWS EKS platform starter project using Terraform and GitOps. Provision the cluster, worker management, IAM roles for service accounts, ingress, DNS integration, observability stack, and Argo CD application management. Include a sample app, secure defaults, environment overlays, and day-2 operational guidance.

