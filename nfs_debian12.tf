locals {
  nfs_domain_name_domain = "nfs-debian12"
}

resource "libvirt_volume" "nfs_vol" {
  count            = var.nfs_count_debian_12
  name             = format("%s-%s.%s", local.nfs_domain_name_domain, count.index, libvirt_volume.nfs_image_debian_12.0.format)
  base_volume_id   = libvirt_volume.nfs_image_debian_12.0.id
  size             = var.nfs_vol_size_debian_12
  base_volume_pool = var.default_pool_name
}

resource "libvirt_domain" "nfs_domain" {
  count      = var.nfs_count_debian_12
  name       = format("%s-%s", local.nfs_domain_name_domain, count.index)
  cloudinit  = libvirt_cloudinit_disk.cloud_init.id
  arch       = "x86_64"
  vcpu       = var.nfs_vcpu
  memory     = var.nfs_memory
  autostart  = var.autostart
  qemu_agent = var.qemu_agent
  disk {
    volume_id = libvirt_volume.nfs_vol[count.index].id
    scsi      = "true"
  }
  network_interface {
    network_name = "internal-network"
    hostname     = format("%s-%s", local.nfs_domain_name_domain, count.index)
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
