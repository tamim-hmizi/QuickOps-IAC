output "quickops_subnet_id" {
  value = azurestack_subnet.quickops_subnet.id
}

output "quickops_public_ip_id" {
  value = azurestack_public_ip.quickops_public_ip.id
}

output "quickops_public_ip" {
  value = azurestack_public_ip.quickops_public_ip.ip_address
}

output "quickops_nsg_id" {
  value = azurestack_network_security_group.quickops_nsg.id
}


