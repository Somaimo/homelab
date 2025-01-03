locals {
    general_secrets = sensitive(yamldecode(nonsensitive(data.sops_file.general_secrets.raw)))
}
variable "global_ssh_keys" {
    type = list
    default = ["sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBBCaMQbu2yEKTUilT5PH1o3PBPBpa5NfVt1BjWNAXTeMyutmK6GlMJKq/L759BHXgw2SJQSNcE135Hab5Xg/GGIAAAAEc3NoOg== T2F2-Bio-Key","ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOuXqfbqO/9l97IJJyWKVU85ioGtpxU3QmUGnDD6RNl7 ansible_deploy_key"]
}

variable "gcp_compute_size" {
    type = string
    default = "e2-micro"
  
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}