locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

module "network" {
  source     = "./network"
  cidr_block = var.vpc_cidr
}

resource "aws_iam_role" "cluster" {
  count = var.cluster_role_arn == "" ? 1 : 0
  name  = "${local.resource_prefix}-cluster"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

module "iam" {
  source = "./iam"
  name   = var.irsa_role_name
}

module "eks" {
  source           = "./eks"
  cluster_name     = var.cluster_name
  cluster_role_arn = var.cluster_role_arn != "" ? var.cluster_role_arn : aws_iam_role.cluster[0].arn
  subnet_ids       = length(var.subnet_ids) > 0 ? var.subnet_ids : module.network.subnet_ids
}
