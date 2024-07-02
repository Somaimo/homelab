locals {
    proxmox_secrets = sensitive(yamldecode(nonsensitive(data.sops_file.proxmox_secrets.raw)))
}
variable "global_ssh_keys" {
    type = list
    default = ["sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBBCaMQbu2yEKTUilT5PH1o3PBPBpa5NfVt1BjWNAXTeMyutmK6GlMJKq/L759BHXgw2SJQSNcE135Hab5Xg/GGIAAAAEc3NoOg== T2F2-Bio-Key","ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOuXqfbqO/9l97IJJyWKVU85ioGtpxU3QmUGnDD6RNl7 ansible_deploy_key"]
}

variable "lxc_default_template" {
    type = string
    default = "nfs_isos:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  
}