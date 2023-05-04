## Compute Disk
resource "google_compute_disk" "default" {
  name  = "test-disk"
  type  = "pd-ssd"
  project = "hashi-acme"
  zone  = "us-central1-c"
  image = "debian-11-bullseye-v20220719"
  labels = {
    environment = "prod"
  }
  physical_block_size_bytes = 4096
}

## Compute Instance
resource "google_compute_instance" "default" {
  name         = "attached-disk-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default.id
  instance = google_compute_instance.default.id
}