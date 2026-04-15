resource "aws_cloudwatch_log_group" "central" {
  name              = "/aws/landing-zone/${var.name}"
  retention_in_days = 90
}

