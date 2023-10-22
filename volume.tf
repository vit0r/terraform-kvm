resource "libvirt_volume" "image" {
  count  = var.domains_count > 0 ? 1 : 0
  name   = "debian-disk-${var.image_version}-amd64.qcow2"
  format = "qcow2"
  source = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-${var.image_version}-generic-amd64.qcow2"
  pool   = var.default_pool_name
}
