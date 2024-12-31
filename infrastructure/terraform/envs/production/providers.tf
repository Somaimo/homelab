provider "sops" {}

provider "proxmox" {
  endpoint = data.sops_file.proxmox_secrets.data["proxmox_endpoint_url"]
  # TODO: use terraform variable or remove the line, and use PROXMOX_VE_USERNAME environment variable
  api_token = data.sops_file.proxmox_secrets.data["proxmox_api_token"]
  insecure = false
  # uncomment (unless on Windows...)
  # tmp_dir  = "/var/tmp"

  ssh {
    agent = true
    # TODO: uncomment and configure if using api_token instead of password
    username = data.sops_file.proxmox_secrets.data["proxmox_ssh_username"]
  }
}

provider "cloudflare" {
  api_token = data.sops_file.cloudflare_secrets.data["cloudflare_api_token"]
}