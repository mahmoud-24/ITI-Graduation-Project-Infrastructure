module "google_vpc" {
  source     = "./vpc"
  project_id = var.project_id
}

module "google_management-subnet" {
  source      = "./subnet"
  subnet-name = "management-subnet"
  subnet-cidr = "10.0.1.0/24"
  region      = var.region
  vpc-id      = module.google_vpc.vpc-id
}

module "google_routing" {
  source    = "./nat-gateway"
  region    = var.region
  vpc-id    = module.google_vpc.vpc-id
  subnet-id = module.google_management-subnet.subnet-id
}

module "google_service-account" {
  source     = "./service-account"
  iam-role   = var.iam-role
  project_id = var.project_id
}

module "google_vm" {
  source     = "./vm"
  zone       = var.zone
  email      = module.google_service-account.email
  image      = var.image
  vpc-id     = module.google_vpc.vpc-id
  subnet-id  = module.google_management-subnet.subnet-id
  depends_on = [module.google_GKE-cluster]

}

module "google_GKE-cluster" {
  source      = "./GKE-cluster"
  zone        = var.zone
  email       = module.google_service-account.email
  vpc-id      = module.google_vpc.vpc-id
  subnet-id   = module.google_management-subnet.subnet-id
  subnet-cidr = var.subnet-cidr
}