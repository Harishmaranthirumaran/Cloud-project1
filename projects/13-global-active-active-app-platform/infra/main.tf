locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

resource "aws_globalaccelerator_accelerator" "this" {
  name            = local.resource_prefix
  ip_address_type = "IPV4"
  enabled         = true
}

resource "aws_globalaccelerator_listener" "this" {
  accelerator_arn = aws_globalaccelerator_accelerator.this.id
  protocol        = "TCP"

  port_range {
    from_port = 443
    to_port   = 443
  }
}

resource "aws_globalaccelerator_endpoint_group" "primary" {
  listener_arn          = aws_globalaccelerator_listener.this.id
  endpoint_group_region = var.primary_region
  health_check_port     = 443

  endpoint_configuration {
    endpoint_id = var.primary_endpoint_id
    weight      = 128
  }
}

resource "aws_globalaccelerator_endpoint_group" "secondary" {
  listener_arn          = aws_globalaccelerator_listener.this.id
  endpoint_group_region = var.secondary_region
  health_check_port     = 443
  traffic_dial_percentage = 0

  endpoint_configuration {
    endpoint_id = var.secondary_endpoint_id
    weight      = 128
  }
}

resource "aws_route53_health_check" "primary" {
  fqdn              = var.primary_endpoint_fqdn
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 30
}

resource "aws_route53_health_check" "secondary" {
  fqdn              = var.secondary_endpoint_fqdn
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 30
}

resource "aws_route53_record" "primary" {
  zone_id        = var.hosted_zone_id
  name           = var.record_name
  type           = "CNAME"
  ttl            = 60
  set_identifier = "primary"
  failover       = "PRIMARY"
  health_check_id = aws_route53_health_check.primary.id
  records        = [var.primary_endpoint_fqdn]
}

resource "aws_route53_record" "secondary" {
  zone_id        = var.hosted_zone_id
  name           = var.record_name
  type           = "CNAME"
  ttl            = 60
  set_identifier = "secondary"
  failover       = "SECONDARY"
  health_check_id = aws_route53_health_check.secondary.id
  records        = [var.secondary_endpoint_fqdn]
}
