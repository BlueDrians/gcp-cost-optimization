CREATE OR REPLACE VIEW `PROJECT_ID.finops.vw_project_budget_variance` AS
SELECT
  month,
  project_id,
  budget_amount,
  actual_cost,
  forecast_cost,
  variance,
  SAFE_DIVIDE(actual_cost, budget_amount) AS budget_usage_ratio,
  status
FROM `PROJECT_ID.finops.budget_sample`;
