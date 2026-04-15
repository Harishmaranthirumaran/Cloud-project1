output "sample_api_repository_url" {
  value = module.ecr.repository_url
}

output "platform_role_name" {
  value = module.iam.role_name
}

