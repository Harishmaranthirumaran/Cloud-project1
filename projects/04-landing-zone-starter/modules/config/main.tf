resource "aws_config_configuration_recorder" "this" {
  name     = var.name
  role_arn = var.role_arn
}

