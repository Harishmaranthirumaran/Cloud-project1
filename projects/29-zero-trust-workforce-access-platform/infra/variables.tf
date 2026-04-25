variable "project_name" {
  type    = string
  default = "zero-trust-workforce-access-platform"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "environment_name" {
  type    = string
  default = "dev"
}

variable "access_mode" {
  type    = string
  default = "verified-access"
}

variable "identity_provider_name" {
  type    = string
  default = "identity-center"
}
