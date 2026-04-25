variable "project_name" {
  type    = string
  default = "cloud-cost-intelligence-platform"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "environment_name" {
  type    = string
  default = "dev"
}

variable "budget_threshold_percent" {
  type    = number
  default = 80
}

variable "report_frequency" {
  type    = string
  default = "daily"
}
