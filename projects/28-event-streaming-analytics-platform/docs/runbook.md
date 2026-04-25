# Runbook

## Common checks

- Confirm the stream shard count matches ingest volume.
- Confirm Firehose delivery errors are zero.
- Confirm S3 objects are arriving in the expected prefixes.
- Confirm Athena queries are using the correct catalog and partitions.

## Failure triage

1. If events are missing, check producer retries and stream throughput.
2. If records are delayed, inspect Lambda duration and Firehose delivery logs.
3. If queries are slow, inspect partitioning, file size, and catalog freshness.

## Safe changes

- Increase stream capacity before changing producer retry behavior.
- Roll out schema changes with backward compatibility.
- Add new query paths in parallel before cutting consumers over.
