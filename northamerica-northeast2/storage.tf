## Cloud SQL DB
resource "google_sql_database" "database_deletion_policy" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
  deletion_policy = "ABANDON"
}

## Cloud SQL Instance
resource "google_sql_database_instance" "instance" {
  name             = "my-database-instance"
  project = "hashi-acme"
  region           = "us-central1"
  database_version = "POSTGRES_14"
  settings {
    tier = "db-g1-small"
  }

  deletion_protection  = "true"
}