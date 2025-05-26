output "quickops_subnet_id" {
  value = module.network.quickops_subnet_id
}

output "quickops_public_ip_id" {
  value = module.network.quickops_public_ip_id
}

output "quickops_public_ip" {
  value = module.network.quickops_public_ip
}

output "quickops_private_ip" {
  value = module.vm.quickops_private_ip
}

output "quickops_nsg_id" {
  value = module.network.quickops_nsg_id
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "container_name" {
  value = module.storage.container_name
}
