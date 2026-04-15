variable "project_name" {
  type    = string
  default = "internal-developer-platform"
}

variable "environment_name" {
  type    = string
  default = "stage"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.40.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.40.1.0/24", "10.40.2.0/24"]
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "task_cpu" {
  type    = number
  default = 256
}

variable "task_memory" {
  type    = number
  default = 512
}

variable "desired_count" {
  type    = number
  default = 2
}

variable "min_desired_count" {
  type    = number
  default = 2
}

variable "max_desired_count" {
  type    = number
  default = 4
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "hosted_zone_name" {
  type    = string
  default = ""
}

variable "hosted_zone_id" {
  type    = string
  default = ""
}

variable "github_repo" {
  type    = string
  default = "Harishmaranthirumaran/Cloud-project1"
}

variable "enable_waf" {
  type    = bool
  default = true
}

