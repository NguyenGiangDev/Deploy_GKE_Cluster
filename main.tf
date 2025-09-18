provider "google" {
  project     = var.project
}

# =========================
# VPC và Subnet
# =========================
resource "google_compute_network" "custom_vpc" {
  name                    = "devops-vpc"
  auto_create_subnetworks = false
}

# Public Subnet
resource "google_compute_subnetwork" "public_subnets" {
  for_each       = var.public_subnets
  name           = "${each.key}-public-subnet"
  ip_cidr_range  = each.value
  region         = each.key
  network        = google_compute_network.custom_vpc.id
}

# Private Subnet
resource "google_compute_subnetwork" "private_subnets" {
  for_each      = var.private_subnets
  name          = "${each.key}-private-subnet"
  ip_cidr_range = each.value
  region        = each.key
  network       = google_compute_network.custom_vpc.id
}

# =========================
# GKE Cluster
# =========================
resource "google_container_cluster" "primary" {
  name     = "devops-gke-cluster"
  location = "us-central1"

  # Gán VPC + public subnet (chọn subnet ở region us-central1)
  network    = google_compute_network.custom_vpc.id
  subnetwork = google_compute_subnetwork.public_subnets["us-central1"].name

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {}
}

# =========================
# Node Pool
# =========================
resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 6

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size
    tags         = ["k8s"]

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# =========================
# Firewall Rule
# =========================
# Chỉ mở HTTP/HTTPS cho internet vào cluster (Ingress)
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.custom_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["k8s"]
}
