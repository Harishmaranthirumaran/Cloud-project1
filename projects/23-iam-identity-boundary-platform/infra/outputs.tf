output "boundary_policy_arn" {
  value = aws_iam_policy.boundary.arn
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}
