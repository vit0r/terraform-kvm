variable "libvirt_system" {
  type        = string
  default     = "qemu+ssh:///system"
  description = "(optional) default is qemu:///system"
}

variable "default_pool_name" {
  type        = string
  default     = "default"
  description = "(optional) default pool name is default"
}

variable "domains_count" {
  type    = number
  default = 5
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

variable "image_version" {
  default = "12"
  type    = string
}

variable "vcpu" {
  default = 4
  type    = number
}

variable "memory" {
  type    = string
  default = "8048"
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
