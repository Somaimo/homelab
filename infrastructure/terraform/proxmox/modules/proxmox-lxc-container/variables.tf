variable "ctx_name" {
    description = "Name of the lxc container"
    type = string
}

variable "ctx_hostname" {
    type = string
    description = "Set the hostname of the container, should be the same as ctx_name"
}

variable "ctx_cpu_cores" {
    type = number
    description = "Number of cpu cores for the container"
    default = 2 
}

variable "ctx_memory" {
    type = number
    description = "Amount of RAM for the container in MiB"
    default = 2048
}

variable "ctx_swap" {
    type = number
    description = "Amount of SWAP for the container in MiB"
    default = 2048
}

variable "ctx_description" {
  type        = string
  default     = "Managed by OpenTofu"
  description = "Description of lxc container, please be verbose."
}

variable "ctx_id" {
  type        = string
  description = "id for the new lxc container"
}
variable "ctx_nic_bridge" {
    type = string
    description = "Defines on which network the container is attached."
}
variable "ctx_ipv4_address" {
  type        = string
  default     = "dhcp"
  description = "IPv4 Address for lxc container, defaults to dhcp"
}
variable "ctx_ipv4_gateway" {
  type        = string
  default     = null
  description = "IPv4 gateway for lxc container, defaults to null and should only be set if address not dhcp"
}

variable "ctx_ipv6_address" {
  type        = string
  default     = "dhcp"
  description = "IPv6 Address for lxc container, defaults to dhcp"
}
variable "ctx_ipv6_gateway" {
  type        = string
  default     = null
  description = "IPv6 gateway for lxc container, defaults to null and should only be set if address not dhcp"
}

variable "ctx_os_type" {
  type        = string
  default     = "debian"
  description = "Set the OS type of the container"
}

variable "ctx_user_password" {
    type = string
    default =  data.sops_file.proxmox_secrets.data["proxmox_default_password"]
    description = "Sets password for user in container"
    sensitive = true
  
}

variable "ctx_datastore_id" {
    type = string
    default = "nfs_pve_ssd"
    description = "Define where the container data should be stored"
  
}

variable "ctx_datastore_size" {
    type = number
    default = 18
    description = "Define disk size for container"
  
}
