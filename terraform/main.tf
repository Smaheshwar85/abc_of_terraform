terraform {
  required_version = "1.2.0"
  
  cloud {
    hostname      = "tfe.xyz.com"
    organization  = "xyz.com"
    
    workspaces {
      name = "gcp-dev"
    }
  }
}

# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
  # Add other provider configurations as needed
}

# Add other common configurations here
