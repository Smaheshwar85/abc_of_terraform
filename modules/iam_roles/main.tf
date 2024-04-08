resource "google_project_iam_member" "this-bucket-writer" {
  project = var.project_id
  role    = var.bucket_writer_role
  member  = "${var.writer_identity}"
}

resource "google_project_iam_member" "this-view-accessors" {
  project = var.project_id
  role    = var.view_accessors_role
  member  = "${var.writer_identity}"
}

resource "google_project_iam_binding" "this-logging-bucket-writer" {
  project = var.project_id
  role    = var.bucket_writer_role
  members = ["${var.writer_identity}"]
}

resource "google_project_iam_binding" "this-logging-view-accessors" {
  project = var.project_id
  role    = var.view_accessors_role
  members = ["${var.writer_identity}"]
}
