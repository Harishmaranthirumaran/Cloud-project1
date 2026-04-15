# AI Ops Incident Copilot

## Keynote

This project shows how to use AWS and generative AI to shorten incident response. It combines log triage, alert enrichment, runbook guidance, and human approval flows so it looks like real AIOps work instead of a demo prompt.

## Best for

- Senior DevOps engineer
- AIOps engineer
- Platform engineer adding AI to operations

## Core AWS services

- Amazon Bedrock
- Lambda
- EventBridge
- CloudWatch Logs and Metrics
- OpenSearch Service
- SQS
- SNS
- Step Functions
- DynamoDB
- IAM
- KMS
- Terraform

## What it proves

- AI-assisted incident summarization
- Log and metric correlation
- Safe approval gates for automation
- Operational workflows that are useful in production

## Starter structure

```text
projects/08-ai-ops-incident-copilot/
├── automation/
├── docs/
├── infra/
└── README.md
```

## Build prompt

> Create a production-style AWS AIOps project that ingests alarms, logs, and incidents, then uses Bedrock to summarize likely causes, suggest runbooks, and route the right response path. Use Terraform, Lambda, EventBridge, CloudWatch, OpenSearch, Step Functions, SQS, SNS, DynamoDB, and IAM. Include safe approval steps, observability, sample runbooks, and documentation that makes the project credible for a 3+ year AWS DevOps/AIOps portfolio.
