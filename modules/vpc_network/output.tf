output "vpc_network_name" {
  value = google_compute_network.vpc_network.name
}

output "public_subnet_name" {
  value = google_compute_subnetwork.public-subnet.name
}

output "private_subnet_name" {
  value = google_compute_subnetwork.private-subnet.name
}