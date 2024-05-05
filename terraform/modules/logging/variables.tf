variable "project_id" {
  description = "The ID of the Google Cloud project"
}

variable "location" {
  description = "The location of the logging bucket"
}

variable "retention_days" {
  description = "The retention period for logs in days"
}

variable "bucket_id" {
  description = "The ID of the logging bucket"
}

variable "description" {
  description = "Description for the logging bucket"
}

variable "sink_name" {
  description = "Name of the logging sink"
}

variable "destination" {
  description = "Destination for the logging sink"
}

variable "filter" {
  description = "Filter for the logging sink"
}

variable "sink_project" {
  description = "The project ID where the sink will be created"
}
