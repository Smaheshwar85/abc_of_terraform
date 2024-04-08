resource "google_logging_project_sink" "example_sink" {
  project     = var.sink_project_id
  name        = var.sink_name
  destination = "logging.googleapis.com/projects/${var.destination_project_id}/locations/${var.destination_location}/buckets/${var.destination_bucket_id}"
  filter      = var.filter
  unique_writer_identity  = true
}

output "sink_service_account_email" {
  value = google_logging_project_sink.example_sink.writer_identity
}
