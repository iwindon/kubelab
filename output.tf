output "k8s_master_ip" {
  value = try(libvirt_domain.k8s_master.network_interface[0].addresses[0], "No IP assigned")
}

output "k8s_node1_ip" {
  value = try(libvirt_domain.k8s_node1.network_interface[0].addresses[0], "No IP assigned")
}

output "k8s_node2_ip" {
  value = try(libvirt_domain.k8s_node2.network_interface[0].addresses[0], "No IP assigned")
}