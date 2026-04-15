# Architecture

## Overview

The platform uses a private S3 bucket as the origin for a CloudFront distribution. CloudFront is the public entry point and provides HTTPS, caching, and global delivery.

## Components

- `S3`: stores the static site assets privately
- `CloudFront`: serves the site and forwards requests to S3 through Origin Access Control
- `ACM`: issues the TLS certificate for the CloudFront distribution
- `Route 53`: optional DNS records for a custom domain
- `IAM`: restricts GitHub Actions deployment access
- `WAF`: optional CloudFront web ACL with common managed rules and rate limiting
- `CloudFront response headers policy`: sets secure browser headers

## Design decisions

- S3 is private by default.
- CloudFront uses OAC instead of public bucket access.
- Custom DNS is optional so the project is usable without a domain.
- Deployment uses GitHub Actions OIDC instead of long-lived AWS keys.
- Terraform workspaces separate `dev` and `prod` resource prefixes while reusing the same code.

## Request flow

1. A visitor opens the site URL.
2. DNS resolves to CloudFront if a custom domain exists.
3. CloudFront serves cached assets or fetches from S3.
4. GitHub Actions uploads new content to S3 and invalidates CloudFront paths.
5. WAF inspects requests before they reach the distribution origin.
