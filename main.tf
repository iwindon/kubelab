resource "libvirt_volume" "rhel_image_master" {
  name   = "rhel-9.1-master.qcow2"
  pool   = "default"
  source = var.rhel_image_path
  format = "qcow2"
}

resource "libvirt_volume" "rhel_image_node1" {
  name   = "rhel-9.1-node1.qcow2"
  pool   = "default"
  source = var.rhel_image_path
  format = "qcow2"
}

resource "libvirt_volume" "rhel_image_node2" {
  name   = "rhel-9.1-node2.qcow2"
  pool   = "default"
  source = var.rhel_image_path
  format = "qcow2"
}

data "template_file" "user_data" {
  template = "${file("${path.module}/cloud_init.cfg")}"
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  pool           = "default"
  user_data      = "${data.template_file.user_data.rendered}"
}

resource "libvirt_domain" "k8s_master" {
  name   = "k8s-master"
  memory = "4096"
  vcpu   = 4
  network_interface {
    bridge = "virbr0"
  }
  disk {
    volume_id = libvirt_volume.rhel_image_master.id
  }
  
  cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"

  graphics {
    type = "vnc"
    listen_type = "address"
    listen_address = "0.0.0.0"
  }
}

resource "libvirt_domain" "k8s_node1" {
  name   = "k8s-node1"
  memory = "2048"
  vcpu   = 2
  network_interface {
    bridge = "virbr0"
  }
  disk {
    volume_id = libvirt_volume.rhel_image_node1.id
  }
  cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"
  graphics {
    type = "vnc"
    listen_type = "address"
    listen_address = "0.0.0.0"
  }
}

resource "libvirt_domain" "k8s_node2" {
  name   = "k8s-node2"
  memory = "2048"
  vcpu   = 2
  network_interface {
    bridge = "virbr0"
  }
  disk {
    volume_id = libvirt_volume.rhel_image_node2.id
  }
  cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"
  graphics {
    type = "vnc"
    listen_type = "address"
    listen_address = "0.0.0.0"
  }
}
