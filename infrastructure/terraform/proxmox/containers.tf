## file:        proxmox/containers.tf
## usage:       define all tf managed lxc containers in homelab cluster
## last_upd:    02.07.2024

# PowerDNS Authoritative container for ho.dahu.day - network: dmz, managed_by: ansible
module "dnsy_01" {
  source = "./modules/proxmox-lxc-container"
  ctx_node_name = "beetle"
  ctx_hostname = "dnsy01.ho.dahu.day"
  ctx_os_template = var.lxc_default_template
  ctx_id = 10401
  ctx_nic_bridge = "vmbr3" # DMZ Network bridge
  ctx_user_password = data.sops_file.proxmox_secrets.data["proxmox_default_password"]
  ctx_memory = 2048
  ctx_cpu_cores = 2
  ctx_tags = ["core","networking"]
  ctx_disk_size = 32
  ctx_datastore_id = "nfs_pve_ssd"
  ctx_description = "powerdns auth dns for ho.dahu.day.\n managed by terraform"
  ctx_mac_address = "BC:24:11:AC:78:5E"
  ctx_started = true
  ctx_start_on_boot = true
  ctx_unprivileged = true
  ctx_ssh_keys = var.global_ssh_keys
  ctx_feature_nesting = true
}

resource "cloudflare_record" "pdns_host" {
  zone_id     = var.cloudflare_home_zone
  name        = "dns"
  value       = "81.6.45.114"
  type        = "A"
  ttl         = 3600
}
