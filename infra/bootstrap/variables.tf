variable "project_name" {
  description = "Name prefix for remote state resources."
  type        = string
  default     = "aws-static-site-platform"
}

variable "aws_region" {
  description = "AWS region for the remote state bucket and lock table."
  type        = string
  default     = "ap-south-1"
}

