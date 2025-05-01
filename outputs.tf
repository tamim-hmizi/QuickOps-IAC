output "subnet_id" {
  value = module.network.subnet_id
}

output "aks_subnet_id" {
  value = module.network.aks_subnet_id
}

output "aks_agents_subnet_id" {
  value = module.network.aks_agents_subnet_id
}

output "public_ip_id" {
  value = module.network.public_ip_id
}

output "public_ip" {
  value = module.network.public_ip
}

output "vm_private_ip" {
  value = module.vm.vm_private_ip
}

output "vm_nsg_id" {
  value = module.network.vm_nsg_id
}

output "ingress_public_ip" {
  value = module.network.ingress_public_ip
}

