# Event-Driven Integration Factory

## Keynote

This project shows how to build durable business workflows on AWS. It is a strong way to prove you can decouple services, handle retries, model failure, and automate integrations without overusing synchronous APIs.

## Best for

- Intermediate to senior cloud engineer
- DevOps engineer
- Platform engineer building workflow automation

## Core AWS services

- EventBridge
- Step Functions
- SQS
- SNS
- Lambda
- DynamoDB
- API Gateway
- CloudWatch Logs
- IAM
- KMS
- Terraform

## What it proves

- Event-driven architecture
- Retry, dead-letter, and idempotency design
- Cross-service orchestration
- Integration patterns that map to real business systems

## Starter structure

```text
projects/11-event-driven-integration-factory/
├── docs/
├── integrations/
├── infra/
└── README.md
```

## Build prompt

> Create a production-style AWS event-driven integration platform with EventBridge, Step Functions, SQS, SNS, Lambda, and DynamoDB. Model a few realistic business workflows with retries, DLQs, and idempotency. Use Terraform and clear documentation so the result looks like a credible AWS portfolio project for a 3+ year DevOps engineer.
