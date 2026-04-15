# Architecture

- Reusable platform modules expose network, compute, registry, secrets, and observability primitives.
- Sample service deploys through the same pipeline as real services.
- Promotions move from dev to stage to prod.
- The platform module is the root composition layer; environment folders call into it with different settings.
- The deploy path uses ECR plus ECS service updates rather than mutable hand-managed instances.
