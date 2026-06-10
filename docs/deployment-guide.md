# Deployment Guide

## Prerequisites

- Google Cloud project for analytics
- Billing account access to enable Cloud Billing export
- BigQuery dataset for billing export
- Looker Studio access
- Optional Terraform access for budget alert resources

## Steps

### 1. Enable Cloud Billing Export to BigQuery

Create or select a BigQuery dataset, then configure Cloud Billing export to send detailed usage data into the dataset

### 2. Run BigQuery Setup SQL

```bash
bq query --use_legacy_sql=false < sql/bigquery/create_dataset_and_tables.sql
```

### 3. Create Views

```bash
bq query --use_legacy_sql=false < sql/views/vw_monthly_cost_by_service.sql
bq query --use_legacy_sql=false < sql/views/vw_project_budget_variance.sql
bq query --use_legacy_sql=false < sql/views/vw_rightsizing_candidates.sql
```

### 4. Connect Looker Studio

Connect Looker Studio to BigQuery views and build dashboard pages based on `docs/looker-studio-guide.md`

### 5. Configure Budget Alerts

Use `infra/terraform` as a sample starting point for budget alert configuration

### 6. Operationalize Review

Run a monthly FinOps review:
- Review top cost drivers
- Confirm recommendations with service owners
- Track remediation progress
- Report realized savings
