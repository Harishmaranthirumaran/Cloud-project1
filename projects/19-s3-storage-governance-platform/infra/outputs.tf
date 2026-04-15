output "bucket_name" {
  value = aws_s3_bucket.data.bucket
}

output "kms_key_arn" {
  value = aws_kms_key.s3.arn
}
