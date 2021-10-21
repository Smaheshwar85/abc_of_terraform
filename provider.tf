provider "google" {
  credentials = "${file("./terra-world-98561.json")}"
  project     = "terra-world-98561"
  region      = "europe-west1"
}
