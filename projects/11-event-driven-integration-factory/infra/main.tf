locals {
  resource_prefix = lower(replace(var.project_name, "_", "-"))
}

resource "aws_cloudwatch_log_group" "workflow" {
  name              = "/aws/integration/${local.resource_prefix}/workflow"
  retention_in_days = 30
}

resource "aws_sns_topic" "notifications" {
  name = "${local.resource_prefix}-notifications"
}

resource "aws_sqs_queue" "events" {
  name = "${local.resource_prefix}-events"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.events_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "events_dlq" {
  name = "${local.resource_prefix}-events-dlq"
}

resource "aws_dynamodb_table" "workflow" {
  name         = "${local.resource_prefix}-workflow"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "event_id"

  attribute {
    name = "event_id"
    type = "S"
  }
}

resource "aws_iam_role" "stepfunctions" {
  name = "${local.resource_prefix}-sfn"

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
  name = "${local.resource_prefix}-sfn"
  role = aws_iam_role.stepfunctions.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["dynamodb:PutItem"]
        Resource = aws_dynamodb_table.workflow.arn
      },
      {
        Effect = "Allow"
        Action = ["sns:Publish"]
        Resource = aws_sns_topic.notifications.arn
      }
    ]
  })
}

resource "aws_sfn_state_machine" "workflow" {
  name     = "${local.resource_prefix}-workflow"
  role_arn = aws_iam_role.stepfunctions.arn

  definition = jsonencode({
    StartAt = "PersistEvent"
    States = {
      PersistEvent = {
        Type     = "Task"
        Resource = "arn:aws:states:::dynamodb:putItem"
        Parameters = {
          TableName = aws_dynamodb_table.workflow.name
          Item = {
            event_id = {
              S = "$$.Execution.Name"
            }
            status = {
              S = "RECEIVED"
            }
          }
        }
        Next = "Notify"
      }
      Notify = {
        Type     = "Task"
        Resource = "arn:aws:states:::sns:publish"
        Parameters = {
          TopicArn = aws_sns_topic.notifications.arn
          Message = "Workflow event processed"
        }
        End = true
      }
    }
  })
}

resource "aws_cloudwatch_event_bus" "integration" {
  name = "${local.resource_prefix}-bus"
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
      Effect = "Allow"
      Action = "states:StartExecution"
      Resource = aws_sfn_state_machine.workflow.arn
    }]
  })
}

resource "aws_cloudwatch_event_rule" "integration" {
  name           = "${local.resource_prefix}-integration"
  event_bus_name = aws_cloudwatch_event_bus.integration.name

  event_pattern = jsonencode({
    source         = ["com.example.orders"]
    "detail-type" = ["OrderCreated"]
  })
}

resource "aws_cloudwatch_event_target" "integration" {
  rule           = aws_cloudwatch_event_rule.integration.name
  event_bus_name = aws_cloudwatch_event_bus.integration.name
  arn            = aws_sfn_state_machine.workflow.arn
  role_arn       = aws_iam_role.events.arn
}
