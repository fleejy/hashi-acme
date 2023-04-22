terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("/Users/fleejy/repos/hashi-acme-4e8871814407.json")

  project = "hashi-acme"
  region  = "us-central1"
  zone    = "us-central1-c"
}

## Compute Network (VPC)
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

## Compute Instance
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
