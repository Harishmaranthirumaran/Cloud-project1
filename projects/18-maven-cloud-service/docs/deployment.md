# Deployment

- Build with `mvn test package`.
- Build the container image from `app/Dockerfile`.
- Push to ECR or another container registry.
- Deploy to ECS Fargate, EKS, or a similar AWS runtime.
