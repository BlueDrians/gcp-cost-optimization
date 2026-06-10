# Security and Privacy

## Data Handling

Cloud billing export data can contain sensitive business information such as project names, labels, SKU usage, and internal resource naming. Treat real customer billing exports as confidential

## Public Repository Safety

This repository only includes dummy sample data. Do not commit:

- Real billing exports
- Billing account IDs
- Customer project IDs
- Service account keys
- Terraform state files
- Internal cost reports
- Screenshots with customer data

## IAM Recommendation

Use least privilege access:
- Billing export admin only for setup owners
- BigQuery data viewer for dashboard readers
- BigQuery data editor for pipeline maintainers
- Billing account viewer for FinOps analysts when required

## Anonymization

Before sharing externally:
- Replace project IDs
- Remove labels with names/emails
- Round costs when necessary
- Replace billing account identifiers
- Remove custom SKU or contract references
