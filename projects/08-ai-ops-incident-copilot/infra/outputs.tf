output "incident_topic_arn" {
  value = aws_sns_topic.incident.arn
}

output "state_machine_arn" {
  value = aws_sfn_state_machine.triage.arn
}
