variable "project_name" {
  description = "Name of the project"
}

terraform {
  backend "gcs" {}
}

provider "google" {
  credentials = "${file("../secret/service-account.json")}"
  project     = "${var.project_name}"
  region      = "us-west1"
}

resource "google_container_cluster" "gke-cluster" {
  name               = "${var.project_name}-gke-cluster"
  network            = "default"
  location           = "us-west1-a"
  initial_node_count = 2

  node_config {
      machine_type = "f1-micro"
  }
}
