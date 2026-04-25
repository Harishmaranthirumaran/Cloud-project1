# Architecture

## Goal

Capture operational or product events at scale, enrich them quickly, and land them in a durable analytics layer.

## Main layers

1. Kinesis Data Streams receives raw events from producers.
2. Lambda applies lightweight enrichment and validation.
3. Kinesis Data Firehose lands records in S3 for durable storage.
4. Glue catalogs the data for Athena and downstream analytics.
5. OpenSearch serves fast search and investigation use cases.

## Operational notes

- Track stream lag and delivery failures separately.
- Partition data by time so Athena queries stay efficient.
- Keep the raw zone immutable and add curated zones later if needed.
