output "domain_access_info" {
  value = {
    "hostname" : libvirt_domain.domain.*.network_interface.0.hostname,
    "ip" : libvirt_domain.domain.*.network_interface.0.addresses.0
  }
}

output "domain_access_info_ol8" {
  value = {
    "hostname" : libvirt_domain.domain_ol8.*.network_interface.0.hostname,
    "ip" : libvirt_domain.domain_ol8.*.network_interface.0.addresses.0
  }
}
