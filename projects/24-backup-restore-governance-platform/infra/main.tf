locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_kms_key" "backup" {
  description             = "KMS key for backup governance"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "protected" {
  bucket = "${local.resource_prefix}-${random_id.suffix.hex}"
}

resource "aws_s3_bucket_public_access_block" "protected" {
  bucket                  = aws_s3_bucket.protected.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "protected" {
  bucket = aws_s3_bucket.protected.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "protected" {
  bucket = aws_s3_bucket.protected.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.backup.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_backup_vault" "this" {
  name        = "${local.resource_prefix}-vault"
  kms_key_arn = aws_kms_key.backup.arn
}

resource "aws_iam_role" "backup" {
  name = "${local.resource_prefix}-backup"

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
  role       = aws_iam_role.backup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_backup_plan" "this" {
  name = "${local.resource_prefix}-plan"

  rule {
    rule_name         = "daily"
    target_vault_name = aws_backup_vault.this.name
    schedule          = "cron(0 6 * * ? *)"

    lifecycle {
      delete_after = 30
    }
  }
}

resource "aws_backup_selection" "this" {
  name         = "${local.resource_prefix}-selection"
  plan_id      = aws_backup_plan.this.id
  iam_role_arn = aws_iam_role.backup.arn

  resources = [
    aws_s3_bucket.protected.arn
  ]
}
