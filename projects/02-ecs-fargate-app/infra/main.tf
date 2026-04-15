locals {
  prefix = "${var.project_name}-${var.environment_name}"
}

# Network, ECR, ECS, ALB, IAM, logs, secrets, and autoscaling modules would live here.

