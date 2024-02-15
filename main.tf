terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.14.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = file("C:/Users/chara/Downloads/round-folio-413206-58fe396a4f1a.json")
  project     = "round-folio-413206"
  region      = "asia-south1"
}

module "vpc" {
  source = "./modules/vpc_network" 
}

module "vm_instances" {
  source = "./modules/vm_instances"
  vpc_network_name = module.vpc.vpc_network_name
  public_subnet_name = module.vpc.public_subnet_name
  private_subnet_name = module.vpc.private_subnet_name
  
}

output "web-server-public-ip" {
  value = module.vm_instances.web-server-public-ip
}