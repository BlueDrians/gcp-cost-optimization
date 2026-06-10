# Architecture

## Objective

Build a repeatable FinOps analytics flow for Google Cloud cost optimization

## Logical Flow

```text
Cloud Billing Export
        │
        ▼
BigQuery Billing Dataset
        │
        ├── Service cost views
        ├── Project and environment views
        ├── Budget variance views
        └── Rightsizing candidate views
        │
        ▼
Looker Studio / Excel Dashboard
        │
        ▼
Executive Summary + Remediation Roadmap
```

## Components

| Component | Purpose |
|---|---|
| Cloud Billing Export | Provides daily and detailed cost usage records |
| BigQuery | Stores and analyzes billing export data |
| SQL Views | Converts raw billing export into reusable business metrics |
| Looker Studio | Presents FinOps KPIs and cost-saving insights |
| Budget Alerts | Notifies stakeholders before cost overrun becomes critical |
| Recommender / Resource Inventory | Supports rightsizing and waste reduction recommendations |

## Design Principles

1. Use billing export data as the source of truth for cost analysis
2. Separate raw data, curated views, and dashboard layers
3. Use labels to map spend to environment, owner, and business unit
4. Prioritize recommendations by estimated savings and implementation risk
5. Convert technical analysis into executive-friendly decision points
