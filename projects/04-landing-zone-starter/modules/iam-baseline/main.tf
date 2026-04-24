resource "aws_iam_role" "baseline" {
  name = var.name
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = []
  })
}

