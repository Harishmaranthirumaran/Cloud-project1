variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "blueprint-registry"
}

variable "vpc_cidr" {
  type    = string
  default = "10.60.0.0/16"
}
