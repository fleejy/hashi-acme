terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = var.GCP_SECRET_ACCESS_KEY

  project = "hashi-acme"
  region  = "us-central1"
  zone    = "us-central1-c"
}

## Compute Network (VPC)
resource "google_compute_network" "vpc_network" {
  name = "compute-network"
  auto_create_subnetworks = false
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