output "web-server-public-ip" {
  value = google_compute_instance.web-server.network_interface[0].access_config[0].nat_ip
}