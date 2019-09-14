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

resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}"
  location           = "us-west1-a"
  remove_default_node_pool = true
  initial_node_count = 1

  master_auth {
      username = ""
      password = ""

      client_certificate_config {
        issue_client_certificate = false
      }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "node-pool"
  location   = "us-west1-a"
  cluster    = "${var.cluster_name}"
  node_count = 2
  autoscaling {
    max_node_count = 6
    min_node_count = 2
  }

  node_config {
    preemptible  = true
    machine_type = "g1-small"

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
