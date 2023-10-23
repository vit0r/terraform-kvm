locals {
  domain_name_domain_ol8 = "ol8"
}

resource "libvirt_volume" "vol_ol8" {
  count            = var.domains_count_ol8
  name             = format("%s-%s", local.domain_name_domain_ol8, count.index)
  base_volume_id   = libvirt_volume.oracle_linux8.0.id
  size             = 53687091200 # 50gb
  base_volume_pool = var.default_pool_name
}

resource "libvirt_domain" "domain_ol8" {
  count      = var.domains_count_ol8
  name       = format("%s-%s", local.domain_name_domain_ol8, count.index)
  cloudinit  = libvirt_cloudinit_disk.cloud_init.id
  arch       = "x86_64"
  vcpu       = var.vcpu
  memory     = var.memory
  autostart  = var.autostart
  qemu_agent = true
  disk {
    volume_id = libvirt_volume.vol_ol8[count.index].id
    scsi      = "true"
  }
  network_interface {
    network_id = libvirt_network.network.id
    hostname   = format("%s-%s", local.domain_name_domain_ol8, count.index)
    addresses  = [format("192.168.124.%s", (count.index + 20))]
  }
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
