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
  default = "global-active-active"
}

variable "hosted_zone_id" {
  type = string
}

variable "record_name" {
  type    = string
  default = "app.example.com"
}

variable "primary_endpoint_id" {
  type = string
}

variable "secondary_endpoint_id" {
  type = string
}

variable "primary_endpoint_fqdn" {
  type = string
}

variable "secondary_endpoint_fqdn" {
  type = string
}
