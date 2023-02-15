resource "google_compute_network" "vpc-1" {
  name                    = "vpc-1"
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}


resource "google_compute_firewall" "firewall" {
  name          = "firewall"
  network       = google_compute_network.vpc-1.id
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  
  allow {
    protocol = "tcp"
    ports    = ["22","80"]
  }
}