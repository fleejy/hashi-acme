terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

variable "GCP_SECRET_ACCESS_KEY" {
    type = string
    sensitive = true
}

provider "google" {
  credentials = var.GCP_SECRET_ACCESS_KEY

  project = "hashi-acme"
  region  = "us-central1"
  zone    = "us-central1-c"
}