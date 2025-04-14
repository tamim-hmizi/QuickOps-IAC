output "vm_private_ip" {
  value = azurestack_network_interface.vm_nic.private_ip_address
}

output "vm_nic_id" {
  value = azurestack_network_interface.vm_nic.id
}
