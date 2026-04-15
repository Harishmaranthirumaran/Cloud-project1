variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "aiops-copilot"
}

variable "log_retention_days" {
  type    = number
  default = 30
}
