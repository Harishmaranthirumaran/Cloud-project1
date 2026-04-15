output "event_bus_name" {
  value = aws_cloudwatch_event_bus.integration.name
}

output "workflow_state_machine_arn" {
  value = aws_sfn_state_machine.workflow.arn
}
