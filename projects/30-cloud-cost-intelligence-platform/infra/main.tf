locals {
  prefix          = "${var.project_name}-${var.environment_name}"
  resource_prefix = lower(replace(local.prefix, "_", "-"))
  cost_tags = {
    Project     = var.project_name
    Environment = var.environment_name
    Frequency   = var.report_frequency
  }
}

# This stack is intentionally scaffolded for a portfolio build.
# Expand it with CUR, S3, Glue, Athena, QuickSight, Budgets, SNS, and response automation.
