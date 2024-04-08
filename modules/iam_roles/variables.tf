variable "project_id" {
  description = "The ID of the project."
}

variable "bucket_writer_role" {
  description = "IAM role for logging bucket writer."
}

variable "view_accessors_role" {
  description = "IAM role for logging view accessors."
}

variable "writer_identity" {
  description = "The identity of the writer for IAM roles."
}
