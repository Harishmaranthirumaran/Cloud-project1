# Pipeline Flow

1. Checkout source.
2. Run lint and tests.
3. Build the artifact.
4. Build and tag the container image.
5. Push to ECR.
6. Hand off deployment to ECS, EKS, or a release job.
