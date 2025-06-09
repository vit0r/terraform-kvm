locals {
  k8s_domain_name_domain = "k8s-debian12"
}

resource "libvirt_volume" "k8s_vol" {
  count            = var.k8s_count_debian_12
  name             = format("%s-%s.%s", local.k8s_domain_name_domain, count.index, libvirt_volume.k8s_image_debian_12.0.format)
  base_volume_id   = libvirt_volume.k8s_image_debian_12.0.id
  size             = 26843545600 # 25gb
  base_volume_pool = var.default_pool_name
}

resource "libvirt_domain" "k8s_domain" {
  count      = var.k8s_count_debian_12
  name       = format("%s-%s", local.k8s_domain_name_domain, count.index)
  cloudinit  = libvirt_cloudinit_disk.cloud_init.id
  arch       = "x86_64"
  vcpu       = var.k8s_vcpu
  memory     = var.k8s_memory
  autostart  = var.autostart
  qemu_agent = var.qemu_agent
  disk {
    volume_id = libvirt_volume.k8s_vol[count.index].id
    scsi      = "true"
  }
  network_interface {
    network_name = "internal-network"
    hostname     = format("%s-%s", local.k8s_domain_name_domain, count.index)
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
