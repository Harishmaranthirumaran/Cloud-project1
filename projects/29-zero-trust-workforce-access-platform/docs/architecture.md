# Architecture

## Goal

Provide internal access to cloud applications using identity and device posture as the primary control plane.

## Main layers

1. IAM Identity Center authenticates the user.
2. Verified Access evaluates the request before the app is exposed.
3. Client VPN provides an alternate path for managed devices when needed.
4. Internal ALBs front the private applications.
5. CloudTrail, Config, and Security Hub capture governance evidence.

## Operational notes

- Prefer app-level exposure over network-level exposure.
- Segment access by role and application sensitivity.
- Treat VPN as a fallback, not the default trust model.
