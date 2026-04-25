# Architecture

## Goal

Show the right compute model for each class of work, then connect them with event-driven orchestration.

## Service roles

- `EventBridge` acts as the system event bus.
- `Step Functions` coordinates long-running or multi-step business processes.
- `Lambda` handles glue code, enrichment, and lightweight reactions.
- `ECS` runs steady application services.
- `EKS` runs platform-managed workloads that benefit from Kubernetes primitives.

## Design notes

- Keep synchronous APIs on ECS unless Kubernetes adds clear value.
- Use Lambda for short-lived event handlers, not for everything.
- Keep Step Functions definitions versioned and reviewable.
- Emit structured logs from every compute layer.
