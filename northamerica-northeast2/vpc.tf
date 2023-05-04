## Compute Network (VPC)
resource "google_compute_network" "vpc_network" {
  name                    = "compute-network"
  auto_create_subnetworks = false
  project                 = "hashi-acme"
}

## Compute Subnet (10.2.0.0/16)
resource "google_compute_subnetwork" "compute-subnet" {
  name          = "compute-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

## Storage Subnet (10.4.0.0/16)
resource "google_compute_subnetwork" "storage-subnet" {
  name          = "storage-subnet"
  ip_cidr_range = "10.4.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}