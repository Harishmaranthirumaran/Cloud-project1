module "platform" {
  source           = "../../"
  project_name     = "internal-developer-platform"
  environment_name = "prod"
  aws_region       = "ap-south-1"
  enable_waf       = true
}

