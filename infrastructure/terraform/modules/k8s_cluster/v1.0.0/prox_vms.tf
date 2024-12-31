resource "proxmox_virtual_environment_container" "instance" {
    description = var.ctx_description

    lifecycle {
        # We ignore changes to the tags attribute, because proxmox re-arranges them on its own.
        ignore_changes = [ tags, ]
    }

    node_name = var.ctx_node_name
    vm_id = var.ctx_id
    start_on_boot = var.ctx_start_on_boot
    tags = var.ctx_tags
    unprivileged = var.ctx_unprivileged

    # Feature configuration
    features {
        nesting = var.ctx_feature_nesting
    }

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
        size = var.ctx_disk_size
    }
    network_interface {
        name = "veth0"
        bridge = var.ctx_nic_bridge
        mac_address = var.ctx_mac_address
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
        user_account {
           keys = [
            for s in var.ctx_ssh_keys : trimspace(s)
           ]
           password = var.ctx_user_password
        }
    }

    operating_system {
        template_file_id = var.ctx_os_template
        type = var.ctx_os_type
    }
}