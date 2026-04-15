variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "observability"
}

variable "retention_in_days" {
  type    = number
  default = 30
}
