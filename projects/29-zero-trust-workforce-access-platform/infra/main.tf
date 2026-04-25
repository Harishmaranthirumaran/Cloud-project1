locals {
  prefix          = "${var.project_name}-${var.environment_name}"
  resource_prefix = lower(replace(local.prefix, "_", "-"))
  access_tags = {
    Project     = var.project_name
    Environment = var.environment_name
    AccessModel = var.access_mode
    IdP         = var.identity_provider_name
  }
}

# This stack is intentionally scaffolded for a portfolio build.
# Expand it with IAM Identity Center, Verified Access, Client VPN, ALB, and governance resources.
