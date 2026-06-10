-- Rightsizing candidates based on utilization and estimated saving.
SELECT
  project_id,
  resource_name,
  service,
  machine_type,
  avg_cpu_30d,
  avg_memory_30d,
  current_monthly_cost,
  estimated_monthly_saving,
  recommended_action,
  risk_level,
  owner
FROM `PROJECT_ID.finops.resource_inventory_sample`
WHERE avg_cpu_30d < 30
  AND estimated_monthly_saving > 50
ORDER BY estimated_monthly_saving DESC;
