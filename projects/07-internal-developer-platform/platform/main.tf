locals {
  prefix = "${var.project_name}-${var.environment_name}"
}

module "network" {
  source     = "./modules/network"
  cidr_block = "10.40.0.0/16"
}

module "ecr" {
  source = "./modules/ecr"
  name   = "${local.prefix}-sample-api"
}

module "iam" {
  source = "./modules/iam"
  name   = "${local.prefix}-platform"
}

module "observability" {
  source = "./modules/observability"
  name   = "/aws/${local.prefix}/sample-api"
}

module "secrets" {
  source = "./modules/secrets"
  name   = "${local.prefix}/sample-api/config"
}

output "platform_prefix" {
  value = local.prefix
}

