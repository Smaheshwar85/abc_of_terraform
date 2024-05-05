# Define the google_logging_project_bucket_config resource
resource "google_logging_project_bucket_config" "this" {
  project_id       = var.project_id
  location         = var.location
  retention_days   = var.retention_days
  bucket_id        = var.bucket_id
  description      = var.description
}

# Define the google_logging_project_sink resource
resource "google_logging_project_sink" "example_sink" {
  project       = var.sink_project
  name          = var.sink_name
  destination   = var.destination
  filter        = var.filter
}

# Add the new service account as a member in the destination project
resource "google_project_iam_member" "this-bucket-writer" {
  project = var.project_id
  role    = "roles/logging.bucketWriter"
  member  = google_logging_project_sink.example_sink.writer_identity
}

resource "google_project_iam_member" "this-view-accessors" {
  project = var.project_id
  role    = "roles/logging.viewAccessor"
  member  = google_logging_project_sink.example_sink.writer_identity
}

# Define IAM role bindings
resource "google_project_iam_binding" "this-logging-bucket-writer" {
  project = var.project_id
  role    = "roles/logging.bucketWriter"
  members = [google_logging_project_sink.example_sink.writer_identity]
}

resource "google_project_iam_binding" "this-logging-view-accessors" {
  project = var.project_id
  role    = "roles/logging.viewAccessor"
  members = [google_logging_project_sink.example_sink.writer_identity]
}
