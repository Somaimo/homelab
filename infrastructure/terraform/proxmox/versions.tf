terraform {
  required_providers {
    proxmox = {
        source = "bpg/proxmox"
        version = ">=0.60.1"
    }
    sops = {
        source = "carlpett/sops"
        version = "1.0.0"
    }
  }
}
