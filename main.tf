provider "google" {
  
  project = var.project 
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "default" {
  name         = var.gce_name
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
    network_interface{
    network = var.project_network
      access_config {

      }
    }
}
/* module "iam-roles"{
service_account =var.service_account
roles   =var.bucket_roles
prject_id =var.project
} */
resource "google_project_iam_binding" "project" {
  project = var.project
  role    = var.bucket_roles

  members = [
    "user:smahesh2305@gmail.com",
  ]
}


resource "google_service_account" "sa" {
  account_id   = var.service_account
  display_name = "A service account that only mahesh can use"
}

resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  role               = var.bucket_roles

  members = [
    "user:smahesh2305@gmail.com",
  ]
}
