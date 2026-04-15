resource "aws_s3_bucket" "logs" {
  bucket = "${var.name}-cloudtrail-logs"
}

