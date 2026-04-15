# Architecture

- App container runs on ECS Fargate behind an ALB.
- ECR stores the built image.
- CloudWatch stores logs and metrics.
- Secrets Manager injects runtime config.

