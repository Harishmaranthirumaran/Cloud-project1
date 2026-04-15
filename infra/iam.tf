data "aws_iam_policy_document" "github_oidc_assume_role" {
  count = var.github_repo != "" ? 1 : 0

  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github[0].arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.github_repo}:*"]
    }
  }
}

data "tls_certificate" "github" {
  count = var.github_repo != "" ? 1 : 0
  url   = "https://token.actions.githubusercontent.com"
}

resource "aws_iam_openid_connect_provider" "github" {
  count           = var.github_repo != "" ? 1 : 0
  url             = "https://token.actions.githubusercontent.com"
  client_id_list   = ["sts.amazonaws.com"]
  thumbprint_list  = [data.tls_certificate.github[0].certificates[0].sha1_fingerprint]
}

resource "aws_iam_role" "github_deploy" {
  count              = var.github_repo != "" ? 1 : 0
  name               = "${var.project_name}-github-deploy"
  assume_role_policy = data.aws_iam_policy_document.github_oidc_assume_role[0].json
}

data "aws_iam_policy_document" "github_deploy" {
  count = var.github_repo != "" ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      aws_s3_bucket.site.arn,
      "${aws_s3_bucket.site.arn}/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "cloudfront:CreateInvalidation"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "github_deploy" {
  count  = var.github_repo != "" ? 1 : 0
  name   = "${var.project_name}-github-deploy"
  role   = aws_iam_role.github_deploy[0].id
  policy = data.aws_iam_policy_document.github_deploy[0].json
}
