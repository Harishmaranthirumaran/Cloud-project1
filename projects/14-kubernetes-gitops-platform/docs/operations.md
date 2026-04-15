# Operations

- Apply Terraform in `infra/` to provision the cluster and ECR repository.
- Install Argo CD, then sync the cluster kustomization under `gitops/clusters/dev`.
- Deploy sample services under `services/sample-api/`.
- Add AWS Load Balancer Controller and ExternalDNS when the baseline is in place.
