resource "libvirt_cloudinit_disk" "cloud_init" {
  name      = "cloudinit"
  user_data = data.template_file.user_data.rendered
  pool = var.default_pool_name
}
