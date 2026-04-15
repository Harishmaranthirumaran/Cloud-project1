locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

data "aws_iam_policy_document" "boundary" {
  statement {
    sid    = "DenyPolicyEscalation"
    effect = "Deny"
    actions = [
      "iam:CreateUser",
      "iam:CreateAccessKey",
      "iam:PutRolePolicy",
      "iam:AttachUserPolicy",
      "iam:AttachRolePolicy"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "boundary" {
  name   = "${local.resource_prefix}-boundary"
  policy = data.aws_iam_policy_document.boundary.json
}

data "aws_iam_policy_document" "github_oidc_assume_role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
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

resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

resource "aws_iam_role" "github_actions" {
  name                 = "${local.resource_prefix}-github-actions"
  permissions_boundary = aws_iam_policy.boundary.arn
  assume_role_policy   = data.aws_iam_policy_document.github_oidc_assume_role.json
}

data "aws_iam_policy_document" "deploy" {
  statement {
    effect = "Allow"
    actions = [
      "cloudformation:DescribeStacks",
      "ecs:UpdateService",
      "ecr:BatchGetImage"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "deploy" {
  name   = "${local.resource_prefix}-deploy"
  policy = data.aws_iam_policy_document.deploy.json
}

resource "aws_iam_role_policy_attachment" "deploy" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.deploy.arn
}
