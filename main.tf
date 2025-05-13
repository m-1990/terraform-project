# Service account
/* resource "google_service_account" "default" {
  account_id   = "01F10B-AA32C6-1B63E6"
  display_name = "Custom SA for VM Instance"
}
*/

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

