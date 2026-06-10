-- Daily cost trend by service.
SELECT
  usage_start_date,
  service_description,
  ROUND(SUM(net_cost), 2) AS daily_net_cost
FROM `YOUR_PROJECT_ID.finops.billing_export_sample`
GROUP BY usage_start_date, service_description
ORDER BY usage_start_date, service_description;
