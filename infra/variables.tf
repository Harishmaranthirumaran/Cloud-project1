variable "project_name" {
  description = "Name prefix for resources."
  type        = string
  default     = "aws-static-site-platform"
}

variable "aws_region" {
  description = "Primary AWS region."
  type        = string
  default     = "ap-south-1"
}

variable "domain_name" {
  description = "Optional custom domain name for the site."
  type        = string
  default     = ""
}

variable "hosted_zone_id" {
  description = "Optional Route 53 hosted zone ID for the custom domain."
  type        = string
  default     = ""
}

variable "cloudfront_price_class" {
  description = "CloudFront price class."
  type        = string
  default     = "PriceClass_100"
}

variable "github_repo" {
  description = "GitHub repository in owner/name form for OIDC trust policy."
  type        = string
  default     = ""
}

