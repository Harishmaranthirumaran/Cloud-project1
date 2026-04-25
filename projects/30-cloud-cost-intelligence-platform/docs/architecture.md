# Architecture

## Goal

Give engineering and finance teams a common source of truth for AWS spend, usage, and trend analysis.

## Main layers

1. CUR exports billing data into S3.
2. Glue catalogs the data for Athena.
3. Athena powers ad hoc queries and scheduled reports.
4. QuickSight presents dashboards to stakeholders.
5. Budgets and Lambda automate response when thresholds are crossed.

## Operational notes

- Keep raw billing data immutable.
- Partition billing views by account, service, and time.
- Align alerts with the action the team can actually take.
