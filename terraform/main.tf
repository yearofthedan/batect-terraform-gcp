variable "project_name" {
  description = "Name of the project"
}

variable "cluster_name" {
  description = "Name to give the k8s cluster"
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
  name               = "${var.cluster_name}"
  network            = "default"
  location           = "us-west1-a"
  initial_node_count = 3

  node_config {
      machine_type = "f1-micro"
  }
}
