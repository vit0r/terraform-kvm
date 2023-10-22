resource "libvirt_network" "network" {
  name      = var.libvirt_network_name
  domain    = var.libvirt_network_domain
  addresses = [var.libvirt_network_cidr]
  autostart = true
  dns {
    enabled    = true
    local_only = true
  }
  dhcp {
    enabled = false
  }
}
