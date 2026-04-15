# Disaster Recovery and Resilience Platform

## Keynote

This project demonstrates how to design for failure on AWS. It focuses on backups, restore testing, health-based failover, and repeatable game days so you can show resilience thinking rather than just infrastructure deployment.

## Best for

- Senior cloud engineer
- SRE / reliability engineer
- DevOps engineer with recovery ownership

## Core AWS services

- Route 53
- CloudFront
- Global Accelerator
- AWS Backup
- S3
- RDS or Aurora
- Lambda
- EventBridge
- Step Functions
- CloudWatch
- SNS
- DynamoDB
- Terraform

## What it proves

- Recovery strategy design
- Regional and zonal failure planning
- Restore validation and game-day automation
- Operational readiness and incident response

## Starter structure

```text
projects/10-disaster-recovery-resilience-platform/
├── docs/
├── gamedays/
├── infra/
└── README.md
```

## Build prompt

> Create a production-style AWS disaster recovery project with multi-region failover, backup and restore automation, health checks, and game-day workflows. Use Terraform, Route 53, CloudFront, Global Accelerator, AWS Backup, Lambda, Step Functions, CloudWatch, SNS, and a sample workload. Include runbooks, validation steps, and a realistic RTO/RPO story for a 3+ year AWS DevOps portfolio.
