output "subnet-id" {
  value       = google_compute_subnetwork.subnet.id
  description = "The SUBNET ID"
}

output "subnet-name" {
  value       = google_compute_subnetwork.subnet.name
  description = "The SUBNET NAME"
}
