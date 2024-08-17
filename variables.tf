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

variable "debian_codename" {
  default = "bookworm"
  type    = string
}

variable "vcpu" {
  default = 2
  type    = number
}

variable "memory" {
  type    = string
  default = "4048"
}

variable "autostart" {
  type    = bool
  default = false
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
  default = 1
  type    = string
}

variable "domains_count_debian" {
  type    = number
  default = 0
}
