output "accelerator_dns_name" {
  value = aws_globalaccelerator_accelerator.this.dns_name
}

output "accelerator_zone_id" {
  value = aws_globalaccelerator_accelerator.this.hosted_zone_id
}
