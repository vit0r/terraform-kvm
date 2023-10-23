resource "libvirt_volume" "image" {
  count  = var.domains_count > 0 ? 1 : 0
  name   = "debian-disk-${var.image_version}-amd64.qcow2"
  format = "qcow2"
  source = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-${var.image_version}-generic-amd64.qcow2"
  pool   = var.default_pool_name
}

resource "libvirt_volume" "oracle_linux8" {
  count  = var.domains_count_ol8 > 0 ? 1 : 0
  source = "https://yum.oracle.com/templates/OracleLinux/OL8/u8/x86_64/OL8U8_x86_64-kvm-b198.qcow"
  pool   = var.default_pool_name
  format = "qcow2"
  name   = "oraclelinux-disk-OL8-amd64.qcow"
}
