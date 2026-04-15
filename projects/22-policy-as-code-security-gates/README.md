# Policy as Code Security Gates

## Keynote

This project shows how to enforce infrastructure rules before deployment. It centers on policy-as-code for Terraform and gives you a credible DevSecOps story around guardrails, compliance, and pipeline enforcement.

## Best for

- DevSecOps engineer
- Platform engineer
- Cloud security engineer

## Core tools

- Open Policy Agent
- Conftest
- Terraform policy inputs
- GitHub Actions
- Rego

## What it proves

- Preventing insecure infrastructure before apply
- Policy design for cloud guardrails
- CI enforcement of engineering standards

## Starter structure

```text
projects/22-policy-as-code-security-gates/
├── docs/
├── examples/
├── policies/
└── README.md
```

## Build prompt

> Create a production-style policy-as-code project that validates Terraform and cloud configuration using Conftest and Rego. Include sample inputs, guardrail policies for S3 and security groups, and a GitHub Actions workflow that runs the checks in CI.
