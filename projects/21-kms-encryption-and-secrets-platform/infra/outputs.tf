output "kms_key_arn" {
  value = aws_kms_key.primary.arn
}

output "secret_arn" {
  value = aws_secretsmanager_secret.app.arn
}

output "bucket_name" {
  value = aws_s3_bucket.encrypted.bucket
}
