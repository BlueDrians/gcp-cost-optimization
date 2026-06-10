# GCP Cost Optimization Dashboard

A portfolio-ready **FinOps and Cloud Cost Optimization Dashboard** for Google Cloud. This repository demonstrates how a presales, cloud architect, or solution architect can analyze Cloud Billing export data, detect expensive resources, recommend rightsizing actions, define budget guardrails, and prepare an executive cost-saving summary

> Use case: Helping companies identify potential cloud cost savings through billing analysis, resource utilization review, rightsizing recommendations, budget alerts, and executive reporting

## Key Features

- Simulated Google Cloud Billing export dataset for BigQuery analysis
- BigQuery SQL queries and views for cost analysis
- Dashboard workbook with KPI summary, service breakdown, budget variance, and rightsizing recommendations
- Looker Studio dashboard design guide
- Budget alert Terraform sample
- FinOps methodology and executive summary template
- Python scripts for local analysis and executive report generation

## Repository Structure

```text
gcp-cost-optimization-dashboard/
├── dashboard/
│   └── finops_cost_dashboard.xlsx
├── data/sample/
│   ├── billing_export_sample.csv
│   ├── budget_sample.csv
│   └── resource_inventory_sample.csv
├── docs/
│   ├── architecture.md
│   ├── dashboard-design.md
│   ├── deployment-guide.md
│   ├── executive-summary-sample.md
│   ├── finops-methodology.md
│   ├── looker-studio-guide.md
│   ├── presales-one-pager.md
│   └── security-privacy.md
├── infra/terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars.example
├── scripts/
│   ├── detect_expensive_resources.py
│   └── generate_executive_summary.py
├── sql/
│   ├── bigquery/
│   ├── views/
│   └── analysis/
├── .github/workflows/lint.yml
├── .gitignore
├── LICENSE
└── README.md
```

## Business Value

This project is designed to show that cost optimization is not only a technical exercise. It combines billing analysis, budget controls, utilization signals, business prioritization, and executive communication

Typical outcomes:
- Identify top cost drivers by service, project, SKU, and resource
- Detect month-to-date budget variance
- Prioritize rightsizing candidates by estimated saving and risk
- Prepare executive-level saving narrative for decision makers
- Provide a reusable FinOps operating model for customers

## Quick Start

### 1. Review sample dashboard

Open:

```text
dashboard/finops_cost_dashboard.xlsx
```

### 2. Run local analysis

```bash
python scripts/detect_expensive_resources.py --billing data/sample/billing_export_sample.csv --resources data/sample/resource_inventory_sample.csv
```

### 3. Generate executive summary

```bash
python scripts/generate_executive_summary.py --budget data/sample/budget_sample.csv --resources data/sample/resource_inventory_sample.csv --output executive-summary-output.md
```

### 4. Use BigQuery SQL

Start with:

```text
sql/bigquery/create_dataset_and_tables.sql
sql/views/vw_monthly_cost_by_service.sql
sql/analysis/top_expensive_resources.sql
```

## Dashboard KPIs

- Total monthly cost
- Month-to-date budget variance
- Top service cost contributor
- Estimated monthly savings
- Estimated annualized savings
- Top rightsizing candidates
- Budget alert status
- Recommended next actions

## Portfolio Positioning

This repository is suitable for a Cloud Architect / Solution Architect portfolio because it demonstrates:

- Cost-aware architecture thinking
- FinOps analysis and executive storytelling
- BigQuery analytics for billing data
- Dashboard planning for Looker Studio
- Budget governance and operational guardrails
- Practical recommendations customers can act on

## Disclaimer

All sample data is dummy data for portfolio and learning purposes. Do not upload real customer billing exports or confidential project information to a public repository
