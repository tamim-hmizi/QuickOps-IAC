module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vm" {
  source                  = "./modules/vm"
  resource_group_name     = var.resource_group_name
  location                = var.location
  ssh_public_key          = var.ssh_public_key
  quickops_admin_username = var.quickops_admin_username
  quickops_subnet_id      = module.network.quickops_subnet_id
  quickops_public_ip_id   = module.network.quickops_public_ip_id
}
