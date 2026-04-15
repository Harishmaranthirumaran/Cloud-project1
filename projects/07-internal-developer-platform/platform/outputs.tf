output "sample_api_repository_url" {
  value = aws_ecr_repository.sample_api.repository_url
}

output "task_role_name" {
  value = aws_iam_role.task.name
}

output "task_execution_role_name" {
  value = aws_iam_role.task_execution.name
}

output "cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "service_name" {
  value = aws_ecs_service.sample_api.name
}

output "service_url" {
  value = local.domain_enabled ? "https://${var.domain_name}" : "http://${aws_lb.this.dns_name}"
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "github_deploy_role_arn" {
  value = try(aws_iam_role.github_deploy[0].arn, null)
}

output "waf_enabled" {
  value = var.enable_waf
}
