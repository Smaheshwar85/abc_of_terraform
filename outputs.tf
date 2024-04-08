
output "sink_service_account_email" {
  value = module.logging_sink.sink_service_account_email
}
output "monitoring_dashboard_id" {
  value = google_monitoring_dashboard.monitored_dash.id
}

