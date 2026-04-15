resource "aws_ecs_service" "this" {
  name            = var.name
  cluster         = var.cluster_arn
  task_definition = var.task_definition
  desired_count   = var.desired_count
}

