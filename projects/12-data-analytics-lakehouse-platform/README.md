# Data Analytics Lakehouse Platform

## Keynote

This project shows how to build a governed analytics platform on AWS. It combines ingest, catalog, query, and access control so it demonstrates cloud data engineering without turning into a generic ETL demo.

## Best for

- Cloud data engineer
- Platform engineer
- DevOps engineer working with analytics workloads

## Core AWS services

- S3
- AWS Glue
- Athena
- Lake Formation
- Redshift Serverless
- EventBridge
- Lambda
- CloudWatch
- IAM
- KMS
- Terraform

## What it proves

- Governed data lake design
- Query and catalog automation
- Permission boundaries for analytics
- Repeatable infrastructure for data workloads

## Starter structure

```text
projects/12-data-analytics-lakehouse-platform/
├── docs/
├── queries/
├── infra/
└── README.md
```

## Build prompt

> Create a production-style AWS analytics lakehouse project with S3, Glue, Athena, Lake Formation, and Redshift Serverless. Use Terraform to show landing zones for raw, curated, and governed data, plus automation for cataloging and access control. Include sample queries, architecture notes, and a project narrative that fits a senior AWS portfolio.
