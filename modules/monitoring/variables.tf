variable "monitoring_project_id" {
  description = "Google Cloud project ID"
}

variable "alert_policies" {
  type = map(object({
    display_name       = string
    filter             = string
    threshold_value    = number
    per_series_aligner = string
  }))
  description = "Map of alert policies"
}
