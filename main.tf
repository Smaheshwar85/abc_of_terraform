module "logging_bucket" {
  source = "./modules/logging_bucket"
  project_id = var.project_id
  location = var.location
  retention_days = var.retention_days
  bucket_id = var.bucket_id
  description = var.description
}

module "logging_sink" {
  source = "./modules/logging_sink"
  depends_on = [module.logging_bucket]
  sink_project_id = var.sink_project_id
  sink_name = var.sink_name
  destination_project_id = var.destination_project_id
  destination_location = var.destination_location
  destination_bucket_id = var.destination_bucket_id
  filter = var.filter
}

module "iam_roles" {
  source = "./modules/iam_roles"
  depends_on = [module.logging_sink]
  project_id = var.project_id
  bucket_writer_role = var.bucket_writer_role
  view_accessors_role = var.view_accessors_role
  writer_identity = module.logging_sink.sink_service_account_email
}
