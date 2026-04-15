output "bucket_name" {
  value = aws_s3_bucket.site.bucket
}

output "environment_name" {
  value = local.workspace_name
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.site.domain_name
}

output "website_url" {
  value = local.domain_enabled ? "https://${var.domain_name}" : "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "github_deploy_role_arn" {
  value       = try(aws_iam_role.github_deploy[0].arn, null)
  description = "ARN for the GitHub Actions deploy role."
}

output "waf_enabled" {
  value = var.enable_waf
}
