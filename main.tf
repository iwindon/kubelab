# resource "libvirt_network" "k8s_network" {
#   name = "k8s-network"
#   mode = "nat"
#   domain = "k8s.local"
#   addresses = ["192.168.122.0/24"]
# }

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

data "template_file" "cloud_init" {
  template = file("${path.module}/cloud_init.cfg")
}

resource "libvirt_domain" "k8s_master" {
  name   = "k8s-master"
  memory = "2048"
  vcpu   = 2
  network_interface {
    bridge = "virbr0"
  }
  disk {
    volume_id = "${libvirt_volume.rhel_image_master.id}"
  }
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
    volume_id = "${libvirt_volume.rhel_image_node1.id}"
  }
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
    volume_id = "${libvirt_volume.rhel_image_node2.id}"
  }
  graphics {
    type = "vnc"
    listen_type = "address"
    listen_address = "0.0.0.0"
  }
}