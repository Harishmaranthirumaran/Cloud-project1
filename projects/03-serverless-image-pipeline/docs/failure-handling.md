# Failure Handling

- Retries are absorbed by SQS.
- Poison messages move to the DLQ.
- Operators inspect CloudWatch logs and replay from the DLQ.

