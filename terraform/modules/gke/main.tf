module "xyz-gke-cluster" {
  source                    = "git::https//github.com/"
  cluster_name              = var.cluster_name
  region                    = var.region
  network_project           = var.network_project
  network                   = var.network
  subnetwork                = var.subnetwork
  secondary_range_pods      = var.secondary_range_pods
  secondary_range_services  = var.secondary_range_services
  master_ipv4_cidr_block    = var.master_ipv4_cidr_block
  service_account           = var.service_account
}
