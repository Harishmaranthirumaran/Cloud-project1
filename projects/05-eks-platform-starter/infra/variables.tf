variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "eks-platform"
}

variable "vpc_cidr" {
  type    = string
  default = "10.30.0.0/16"
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "cluster_name" {
  type    = string
  default = "eks-platform"
}

variable "cluster_role_arn" {
  type    = string
  default = ""
}

variable "irsa_role_name" {
  type    = string
  default = "eks-platform-irsa"
}
