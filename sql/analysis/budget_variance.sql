-- Budget variance and alert status.
SELECT
  month,
  project_id,
  budget_amount,
  actual_cost,
  forecast_cost,
  variance,
  ROUND(SAFE_DIVIDE(actual_cost, budget_amount) * 100, 2) AS budget_used_percent,
  CASE
    WHEN SAFE_DIVIDE(actual_cost, budget_amount) >= 1.0 THEN 'Critical'
    WHEN SAFE_DIVIDE(actual_cost, budget_amount) >= 0.8 THEN 'Warning'
    ELSE 'Healthy'
  END AS alert_status
FROM `YOUR_PROJECT_ID.finops.budget_sample`
ORDER BY budget_used_percent DESC;
