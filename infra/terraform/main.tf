terraform {
  required_version = ">= 1.6.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_bigquery_dataset" "finops" {
  dataset_id                 = var.dataset_id
  location                   = var.bigquery_location
  delete_contents_on_destroy = false

  labels = {
    purpose = "finops"
    owner   = "cloud-architecture"
  }
}

resource "google_billing_budget" "monthly_budget" {
  billing_account = var.billing_account_id
  display_name    = "Monthly FinOps Budget - ${var.project_id}"

  budget_filter {
    projects = ["projects/${var.project_number}"]
  }

  amount {
    specified_amount {
      currency_code = var.currency_code
      units         = var.monthly_budget_amount
    }
  }

  threshold_rules {
    threshold_percent = 0.5
  }

  threshold_rules {
    threshold_percent = 0.8
  }

  threshold_rules {
    threshold_percent = 1.0
  }
}
