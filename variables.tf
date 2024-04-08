variable "project_id" {
  description = "The ID of the project."
}

variable "location" {
  description = "The location of the logging bucket."
}

variable "retention_days" {
  description = "The number of days to retain the logs."
}

variable "bucket_id" {
  description = "The ID of the logging bucket."
}

variable "description" {
  description = "Description for the logging bucket."
}

variable "sink_project_id" {
  description = "The ID of the project where the sink will be created."
}

variable "sink_name" {
  description = "Name for the logging sink."
}

variable "destination_project_id" {
  description = "The project ID of the destination bucket."
}

variable "destination_location" {
  description = "The location of the destination bucket."
}

variable "destination_bucket_id" {
  description = "The ID of the destination bucket."
}

variable "filter" {
  description = "Filter for the logging sink."
}

variable "bucket_writer_role" {
  description = "IAM role for logging bucket writer."
}
variable "view_accessors_role" {
  description = "IAM role for logging view accessors."
}
