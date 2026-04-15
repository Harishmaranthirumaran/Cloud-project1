output "bucket_name" {
  value = aws_s3_bucket.protected.bucket
}

output "backup_vault_name" {
  value = aws_backup_vault.this.name
}
