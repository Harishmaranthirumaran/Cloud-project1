package terraform.guardrails

deny contains msg if {
  input.resource_type == "aws_s3_bucket"
  input.public == true
  msg := "S3 buckets must not be public"
}

deny contains msg if {
  input.resource_type == "aws_security_group"
  input.ingress[_].cidr == "0.0.0.0/0"
  input.ingress[_].from_port == 22
  msg := "SSH must not be open to the world"
}
