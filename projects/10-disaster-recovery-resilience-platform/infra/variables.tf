variable "primary_region" {
  type    = string
  default = "us-east-1"
}

variable "secondary_region" {
  type    = string
  default = "us-west-2"
}

variable "project_name" {
  type    = string
  default = "dr-resilience"
}

variable "hosted_zone_id" {
  type    = string
  default = ""
}

variable "record_name" {
  type    = string
  default = "app.example.com"
}

variable "primary_endpoint" {
  type    = string
  default = "primary.example.com"
}

variable "secondary_endpoint" {
  type    = string
  default = "secondary.example.com"
}
