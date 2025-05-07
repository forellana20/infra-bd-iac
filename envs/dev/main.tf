terraform {
  required_version = "~> 1.11.3"
  # correr el siguiente comando para obtener el state de terraform
  #terraform init -reconfigure -backend-config=../../backend-configs/dev.config
  backend "gcs" {}

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.4.0"
    }
  }
}

# Se exportan los modulos 
module "vpc" {
  source      = "../../modules/vpc"
  vpc_name    = var.vpc_name
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = var.subnet_cidr
  environment = var.environment
}

module "sql" {
  source               = "../../modules/sql"
  instance_name        = var.sql_instance_name
  project_id           = var.project_id
  region               = var.region
  tier                 = var.sql_tier
  private_network      = module.vpc.google_compute_network_id
  allowed_psc_projects = var.allowed_psc_projects
  depends_on           = [module.vpc]
}

module "vm" {
  source     = "../../modules/vm"
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  vm         = var.vm
}

module "iam" {
  source        = "../../modules/iam"
  project_id    = var.project_id
  zone          = var.zone
  iap_users     = var.iap_users
  instance_name = var.instance_name
}
