variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "landing-zone"
}

variable "environment_name" {
  type    = string
  default = "management"
}

variable "audit_bucket_name" {
  type    = string
  default = ""
}

variable "config_role_name" {
  type    = string
  default = "landing-zone-config-recorder"
}
