variable "public-subnet-ip_cidr_range" {
  description = "This is the IP CIDR range of public subnet to deploy and run the web-server vm instance."
  type = string
  default = "10.0.1.0/24"
}

variable "private-subnet-ip_cidr_range" {
  description = "This is the IP CIDR range of private subnet to deploy and run the database-server vm instance."
  type = string
  default = "10.0.2.0/24"
}

variable "region" {
  description = "This is the desired region where all the resources has to be created."
  type = string
  default = "asia-south1"
}