variable "project_name" {
  type    = string
  default = "edge-delivery-security-platform"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "environment_name" {
  type    = string
  default = "dev"
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "hosted_zone_name" {
  type    = string
  default = ""
}

variable "hosted_zone_id" {
  type    = string
  default = ""
}
