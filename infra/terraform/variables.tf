variable "project_id" {
  description = "Google Cloud project ID for the FinOps dataset"
  type        = string
}

variable "project_number" {
  description = "Google Cloud project number used by Billing Budget filter"
  type        = string
}

variable "region" {
  description = "Default Google Cloud region"
  type        = string
  default     = "asia-southeast2"
}

variable "bigquery_location" {
  description = "BigQuery dataset location"
  type        = string
  default     = "asia-southeast2"
}

variable "dataset_id" {
  description = "BigQuery dataset name for FinOps"
  type        = string
  default     = "finops"
}

variable "billing_account_id" {
  description = "Billing account ID in format 000000-000000-000000"
  type        = string
  sensitive   = true
}

variable "currency_code" {
  description = "Budget currency code"
  type        = string
  default     = "USD"
}

variable "monthly_budget_amount" {
  description = "Monthly budget amount"
  type        = number
  default     = 5000
}
