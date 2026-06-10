-- Top expensive resources in the selected period.
SELECT
  project_id,
  service_description,
  resource_name,
  ROUND(SUM(net_cost), 2) AS total_net_cost
FROM `YOUR_PROJECT_ID.finops.billing_export_sample`
WHERE usage_start_date BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) AND CURRENT_DATE()
GROUP BY project_id, service_description, resource_name
ORDER BY total_net_cost DESC
LIMIT 20;
