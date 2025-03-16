output "subnet_id" {
  value = module.network.subnet_id
}

output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "vm_ip" {
  value = module.vm.vm_private_ip
}