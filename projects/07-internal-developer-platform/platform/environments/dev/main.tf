module "platform" {
  source           = "../../"
  project_name     = "internal-developer-platform"
  environment_name = "dev"
  aws_region       = "ap-south-1"
  enable_waf       = false
}

