output "quickops_private_ip" {
  value = azurestack_network_interface.quickops_nic.private_ip_address
}

output "quickops_nic_id" {
  value = azurestack_network_interface.quickops_nic.id
}
