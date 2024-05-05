variable "cluster_name" {
  description = "Name of the GKE cluster"
}

variable "region" {
  description = "Region for the GKE cluster"
}

variable "network_project" {
  description = "Project ID of the network"
}

variable "network" {
  description = "Network for the GKE cluster"
}

variable "subnetwork" {
  description = "Subnetwork for the GKE cluster"
}

variable "secondary_range_pods" {
  description = "Secondary range for pods"
}

variable "secondary_range_services" {
  description = "Secondary range for services"
}

variable "master_ipv4_cidr_block" {
  description = "Master IPv4 CIDR block"
}

variable "service_account" {
  description = "Service account for the GKE cluster"
}
