terraform {
  cloud {
    organization = "possibilitycorp"

    workspaces {
      name = "fleejy-cli"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}
