# Cost Guide

## Main cost drivers

- CloudFront requests and data transfer
- S3 storage and requests
- Route 53 hosted zone if you add a custom domain
- ACM certificates for CloudFront are free

## Cost controls

- Keep the bucket private and serve through CloudFront.
- Use `PriceClass_100` for the cheapest CloudFront footprint.
- Destroy unused test environments.
- Avoid uploading large binaries to `app/`.

