resource "google_compute_network" "vpc_network" {
  name                    = "mern-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "mern-firewall" {
  name    = "mern-firewall"
  network = google_compute_network.vpc_network.self_link
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80", "3000", "3001"]
  }

  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_subnetwork" "public-subnet" {
  name          = "mern-public-subnet"
  ip_cidr_range = var.public-subnet-ip_cidr_range
  network       = google_compute_network.vpc_network.self_link
  region = var.region
}

resource "google_compute_subnetwork" "private-subnet" {
  name          = "mern-private-subnet"
  ip_cidr_range = var.private-subnet-ip_cidr_range
  network       = google_compute_network.vpc_network.self_link
  region = var.region
}

resource "google_compute_router" "router" {
  name = "mern-router"
  network = google_compute_network.vpc_network.self_link
  region = var.region
}

resource "google_compute_router_nat" "nat" {
  name                               = "mern-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_route" "public-subnet-route" {
  name             = "public-subnet-route"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc_network.self_link
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
  tags             = ["public-subnet"]
}

resource "google_compute_route" "private-subnet-route" {
  name             = "private-subnet-route"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc_network.self_link
  next_hop_gateway = google_compute_router_nat.nat.name
  priority         = 1000
  tags             = ["private-subnet"]
}