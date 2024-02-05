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
  credentials = file("C:/Users/chara/Downloads/round-folio-413206-89f0ca82366e.json")
  project     = "My First Project"
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