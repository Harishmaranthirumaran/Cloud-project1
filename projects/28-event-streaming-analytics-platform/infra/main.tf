locals {
  prefix          = "${var.project_name}-${var.environment_name}"
  resource_prefix = lower(replace(local.prefix, "_", "-"))
  platform_tags = {
    Project     = var.project_name
    Environment = var.environment_name
    Owner       = "platform"
    Mode        = var.stream_mode
  }
}

# This stack is intentionally scaffolded for a portfolio build.
# Expand it with Kinesis, Firehose, Lambda, S3, Glue, Athena, OpenSearch, and observability resources.
