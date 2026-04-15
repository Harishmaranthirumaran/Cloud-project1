output "audit_bucket_name" {
  value = aws_s3_bucket.audit.bucket
}

output "cloudtrail_bucket_name" {
  value = module.cloudtrail.log_bucket_name
}
