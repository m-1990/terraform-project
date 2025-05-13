
provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = file (var.google_credentials)
}

# VPC creation
resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}

