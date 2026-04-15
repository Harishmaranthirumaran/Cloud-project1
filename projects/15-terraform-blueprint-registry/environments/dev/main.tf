module "network" {
  source     = "../../blueprints/vpc"
  name       = "${var.project_name}-dev"
  cidr_block = var.vpc_cidr
}

module "state_backend" {
  source      = "../../blueprints/state-backend"
  bucket_name = "${var.project_name}-dev-state"
  table_name  = "${var.project_name}-dev-state"
}
