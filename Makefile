INFRA_DIR := infra
BOOTSTRAP_DIR := infra/bootstrap

.PHONY: fmt validate init plan apply bootstrap

fmt:
	cd $(INFRA_DIR) && terraform fmt -recursive

validate:
	cd $(INFRA_DIR) && terraform init -backend=false && terraform validate

init:
	cd $(INFRA_DIR) && terraform init -backend-config=backend.hcl

plan:
	cd $(INFRA_DIR) && terraform init -backend-config=backend.hcl && terraform plan

apply:
	cd $(INFRA_DIR) && terraform init -backend-config=backend.hcl && terraform apply

bootstrap:
	cd $(BOOTSTRAP_DIR) && terraform init && terraform apply
