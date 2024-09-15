resource "libvirt_volume" "image_debian_12" {
  count  = var.domains_count_debian_12 > 0 ? 1 : 0
  name   = "debian-disk-12-amd64-${count.index}.qcow2"
  format = "qcow2"
  source = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
  pool   = var.default_pool_name
}

resource "libvirt_volume" "oracle_linux8" {
  count  = var.domains_count_ol8 > 0 ? 1 : 0
  source = "https://yum.oracle.com/templates/OracleLinux/OL8/u10/x86_64/OL8U10_x86_64-kvm-b237.qcow2"
  pool   = var.default_pool_name
  format = "qcow2"
  name   = "oraclelinux-disk-OL8-amd64-${count.index}.qcow"
}

resource "libvirt_volume" "oracle_linux9" {
  count  = var.domains_count_ol9 > 0 ? 1 : 0
  source = "https://yum.oracle.com/templates/OracleLinux/OL9/u4/x86_64/OL9U4_x86_64-kvm-b234.qcow2"
  pool   = var.default_pool_name
  format = "qcow2"
  name   = "oraclelinux-disk-OL9-amd64-${count.index}.qcow"
}
