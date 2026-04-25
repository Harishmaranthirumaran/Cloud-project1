locals {
  prefix          = "${var.project_name}-${var.environment_name}"
  resource_prefix = lower(replace(local.prefix, "_", "-"))
  domain_enabled  = var.domain_name != ""
}

data "aws_availability_zones" "available" {
  state = "available"
}

# This stack is intentionally scaffolded for a portfolio build.
# Expand it with VPC, ALB, CloudFront, WAF, ACM, and Route 53 resources.
