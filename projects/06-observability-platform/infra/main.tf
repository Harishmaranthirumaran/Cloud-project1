locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

module "log_groups" {
  source            = "../modules/log-groups"
  name              = local.resource_prefix
  retention_in_days = var.retention_in_days
}

module "alarms" {
  source = "../modules/alarms"
  name   = local.resource_prefix
}

module "dashboards" {
  source = "../modules/dashboards"
  name   = local.resource_prefix
}

module "notifications" {
  source = "../modules/notifications"
  name   = local.resource_prefix
}
