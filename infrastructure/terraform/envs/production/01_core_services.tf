## file:        production/01_core_services.tf
## usage:       Core services in homelab in production environment
## last_upd:    31.12.2024

# We import the previously created powerdns dns container
import {
    to = proxmox_virtual_environment_container.dnsy_01
    id = "ant/10401"
}
resource "proxmox_virtual_environment_container" "dnsy_01" {
    description = "powerdns auth dns for ho.dahu.day.\n managed by terraform"
    lifecycle {
        # We ignore changes to the tags attribute, because proxmox re-arranges them on its own.
        ignore_changes = [ tags,operating_system[0].template_file_id, disk[0], unprivileged ]
    }
    node_name = "ant"
    vm_id = 10401
    start_on_boot = true
    tags = ["core","networking"]
    unprivileged = true # Commented because it would force recreation.
    # Feature configuration
    features {
        nesting = true
    }
    # Hardware configuration
    memory {
        # We set dedicated memory and swap to the same for simplicity.
        dedicated = 2048
        swap = 2048
    }
    cpu {
        cores = 2
    }
    disk {
        datastore_id = "nfs_pve_ssd"
        size = 32
    }
    network_interface {
        name = "veth0"
        bridge = "vmbr3" # DMZ Network bridge
        mac_address = "BC:24:11:AC:78:5E"
    }

    initialization {
        hostname = "dnsy01.ho.dahu.day"

        ip_config {
           ipv4 {
                address = "dhcp"
            }
            ipv6 {
                address = "dhcp"
            }
        }
        /* user_account {
           keys = [
            for s in var.global_ssh_keys : trimspace(s)
           ]
           password = data.sops_file.proxmox_secrets.data["proxmox_default_password"]
        } # Sets password and add ssh key, commented because it forces recreation. */
    }

    operating_system {
        template_file_id = var.lxc_default_template # Commented because it forces recreation
        type = "debian"
    }
}
import {
    to = cloudflare_record.pdns_host
    id = "${var.cloudflare_home_zone}/21087ff4d5dacdd2637cba70e0396316"
}
resource "cloudflare_record" "pdns_host" {
  zone_id       = var.cloudflare_home_zone
  name          = "dns"
  content       = "81.6.45.114"
  type          = "A"
  ttl           = 3600
  depends_on = [ proxmox_virtual_environment_container.dnsy_01 ]
}

