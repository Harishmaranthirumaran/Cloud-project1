output "primary_bucket" {
  value = aws_s3_bucket.primary.bucket
}

output "secondary_bucket" {
  value = aws_s3_bucket.secondary.bucket
}
