# Terraform Budget and Dataset Sample

This folder contains a sample Terraform configuration for:

- Creating a BigQuery dataset for FinOps analysis
- Creating a Cloud Billing budget with 50%, 80%, and 100% thresholds

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

Do not commit `terraform.tfvars` because it can contain real billing account information
