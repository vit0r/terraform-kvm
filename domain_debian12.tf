locals {
  domain_name_domain = "debian12"
}

resource "libvirt_volume" "vol" {
  count            = var.domains_count_debian_12
  name             = format("%s-%s.%s", local.domain_name_domain, count.index, libvirt_volume.image_debian_12.0.format)
  base_volume_id   = libvirt_volume.image_debian_12.0.id
  size             = 26843545600 # 25gb
  base_volume_pool = var.default_pool_name
}

resource "libvirt_domain" "domain" {
  count      = var.domains_count_debian_12
  name       = format("%s-%s", local.domain_name_domain, count.index)
  cloudinit  = libvirt_cloudinit_disk.cloud_init.id
  arch       = "x86_64"
  vcpu       = var.vcpu
  memory     = var.memory
  autostart  = var.autostart
  qemu_agent = false
  disk {
    volume_id = libvirt_volume.vol[count.index].id
    scsi      = "true"
  }
  # network_interface {
  #   network_id = libvirt_network.network.id
  #   hostname   = format("%s-%s", local.domain_name_domain, count.index)
  # }
  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
  video {
    type = "virtio"
  }
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }
  cpu {
    mode = "host-passthrough"
  }
  boot_device {
    dev = ["hd"]
  }
  # cmdline = var.cmdline
}
