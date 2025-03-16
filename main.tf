module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  client_id           = var.client_id
  client_secret       = var.client_secret
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_admin_username   = var.vm_admin_username
  vm_admin_password   = var.vm_admin_password
  subnet_id           = module.network.subnet_id
}