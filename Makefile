INFRA_DIR := infra

.PHONY: fmt validate plan

fmt:
	cd $(INFRA_DIR) && terraform fmt -recursive

validate:
	cd $(INFRA_DIR) && terraform init -backend=false && terraform validate

plan:
	cd $(INFRA_DIR) && terraform init && terraform plan

