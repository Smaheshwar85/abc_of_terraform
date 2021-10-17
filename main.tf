provider "google" {
  credentials ="iginite-world-ef6ceb4f00a5.json"
  project = "iginite-world" 
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
 network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
