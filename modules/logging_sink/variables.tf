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
  default = " "
}
