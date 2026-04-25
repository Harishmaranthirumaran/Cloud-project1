locals {
  prefix          = "${var.project_name}-${var.environment_name}"
  resource_prefix = lower(replace(local.prefix, "_", "-"))
}

# This stack is intentionally scaffolded for a portfolio build.
# Expand it with private subnets, RDS or Aurora, DynamoDB, ElastiCache, OpenSearch, and KMS-backed secrets.
