variable "vm-instance-machine-type" {
  description = "This is the machine type of the vm instances which are need to be launched."
  type = string
  default = "e2-micro"
}

variable "availability-zone" {
  description = "This is the availability zone of the instances."
  type = string
  default = "asia-south1-a"
}

variable "disk-image" {
  description = "This is the disk image of the instances."
  type = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts-arm64"
}

variable "vpc_network_name" {
  description = "This is the vpc network name."
  type = string
}

variable "public_subnet_name" {
  description = "This is the public subnet name."
  type = string
}

variable "private_subnet_name" {
  description = "This is the private subnet name."
  type = string
}