## file:        proxmox/main.terraform
## usage:       declare common settings for terraform
## last_upd:    02.07.2024

# Read secrets from sops
data "sops_file" "proxmox_secrets" {
  source_file = "proxmox_secrets.sops.yaml"
}

data "sops_file" "cloudflare_secrets" {
  source_file = "cloudflare_secrets.sops.yaml"
}