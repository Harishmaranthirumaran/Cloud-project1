variable "project_name" {
  type    = string
  default = "multi-region-backup-drill-platform"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "secondary_region" {
  type    = string
  default = "us-west-2"
}

variable "environment_name" {
  type    = string
  default = "dev"
}

variable "recovery_objective_hours" {
  type    = number
  default = 4
}
