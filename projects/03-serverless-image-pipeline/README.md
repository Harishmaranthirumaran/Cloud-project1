# Serverless Image Pipeline

## Keynote

This project demonstrates event-driven design. It is a strong contrast to the static site and ECS projects because it focuses on retries, queues, fan-out, and state rather than servers or containers.

## Best for

- Intermediate cloud engineer
- Serverless-focused DevOps engineer
- Developer interested in AWS architecture patterns

## Core AWS services

- S3
- Lambda
- SQS
- SNS
- DynamoDB
- CloudWatch
- IAM

## What it proves

- Asynchronous workflow design
- Retry and dead-letter queue patterns
- Structured logging and observability
- State tracking in DynamoDB

## Starter structure

```text
projects/03-serverless-image-pipeline/
├── functions/
├── infra/
├── events/
├── tests/
└── docs/
```

## Build prompt

> Build an AWS event-driven image processing pipeline. When an image is uploaded to S3, trigger a Lambda ingestion flow, process metadata asynchronously using SQS, store status in DynamoDB, and send completion or failure notifications through SNS. Include dead-letter queues, retries, structured logging, IAM least privilege, and local test instructions.

