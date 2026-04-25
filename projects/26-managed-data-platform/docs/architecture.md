# Architecture

## Goal

Provide a realistic managed data stack that can support an application with multiple data access patterns.

## Service roles

- `Aurora` or `RDS` handles relational transactions.
- `DynamoDB` handles high-throughput key-value state.
- `ElastiCache` absorbs hot reads and session-style access.
- `OpenSearch` supports search, filtering, and discovery use cases.

## Design notes

- Place data services in private subnets.
- Use KMS encryption everywhere possible.
- Keep secrets in Secrets Manager, not in Terraform variables.
- Align backup retention with the business recovery objective.
