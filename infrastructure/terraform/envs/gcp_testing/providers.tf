variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "zone" {
  description = "zone"
}
provider "sops" {}

provider "google" {
  project   = var.project_id
  region    = var.region
  zone      = var.zone
}