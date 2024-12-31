## file:        development/terraform.tf
## usage:       declare configuration for terraform / tofu
## last_upd:    31.12.2024

# Read secrets from sops
data "sops_file" "proxmox_secrets" {
  source_file = "./00_secrets/proxmox_secrets.sops.yaml"
}

data "sops_file" "gcs_secrets" {
    source_file = "./00_secrets/gcs_secrets.sops.yaml"
}

data "sops_file" "cloudflare_secrets" {
  source_file = "./00_secrets/cloudflare_secrets.sops.yaml"
}


terraform {
  backend "gcs" {
    bucket  = " homelab-prd-gcp-gcs-tf"
    prefix  = "terraform/prd-sstate"
  }
}