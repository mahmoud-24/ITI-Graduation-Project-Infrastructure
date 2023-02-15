resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet-name
  ip_cidr_range            = var.subnet-cidr
  region                   = var.region
  network                  = var.vpc-id
  private_ip_google_access = true 
}

