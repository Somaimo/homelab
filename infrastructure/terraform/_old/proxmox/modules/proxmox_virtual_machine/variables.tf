variable "vm_hostname" {
    type = string
    description = "Set the hostname of the virtual machine, should be the same as vm_name"
}

variable "vm_node_name" {
  type = string
  description = "Name of node where the virtual machine should be created."
  
}

variable "vm_cpu_arch" {
  type = string
  default = "x86-64-v3"
  description = "CPU Architecture type for the virtual machine. Defaults to x86-64-v3 if not set otherwise."
}

variable "vm_cpu_sockets" {
    type = number
    description = "Number of cpu cores for the virtual machine"
    default = 1
}

variable "vm_cpu_cores" {
    type = number
    description = "Number of cpu cores for the virtual machine"
    default = 2 
}

variable "vm_memory" {
    type = number
    description = "Amount of RAM for the virtual machine in MiB"
    default = 2048
}

variable "vm_bios_type" {
    type = string
    description = "Choose if vm is based on BIOS (seabios) or UEFI (ovmf). Defaults to BIOS. If UEFI, requires an additional UEFI Disk."
    default = "seabios"
}

variable "vm_tags" {
  type = list
  default = []
  description = "Tags to append to virtual machine"
}

variable "vm_description" {
  type        = string
  default     = "Managed by OpenTofu"
  description = "Description of lxc virtual machine, please be verbose."
}

variable "vm_start_on_boot" {
  type = bool
  default = true
  description = "Define if the virtual machine should be started after host booted."  
}
variable "vm_started" {
  type = bool
  default = true
  description = "Define if virtual machine should be started after creation."
}

variable "vm_id" {
  type        = string
  description = "id for the new virtual machine"
}
variable "vm_nic_bridge" {
    type = string
    description = "Defines on which network the virtual machine is attached."
}
variable "vm_mac_address" {
  type = string
  default = null
  description = "optional mac address for virtual machine network adapter"
  
}
variable "vm_ipv4_address" {
  type        = string
  default     = "dhcp"
  description = "IPv4 Address for virtual machine, defaults to dhcp"
}
variable "vm_ipv4_gateway" {
  type        = string
  default     = null
  description = "IPv4 gateway for virtual machine, defaults to null and should only be set if address not dhcp"
}

variable "vm_ipv6_address" {
  type        = string
  default     = "dhcp"
  description = "IPv6 Address for virtual machine, defaults to dhcp"
}
variable "vm_ipv6_gateway" {
  type        = string
  default     = null
  description = "IPv6 gateway for virtual machine, defaults to null and should only be set if address not dhcp"
}

variable "vm_os_type" {
  type        = string
  default     = "debian"
  description = "Set the OS type of the virtual machine"
}
variable "vm_os_iso" {
  type = string
  description = "Use iso file for virtual machine."
}

variable "vm_user_password" {
    type = string
    description = "Sets password for user in virtual machine"
    sensitive = true
  
}

variable "vm_datastore_id" {
    type = string
    default = "nfs_pve_ssd"
    description = "Define where the virtual machine os disk should be stored"
  
}

variable "vm_disk_size" {
    type = number
    default = 18
    description = "Define disk size for virtual machine os disk"
  
}
