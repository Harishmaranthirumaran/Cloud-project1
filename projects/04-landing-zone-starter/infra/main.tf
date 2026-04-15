locals {
  resource_prefix = lower(replace("${var.project_name}-${var.environment_name}", "_", "-"))
  audit_bucket    = var.audit_bucket_name != "" ? var.audit_bucket_name : "${local.resource_prefix}-audit-logs"
}

data "aws_caller_identity" "current" {}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "audit" {
  bucket = "${local.audit_bucket}-${random_id.suffix.hex}"
}

resource "aws_s3_bucket_public_access_block" "audit" {
  bucket                  = aws_s3_bucket.audit.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "audit" {
  bucket = aws_s3_bucket.audit.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "audit" {
  bucket = aws_s3_bucket.audit.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "audit_bucket" {
  statement {
    sid = "AWSCloudTrailAclCheck"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.audit.arn]
  }

  statement {
    sid = "AWSCloudTrailWrite"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.audit.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    sid = "AWSConfigAclCheck"

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.audit.arn]
  }

  statement {
    sid = "AWSConfigWrite"

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.audit.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}

resource "aws_s3_bucket_policy" "audit" {
  bucket = aws_s3_bucket.audit.id
  policy = data.aws_iam_policy_document.audit_bucket.json
}

data "aws_iam_policy_document" "config_assume_role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "config" {
  name               = var.config_role_name
  assume_role_policy = data.aws_iam_policy_document.config_assume_role.json
}

resource "aws_iam_role_policy_attachment" "config" {
  role       = aws_iam_role.config.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

module "logging" {
  source = "../modules/logging"
  name   = local.resource_prefix
}

module "iam_baseline" {
  source = "../modules/iam-baseline"
  name   = local.resource_prefix
}

module "security_baseline" {
  source = "../modules/security-baseline"
  name   = local.resource_prefix
}

module "cloudtrail" {
  source = "../modules/cloudtrail"
  name   = local.resource_prefix
}

module "config" {
  source   = "../modules/config"
  name     = local.resource_prefix
  role_arn = aws_iam_role.config.arn
}

resource "aws_config_configuration_recorder_status" "this" {
  name       = local.resource_prefix
  is_enabled = true
  depends_on = [module.config, aws_config_delivery_channel.this]
}

resource "aws_cloudtrail" "audit" {
  name                          = "${local.resource_prefix}-trail"
  s3_bucket_name                = aws_s3_bucket.audit.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
}

resource "aws_config_delivery_channel" "this" {
  name           = "${local.resource_prefix}-delivery"
  s3_bucket_name = aws_s3_bucket.audit.bucket
}
