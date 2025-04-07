resource "azurestack_virtual_network" "vnet" {
  name                = "devops-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurestack_subnet" "subnet" {
  name                 = "devops-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurestack_virtual_network.vnet.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurestack_public_ip" "public_ip" {
  name                = "devops-vm-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
}
