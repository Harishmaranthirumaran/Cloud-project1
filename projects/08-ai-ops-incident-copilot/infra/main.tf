locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

resource "aws_cloudwatch_log_group" "incident" {
  name              = "/aws/aiops/${local.resource_prefix}/incidents"
  retention_in_days = var.log_retention_days
}

resource "aws_sns_topic" "incident" {
  name = "${local.resource_prefix}-incident-alerts"
}

resource "aws_sqs_queue" "incident_dlq" {
  name                      = "${local.resource_prefix}-dlq"
  message_retention_seconds = 1209600
}

resource "aws_sqs_queue" "incident" {
  name                       = "${local.resource_prefix}-incidents"
  visibility_timeout_seconds = 60

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.incident_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_dynamodb_table" "incidents" {
  name         = "${local.resource_prefix}-incidents"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "incident_id"

  attribute {
    name = "incident_id"
    type = "S"
  }
}

resource "aws_iam_role" "stepfunctions" {
  name = "${local.resource_prefix}-stepfunctions"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "states.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "stepfunctions" {
  name = "${local.resource_prefix}-stepfunctions"
  role = aws_iam_role.stepfunctions.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem"
        ]
        Resource = aws_dynamodb_table.incidents.arn
      },
      {
        Effect = "Allow"
        Action = [
          "sns:Publish"
        ]
        Resource = aws_sns_topic.incident.arn
      }
    ]
  })
}

resource "aws_sfn_state_machine" "triage" {
  name     = "${local.resource_prefix}-triage"
  role_arn = aws_iam_role.stepfunctions.arn

  definition = jsonencode({
    StartAt = "RecordIncident"
    States = {
      RecordIncident = {
        Type     = "Task"
        Resource = "arn:aws:states:::dynamodb:putItem"
        Parameters = {
          TableName = aws_dynamodb_table.incidents.name
          Item = {
            incident_id = {
              S = "$$.Execution.Name"
            }
            source = {
              S = "cloudwatch"
            }
            status = {
              S = "OPEN"
            }
          }
        }
        Next = "NotifyOnCall"
      }
      NotifyOnCall = {
        Type     = "Task"
        Resource = "arn:aws:states:::sns:publish"
        Parameters = {
          TopicArn = aws_sns_topic.incident.arn
          Message  = "AIOps incident triage started"
        }
        End = true
      }
    }
  })
}

resource "aws_iam_role" "events" {
  name = "${local.resource_prefix}-events"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "events.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "events" {
  name = "${local.resource_prefix}-events"
  role = aws_iam_role.events.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "states:StartExecution"
      Resource = aws_sfn_state_machine.triage.arn
    }]
  })
}

resource "aws_cloudwatch_event_rule" "incident" {
  name        = "${local.resource_prefix}-incident"
  description = "Route critical CloudWatch alarm events into the AIOps flow"

  event_pattern = jsonencode({
    source        = ["aws.cloudwatch"]
    "detail-type" = ["CloudWatch Alarm State Change"]
    detail = {
      state = {
        value = ["ALARM"]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "incident" {
  rule     = aws_cloudwatch_event_rule.incident.name
  arn      = aws_sfn_state_machine.triage.arn
  role_arn = aws_iam_role.events.arn
}
