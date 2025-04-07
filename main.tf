module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_admin_username   = var.vm_admin_username
  vm_admin_password   = var.vm_admin_password
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
  ssh_public_key      = var.ssh_public_key
}
