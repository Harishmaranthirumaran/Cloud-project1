output "audit_bucket_name" {
  value = aws_s3_bucket.audit.bucket
}

output "security_topic_arn" {
  value = aws_sns_topic.security.arn
}
