CREATE OR REPLACE VIEW `YOUR_PROJECT_ID.finops.vw_rightsizing_candidates` AS
SELECT
  project_id,
  resource_name,
  service,
  machine_type,
  region,
  avg_cpu_30d,
  avg_memory_30d,
  current_monthly_cost,
  recommended_action,
  estimated_monthly_saving,
  estimated_monthly_saving * 12 AS estimated_annual_saving,
  risk_level,
  owner
FROM `YOUR_PROJECT_ID.finops.resource_inventory_sample`
WHERE estimated_monthly_saving > 0;
