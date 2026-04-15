# VPC Network Foundation Platform

## Keynote

This project shows how to build a reusable AWS network core. It covers VPC design, subnet tiers, NAT, routing, interface endpoints, and flow logs so the portfolio demonstrates proper cloud networking.

## Best for

- Cloud network engineer
- Senior DevOps engineer
- Platform engineer responsible for account foundations

## Core AWS services

- VPC
- Subnets
- Internet gateway
- NAT gateway
- Route tables
- VPC endpoints
- VPC Flow Logs
- CloudWatch Logs
- IAM
- Terraform

## What it proves

- Network segmentation
- Private/public routing
- Centralized logging for traffic visibility
- A reusable foundation for app workloads

## Starter structure

```text
projects/20-vpc-network-foundation-platform/
├── docs/
├── infra/
└── README.md
```

## Build prompt

> Create a production-style AWS VPC foundation with Terraform. Include public and private subnets, NAT gateway routing, VPC endpoints, flow logs, security groups, and clean outputs that make it easy to reuse for other AWS workload projects.
