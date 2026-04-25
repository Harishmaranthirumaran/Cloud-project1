variable "project_name" {
  type    = string
  default = "managed-data-platform"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "environment_name" {
  type    = string
  default = "dev"
}

variable "database_engine" {
  type    = string
  default = "aurora-postgresql"
}

variable "search_engine_version" {
  type    = string
  default = "OpenSearch_2.11"
}
