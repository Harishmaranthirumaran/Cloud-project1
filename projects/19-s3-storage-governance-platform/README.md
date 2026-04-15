# S3 Storage Governance Platform

## Keynote

This project shows how to govern S3 properly in AWS. It focuses on encryption, versioning, lifecycle rules, access control, and bucket-level guardrails so the storage story looks production-grade.

## Best for

- Cloud storage engineer
- Security-minded DevOps engineer
- Platform engineer owning object storage standards

## Core AWS services

- Amazon S3
- AWS KMS
- IAM
- CloudTrail-compatible access patterns
- Terraform

## What it proves

- Bucket hardening and least privilege
- Encryption and retention policies
- Storage lifecycle design
- Reusable storage governance patterns

## Starter structure

```text
projects/19-s3-storage-governance-platform/
├── docs/
├── infra/
└── README.md
```

## Build prompt

> Create a production-style S3 governance project with Terraform. Include encrypted buckets, versioning, lifecycle management, public access blocking, bucket policies, and operational documentation that shows how to standardize object storage safely across AWS environments.
