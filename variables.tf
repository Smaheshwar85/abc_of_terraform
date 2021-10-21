variable "service_account" {
type = string
}
variable "zone" {
  type = string
  default = "us-central1-c"
  description = "Please mention zone default zone is us-central1-c"
}
variable "region" {
  type = string
  default = "europe-west1"
  description = "Please mention region for your resource default is us-central1"
}
variable "machine_type" {
  type = string
  default = "f1-micro"
  description = "Mention machine type default is n1-standard-1"
}
variable "gce_name" {
  type = string
  default = "terra-instance"
  description = "Name of resource"
}
variable "image" {
  type = string
  default = "debian-cloud/debian-9"
  description = "Compute instance image"
}
variable "project_network" {
  type = string
  default = "default"
  description = "Network we will using for compute instance creation"
}
variable "bucket_roles" {
type = list
}

variable "project" {
type = string
}
