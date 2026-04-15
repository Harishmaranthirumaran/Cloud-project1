output "vpc_id" {
  value = module.network.vpc_id
}

output "state_bucket" {
  value = module.state_backend.bucket_name
}
