locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_kms_key" "primary" {
  description             = "Primary key for encryption and secrets"
  deletion_window_in_days = 7
}

resource "aws_kms_alias" "primary" {
  name          = "alias/${local.resource_prefix}"
  target_key_id = aws_kms_key.primary.key_id
}

resource "aws_s3_bucket" "encrypted" {
  bucket = "${local.resource_prefix}-${random_id.suffix.hex}"
}

resource "aws_s3_bucket_public_access_block" "encrypted" {
  bucket                  = aws_s3_bucket.encrypted.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "encrypted" {
  bucket = aws_s3_bucket.encrypted.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypted" {
  bucket = aws_s3_bucket.encrypted.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.primary.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_secretsmanager_secret" "app" {
  name       = "${local.resource_prefix}/app"
  kms_key_id = aws_kms_key.primary.arn
}

resource "aws_secretsmanager_secret_version" "app" {
  secret_id     = aws_secretsmanager_secret.app.id
  secret_string = jsonencode({ username = "app-user", password = "change-me" })
}

resource "aws_ssm_parameter" "app_password" {
  name   = "/${local.resource_prefix}/app/password"
  type   = "SecureString"
  key_id = aws_kms_key.primary.arn
  value  = "change-me"
}
