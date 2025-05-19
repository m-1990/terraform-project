
# Configure provider in terraform code
provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = file (var.google_credentials)
}

# Enable compute Engine API

/*resource "google_project_service" "compute" {
  project = var.project
  service = "compute.googleapis.com"
}


# VPC creation
resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
  # depends_on = [google_project_service.compute ]
}
*/

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "e2-micro"
  zone         = var.zone

  tags = ["web", "bastion"]

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
      labels = {
        my_label = "value"
      }
    }
  }


  network_interface {
    network = "default"
  }

}

