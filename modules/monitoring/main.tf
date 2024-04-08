variable "monitoring_project_id" {
  description = "Google Cloud project ID"
  default     = "data-engineering-demo-413211"
}

variable "alert_policies" {
  type = map(object({
    display_name       = string
    filter             = string
    threshold_value    = number
    per_series_aligner = string
  }))
  default = {
    cpu_utilization = {
      display_name       = "CPU Usage Alert"
      filter             = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/utilization\""
      threshold_value    = 80
      per_series_aligner = "ALIGN_MEAN"
    },
    memory_utilization = {
      display_name       = "Memory Usage Alert"
      filter             = "resource.type = \"gce_instance\" AND metric.type = \"agent.googleapis.com/memory/percent_used\" AND metric.labels.state != \"free\""
      threshold_value    = 80
      per_series_aligner = "ALIGN_MEAN"
    },
    disk_utilization = {
      display_name       = "Disk Usage Alert"
      filter             = "resource.type = \"gce_instance\" AND metric.type = \"agent.googleapis.com/disk/percent_used\" AND metric.labels.state != \"free\""
      threshold_value    = 80
      per_series_aligner = "ALIGN_MEAN"
    },
    vm_uptime = {
      display_name       = "VM Uptime Check Alert"
      filter             = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" AND resource.type=\"gce_instance\""
      threshold_value    = 0
      per_series_aligner = "ALIGN_COUNT_TRUE"
    }
  }
}

resource "google_monitoring_notification_channel" "email_channel" {
  project      = var.monitoring_project_id  # Set project ID here
  display_name = "Email Notification Channel"
  type         = "email"
  
  labels = {
    email_address = "easewithbase@gmail.com"  # Replace with your email address
  }
}

resource "google_monitoring_alert_policy" "alert_policies" {
  project              = var.monitoring_project_id
  for_each             = var.alert_policies
  display_name         = each.value.display_name
  user_labels          = {}

  conditions {
    display_name = each.value.display_name
    condition_threshold {
      filter     = each.value.filter
      aggregations {
        alignment_period       = "60s"
        cross_series_reducer   = "REDUCE_NONE"
        group_by_fields        = ["resource.type"]
        per_series_aligner     = each.value.per_series_aligner
      }
      comparison             = "COMPARISON_GT"
      duration               = "0s"
      trigger {
        percent             = 100
      }
      threshold_value       = each.value.threshold_value
    }
  }

  alert_strategy {
    auto_close = "604800s"
  }

  combiner                 = "AND"
  enabled                  = true
  notification_channels    = [google_monitoring_notification_channel.email_channel.name]
  depends_on               = [google_monitoring_notification_channel.email_channel]
}

resource "google_monitoring_dashboard" "monitored_dash" {
  project       = var.monitoring_project_id
  dashboard_json = templatefile(
    "${path.module}/dashboard.jsontpl",
    {
      cpu_alert    = google_monitoring_alert_policy.alert_policies["cpu_utilization"].name
      memo_alert   = google_monitoring_alert_policy.alert_policies["memory_utilization"].name
      disk_alert   = google_monitoring_alert_policy.alert_policies["disk_utilization"].name
      uptime_alert = google_monitoring_alert_policy.alert_policies["vm_uptime"].name
    }
  )
  depends_on = [google_monitoring_alert_policy.alert_policies]
}
