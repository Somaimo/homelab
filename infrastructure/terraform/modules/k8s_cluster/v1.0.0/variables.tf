# k8s_cluster/v1.0.0/variables.tf
variable "image" {
  description = "Talos image configuration"
  type = object({
    factory_url       = optional(string, "https://factory.talos.dev")
    schematic         = string
    version           = string
    update_schematic  = optional(string)
    update_version    = optional(string)
    arch              = optional(string, "amd64")
    platform          = optional(string, "nocloud")
    proxmox_datastore = optional(string, "local")
  })
}

variable "cluster" {
  description = "Cluster configuration"
  type = object({
    name            = string
    endpoint        = string
    gateway         = string
    talos_version   = string
    proxmox_cluster = string
  })
}

variable "vm_nodes" {
  description = "Configuration for cluster nodes that run as VMs.machine_type could be either worker or controlplane"
  type = map(object({
    host_node     = string
    machine_type  = string
    datastore_id = optional(string, "local-zfs")
    ip            = string
    mac_address   = string
    vm_id         = number
    cpu           = number
    ram_dedicated = number
    update        = optional(bool, false)
    igpu          = optional(bool, false)
  }))
}

variable "physical_nodes" {
  description = "This is optional. Configuration for cluster nodes that run as physical systems.machine_type could be either worker or controlplane"
  type = map(object({
    cpu_type      = string
    machine_type  = string
    disk          = optional(string, "sda")
    ip            = string
    mac_address   = optional(string, "")
    update        = optional(bool, false)
    igpu          = optional(bool, false)
  }))
}

variable "cilium" {
  description = "Cilium configuration"
  type = object({
    values  = string
    install = string
  })
}
