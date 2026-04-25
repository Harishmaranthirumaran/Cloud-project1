variable "project_name" {
  type    = string
  default = "event-streaming-analytics-platform"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "environment_name" {
  type    = string
  default = "dev"
}

variable "retention_days" {
  type    = number
  default = 30
}

variable "stream_mode" {
  type    = string
  default = "kinesis"
}
