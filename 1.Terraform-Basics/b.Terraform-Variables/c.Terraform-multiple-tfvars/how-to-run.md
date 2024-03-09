# Passing Variables to Terraform via --var-file

To pass variables (.tfvars) to Terraform using the `--var-file` flag, follow these steps:

```bash

## 1. For DEV Environment

## 1.1. Terraform Init for DEV

terraform init --var-file="terraform-dev.tfvars"

## 1.2 Terraform Plan for DEV

terraform plan --var-file="terraform-dev.tfvars"

## 1.3. Terraform Apply for DEV

terraform apply --var-file="terraform-dev.tfvars"

## 2. For QA Environment

## 2.1. Terraform Init for QA

terraform init --var-file="terraform-qa.tfvars"

## 2.2. Terraform Plan for QA

terraform plan --var-file="terraform-qa.tfvars"

## 2.3. Terraform Apply for QA

terraform apply --var-file="terraform-qa.tfvars"

## 3. For PROD Environment

## 3.1. Terraform Init for PROD

terraform init --var-file="terraform-prod.tfvars"

## 3.2. Terraform Plan for PROD

terraform plan --var-file="terraform-prod.tfvars"

## 3.3. Terraform Apply for PROD

terraform apply --var-file="terraform-prod.tfvars"

```

Keep in mind that you need to supply the correct .tfvars file based on the environment you are working on.