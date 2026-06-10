# Looker Studio Guide

## Data Sources

Connect Looker Studio to the following BigQuery views:

- `vw_monthly_cost_by_service`
- `vw_project_budget_variance`
- `vw_rightsizing_candidates`
- `vw_top_expensive_resources`

## Recommended Charts

| Page | Chart | Dimension | Metric |
|---|---|---|---|
| Executive Overview | Scorecard | N/A | Net cost |
| Executive Overview | Scorecard | N/A | Estimated savings |
| Service Breakdown | Bar chart | Service | Net cost |
| Project Analysis | Table | Project | Actual vs budget |
| Rightsizing | Table | Resource | Estimated monthly saving |
| Budget | Bullet/Bar | Project | Actual vs budget |

## Calculated Fields

### Savings Rate

```text
Estimated Savings / Actual Cost
```

### Budget Usage

```text
Actual Cost / Budget Amount
```

### Annualized Saving

```text
Estimated Monthly Saving * 12
```

## Filters

- Month
- Project
- Service
- Environment
- Risk level
- Owner
