output "domain_access_info" {
  value = {
    "hostname" : libvirt_domain.domain.*.network_interface.0.hostname,
    "ip" : libvirt_domain.domain.*.network_interface.0.addresses.0
  }
}

