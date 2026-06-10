CREATE SCHEMA IF NOT EXISTS `PROJECT_ID.finops`;

CREATE OR REPLACE TABLE `PROJECT_ID.finops.billing_export_sample` (
  usage_start_date DATE,
  billing_account_id STRING,
  project_id STRING,
  project_name STRING,
  environment STRING,
  team STRING,
  service_description STRING,
  sku_description STRING,
  resource_name STRING,
  location STRING,
  usage_amount FLOAT64,
  usage_unit STRING,
  cost NUMERIC,
  credits NUMERIC,
  net_cost NUMERIC,
  labels STRING
);

CREATE OR REPLACE TABLE `PROJECT_ID.finops.resource_inventory_sample` (
  project_id STRING,
  resource_name STRING,
  service STRING,
  machine_type STRING,
  region STRING,
  avg_cpu_30d FLOAT64,
  avg_memory_30d FLOAT64,
  current_monthly_cost NUMERIC,
  recommended_action STRING,
  estimated_monthly_saving NUMERIC,
  risk_level STRING,
  owner STRING
);

CREATE OR REPLACE TABLE `PROJECT_ID.finops.budget_sample` (
  month STRING,
  project_id STRING,
  budget_amount NUMERIC,
  actual_cost NUMERIC,
  forecast_cost NUMERIC,
  variance NUMERIC,
  status STRING
);
