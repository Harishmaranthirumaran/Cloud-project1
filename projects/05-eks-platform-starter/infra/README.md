# Infrastructure

This folder contains the root Terraform composition for the EKS platform starter.

## Layout

- `network/` builds the VPC and public subnets
- `iam/` defines a starter IRSA role
- `eks/` creates the cluster skeleton
- `addons/` is reserved for Helm-based add-ons once the cluster exists

## Notes

- Supply `subnet_ids` only if you want to override the module defaults.
- If you use a pre-created cluster role, set `cluster_role_arn`; otherwise the root stack creates a starter one.
