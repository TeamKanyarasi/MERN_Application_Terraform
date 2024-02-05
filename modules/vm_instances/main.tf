resource "google_compute_instance" "web-server" {
  name         = "web-server"
  machine_type = var.vm-instance-machine-type
  zone         = var.availability-zone

  boot_disk {
    initialize_params {
      image = var.disk-image
    }
  }

  network_interface {
    network = var.vpc_network_name
    subnetwork = var.public_subnet_name
    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "db-server" {
  name         = "db-server"
  machine_type = var.vm-instance-machine-type
  zone         = var.availability-zone

  boot_disk {
    initialize_params {
      image = var.disk-image
    }
  }

  network_interface {
    network = var.vpc_network_name
    subnetwork = var.private_subnet_name
  }
}