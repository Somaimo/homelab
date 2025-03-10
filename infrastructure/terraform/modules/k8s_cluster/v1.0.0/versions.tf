terraform {
  required_providers {
    proxmox = {
        source = "bpg/proxmox"
        version = ">=0.60.1"
    }
    talos = {
      source = "siderolabs/talos"
      version = ">=0.6.0"
    }
  }
}
