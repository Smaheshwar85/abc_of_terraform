
resource "google_compute_instance" "vm_instance" {
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
/*resource "google_project_iam_binding" "project" {
  count   =length(var.bucket_roles)
  project = var.project
  role   = var.bucket_roles[count.index]

  members = [
    "user:smahesh2305@gmail.com",
  ]
}*/


/*resource "google_service_account" "sa" {
  account_id   = var.service_account
  display_name = "A service account that only mahesh can use"
}

resource "google_service_account_iam_binding" "admin-account-iam" {
  count              =length(var.bucket_roles)
  service_account_id = google_service_account.sa.name
  role               = var.bucket_roles[count.index]

  members = [
    "user:smahesh2305@gmail.com",
  ]
}*/
