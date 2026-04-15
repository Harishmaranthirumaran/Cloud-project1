# KMS Encryption and Secrets Platform

## Keynote

This project shows how to standardize encryption and secrets handling on AWS. It combines KMS, Secrets Manager, SSM Parameter Store, and encrypted storage so the repo demonstrates a serious security baseline.

## Best for

- Cloud security engineer
- DevOps engineer owning encryption standards
- Platform engineer supporting application secrets

## Core AWS services

- AWS KMS
- AWS Secrets Manager
- AWS Systems Manager Parameter Store
- Amazon S3
- IAM
- Terraform

## What it proves

- Encryption standardization
- Secrets handling and rotation patterns
- KMS-backed storage protection
- A practical baseline for secure workloads

## Starter structure

```text
projects/21-kms-encryption-and-secrets-platform/
├── docs/
├── infra/
└── README.md
```

## Build prompt

> Create a production-style AWS encryption and secrets project with Terraform. Include KMS keys and aliases, encrypted S3 storage, Secrets Manager, Parameter Store, and documentation that explains how teams should use encryption and secret distribution safely.
