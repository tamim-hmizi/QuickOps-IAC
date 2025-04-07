output "subnet_id" {
  value = azurestack_subnet.subnet.id
}

output "aks_subnet_id" {
  value = azurestack_subnet.aks_subnet.id
}

output "public_ip_id" {
  value = azurestack_public_ip.public_ip.id
}

output "public_ip" {
  value = azurestack_public_ip.public_ip.ip_address
}

