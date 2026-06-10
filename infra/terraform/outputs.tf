output "finops_dataset_id" {
  description = "FinOps BigQuery dataset ID"
  value       = google_bigquery_dataset.finops.dataset_id
}

output "finops_dataset_self_link" {
  description = "FinOps BigQuery dataset self link"
  value       = google_bigquery_dataset.finops.self_link
}
