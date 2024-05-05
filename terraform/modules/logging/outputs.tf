output "logging_bucket_name" {
  value = google_logging_project_bucket_config.this.name
}