variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "network-foundation"
}

variable "vpc_cidr" {
  type    = string
  default = "10.70.0.0/16"
}
