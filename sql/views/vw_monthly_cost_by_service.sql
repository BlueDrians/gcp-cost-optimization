CREATE OR REPLACE VIEW `YOUR_PROJECT_ID.finops.vw_monthly_cost_by_service` AS
SELECT
  FORMAT_DATE('%Y-%m', usage_start_date) AS billing_month,
  service_description,
  project_id,
  environment,
  team,
  ROUND(SUM(cost), 2) AS gross_cost,
  ROUND(SUM(credits), 2) AS credits,
  ROUND(SUM(net_cost), 2) AS net_cost
FROM `YOUR_PROJECT_ID.finops.billing_export_sample`
GROUP BY billing_month, service_description, project_id, environment, team;
