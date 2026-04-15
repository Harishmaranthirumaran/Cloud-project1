locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

resource "aws_s3_bucket" "primary" {
  provider = aws.primary
  bucket   = "${local.resource_prefix}-primary"
}

resource "aws_s3_bucket" "secondary" {
  provider = aws.secondary
  bucket   = "${local.resource_prefix}-secondary"
}

resource "aws_s3_bucket_versioning" "primary" {
  provider = aws.primary
  bucket   = aws_s3_bucket.primary.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "secondary" {
  provider = aws.secondary
  bucket   = aws_s3_bucket.secondary.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_backup_vault" "primary" {
  provider = aws.primary
  name     = "${local.resource_prefix}-vault"
}

resource "aws_iam_role" "backup" {
  provider = aws.primary
  name     = "${local.resource_prefix}-backup"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "backup.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "backup" {
  provider   = aws.primary
  role       = aws_iam_role.backup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_backup_plan" "primary" {
  provider = aws.primary
  name     = "${local.resource_prefix}-plan"

  rule {
    rule_name         = "daily"
    target_vault_name = aws_backup_vault.primary.name
    schedule          = "cron(0 5 * * ? *)"
    lifecycle {
      delete_after = 30
    }
  }
}

resource "aws_backup_selection" "primary" {
  provider     = aws.primary
  name         = "${local.resource_prefix}-selection"
  plan_id      = aws_backup_plan.primary.id
  iam_role_arn = aws_iam_role.backup.arn

  resources = [
    aws_s3_bucket.primary.arn
  ]
}

resource "aws_route53_health_check" "primary" {
  fqdn              = var.primary_endpoint
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 30
}

resource "aws_route53_health_check" "secondary" {
  fqdn              = var.secondary_endpoint
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 30
}

resource "aws_route53_record" "primary" {
  count   = var.hosted_zone_id != "" ? 1 : 0
  zone_id = var.hosted_zone_id
  name    = var.record_name
  type    = "CNAME"
  ttl     = 60

  set_identifier  = "primary"
  failover        = "PRIMARY"
  health_check_id = aws_route53_health_check.primary.id
  records         = [var.primary_endpoint]
}

resource "aws_route53_record" "secondary" {
  count   = var.hosted_zone_id != "" ? 1 : 0
  zone_id = var.hosted_zone_id
  name    = var.record_name
  type    = "CNAME"
  ttl     = 60

  set_identifier  = "secondary"
  failover        = "SECONDARY"
  health_check_id = aws_route53_health_check.secondary.id
  records         = [var.secondary_endpoint]
}
