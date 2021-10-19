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
module "iam -roles"{
service_account =var.service_account
roles   =var.bucket_roles
prject_id =var.project
}
