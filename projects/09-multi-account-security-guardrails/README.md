# Multi-Account Security Guardrails

## Keynote

This project shows how to design AWS governance for scale. It covers account structure, centralized audit logging, policy guardrails, and detective controls that a senior DevOps or cloud security engineer should be able to explain clearly.

## Best for

- Cloud security engineer
- Platform architect
- Senior DevOps engineer

## Core AWS services

- AWS Organizations
- Control Tower
- Service Control Policies
- IAM Identity Center
- AWS Config
- CloudTrail
- Security Hub
- GuardDuty
- Detective
- S3
- KMS
- Terraform

## What it proves

- Multi-account governance design
- Guardrails and policy management
- Centralized logging and security baselines
- Secure onboarding for new accounts and teams

## Starter structure

```text
projects/09-multi-account-security-guardrails/
├── docs/
├── policies/
├── infra/
└── README.md
```

## Build prompt

> Create a production-style AWS multi-account security project using Organizations, Control Tower, SCPs, IAM Identity Center, Config, CloudTrail, GuardDuty, and Security Hub. Use Terraform to show account guardrails, central logging, baseline security controls, and onboarding for new accounts. Include architecture docs, policy examples, and a practical rollout plan that fits a portfolio for a 3+ year AWS DevOps/security candidate.
