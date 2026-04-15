data "aws_caller_identity" "current" {}

locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
  admin_arn       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
}

resource "aws_kms_key" "data" {
  description             = "KMS key for analytics data"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "raw" {
  bucket = "${local.resource_prefix}-raw-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket" "curated" {
  bucket = "${local.resource_prefix}-curated-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket" "athena" {
  bucket = "${local.resource_prefix}-athena-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "raw" {
  bucket = aws_s3_bucket.raw.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.data.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "curated" {
  bucket = aws_s3_bucket.curated.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.data.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_glue_catalog_database" "lakehouse" {
  name = "${local.resource_prefix}_db"
}

resource "aws_iam_role" "glue" {
  name = "${local.resource_prefix}-glue"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "glue.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "glue" {
  role       = aws_iam_role.glue.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_glue_crawler" "raw" {
  name          = "${local.resource_prefix}-raw-crawler"
  database_name = aws_glue_catalog_database.lakehouse.name
  role          = aws_iam_role.glue.arn

  s3_target {
    path = "s3://${aws_s3_bucket.raw.bucket}/"
  }
}

resource "aws_athena_workgroup" "analytics" {
  name = "${local.resource_prefix}-analytics"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.athena.bucket}/results/"
    }
  }
}

resource "aws_lakeformation_data_lake_settings" "this" {
  admins = [local.admin_arn]
}
