# Terraform Blueprint Registry

## Keynote

This project shows how I organize Terraform for reuse. It focuses on blueprint-style modules, environment composition, and clean remote-state conventions so the repo reads like a real infrastructure library instead of a one-off stack.

## Best for

- Senior DevOps engineer
- Terraform-heavy cloud engineer
- Platform engineer building reusable foundations

## Core Terraform patterns

- Reusable modules
- Environment composition
- VPC and state backend blueprints
- Opinionated variable and output contracts
- Remote state bootstrap patterns

## What it proves

- Terraform module design
- Environment separation
- Infrastructure-as-code conventions
- Starter registry thinking

## Starter structure

```text
projects/15-terraform-blueprint-registry/
├── blueprints/
├── environments/
├── docs/
└── README.md
```

## Build prompt

> Create a Terraform blueprint registry on AWS. Build reusable modules for a VPC and a state backend, then compose them from dev and prod environment roots. Include clear variables, outputs, and docs so the project demonstrates modular Terraform design and state management for a senior DevOps portfolio.
