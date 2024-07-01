resource "proxmox_virtual_environment_container" "instance" {
    description = var.ctx_description

    vm_id = var.ctx_id

    # Hardware configuration
    memory {
        # We set dedicated memory and swap to the same for simplicity.
        dedicated = var.ctx_memory
        swap = var.ctx_swap
    }
    cpu {
        cores = var.ctx_cpu_cores
    }
    disk {
        datastore_id = var.ctx_datastore_id
        size = var.ctx_datastore_size
    }
    network_interface {
        name = "veth0"
        bridge = var.ctx_nic_bridge
    }

    initialization {
        hostname = var.ctx_hostname

        ip_config {
           ipv4 {
                address = var.ctx_ipv4_address
                gateway = var.ctx_ipv4_address != "dhcp" ? var.ctx_ipv4_gateway : null
            }
            ipv6 {
                address = var.ctx_ipv6_address
                gateway = var.ctx_ipv6_address != "dhcp" ? var.ctx_ipv6_gateway : null
            }
        }
    }

    user_account {
        keys = [
            trimspace(var.global_ssh_keys)
        ]
        password = var.ctx_user_password
    }
}