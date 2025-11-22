variable "libvirt_system" {
  type        = string
  default     = "qemu:///system"
  description = "(optional) default is qemu:///system"
}

variable "default_pool_name" {
  type        = string
  default     = "default"
  description = "(optional) default pool name is default"
}

variable "libvirt_network_name" {
  type    = string
  default = "libvirttf"
}
variable "libvirt_network_cidr" {
  type    = string
  default = "192.168.124.0/24"
}

variable "libvirt_network_domain" {
  type    = string
  default = "libvirttf.local"
}

variable "libvirt_network_mode" {
  type    = string
  default = "nat"
}

variable "k8s_vcpu" {
  default = 4
  type    = number
}

variable "k8s_memory" {
  type    = string
  default = "16048"
}

variable "nfs_vcpu" {
  default = 2
  type    = number
}

variable "nfs_memory" {
  type    = string
  default = "2048"
}

variable "vcpu" {
  default = 1
  type    = number
}

variable "memory" {
  type    = string
  default = "1024"
}

variable "autostart" {
  type    = bool
  default = true
}

variable "firmware" {
  type    = string
  default = "/usr/share/qemu/ovmf-x86_64-code.bin"
}

variable "macvtap" {
  default = "enp58s0" # network interface
}

variable "domains_count_ol8" {
  default = 0
  type    = string
}

variable "domains_count_ol9" {
  default = 0
  type    = string
}

variable "k8s_count_debian_12" {
  type    = number
  default = 2
}

variable "nfs_count_debian_12" {
  type    = number
  default = 1
}

variable "generic_count_debian_12" {
  type    = number
  default = 0
}

variable "nfs_vol_size_debian_12" {
  default = 128000000000
}

variable "count_debian_12" {
  type    = number
  default = 0
}

variable "dhw_count_debian_12" {
  type    = number
  default = 0
}

variable "vol_size_debian_12" {
  default = 128000000000
}

variable "qemu_agent" {
  type    = bool
  default = false
}

variable "dhw_vcpu" {
  type    = number
  default = 4
}

variable "dhw_memory" {
  type    = string
  default = "8048"
}

variable "generic_vcpu" {
  type    = number
  default = 0
}

variable "generic_memory" {
  type    = string
  default = "2048"
}

variable "network_name" {
  type    = string
  default = "default"
}
