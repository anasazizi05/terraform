terraform {
  required_version = ">= 0.14"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.5"
    }
  }
}

provider "google" {
  credentials = file("gcp-identity.json") 
  project     = var.gcp_project
  region      = "us-central1"
}
