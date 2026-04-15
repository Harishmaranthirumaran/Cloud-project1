# Observability Platform

## Keynote

This project is centered on operations quality rather than product delivery. It shows how to standardize logging, metrics, dashboards, and incident response across multiple AWS workloads.

## Best for

- Advanced cloud engineer
- Senior DevOps engineer
- SRE portfolio

## Core AWS services

- CloudWatch Logs
- CloudWatch Metrics
- CloudWatch Alarms
- EventBridge
- SNS
- X-Ray
- Systems Manager
- Terraform

## What it proves

- Monitoring and alerting design
- SLO-style thinking
- Operational runbooks
- Reusable baseline modules

## Starter structure

```text
projects/06-observability-platform/
├── modules/
├── examples/
├── docs/
└── README.md
```

## Build prompt

> Build a reusable AWS observability platform repository. It should support ECS services, Lambda functions, and generic EC2 or EKS-hosted apps. Create Terraform modules for log groups, alarms, dashboards, metric filters, SNS notifications, and optional X-Ray tracing. Add example app integrations, SLO-style thinking, and incident response runbooks.

