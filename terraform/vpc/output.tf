output "vpc-id" {
  value       = google_compute_network.vpc-1.id
  description = "The VPC ID"
}

output "vpc-name" {
  value       = google_compute_network.vpc-1.name
  description = "The VPC NAME"
}