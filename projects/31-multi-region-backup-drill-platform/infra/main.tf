locals {
  prefix          = "${var.project_name}-${var.environment_name}"
  resource_prefix = lower(replace(local.prefix, "_", "-"))
  recovery_tags = {
    Project         = var.project_name
    Environment     = var.environment_name
    PrimaryRegion   = var.aws_region
    SecondaryRegion = var.secondary_region
  }
}

# This stack is intentionally scaffolded for a portfolio build.
# Expand it with AWS Backup, S3, EBS, EFS, EventBridge, Lambda, Route 53, and observability resources.
