# WARNING: This file is deployed from template. Raise a pull request against terraform-template to change.

SHELL := /bin/bash

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: init plan apply test  ## Runs plan, apply and test

destroy:  ## Terraform Destroy
	@echo "Destroying"
	bash -c "cd module && terraform destroy -force"

init:  ## Terraform Init
	@echo "Init"
	bash -c "cd module && terraform init -force-copy"

plan:  ## Terraform Plan
	@echo "Planning"
	bash -c "cd module && terraform plan"

apply:  ## Terraform Apply
	@echo "Applying"
	bash -c "terraform apply -auto-approve -parallelism=5 && terraform output --json > ../test/unit/spec/output.json"

.DEFAULT_GOAL := all
.PHONY: all destroy plan apply test
