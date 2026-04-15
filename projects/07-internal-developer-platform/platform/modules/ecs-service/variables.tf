variable "name" {
  type = string
}

variable "cluster_arn" {
  type = string
}

variable "task_definition" {
  type = string
}

variable "desired_count" {
  type    = number
  default = 2
}

