variable "project_name" {
  type        = string
  default     = "internal-developer-platform"
}

variable "environment_name" {
  type        = string
  default     = "dev"
}

variable "aws_region" {
  type        = string
  default     = "ap-south-1"
}

variable "domain_name" {
  type        = string
  default     = ""
}

variable "enable_waf" {
  type        = bool
  default     = true
}

