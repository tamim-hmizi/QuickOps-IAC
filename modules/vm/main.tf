resource "azurestack_network_interface" "quickops_nic" {
  name                = "quickops-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.quickops_subnet_id
    primary                       = true
    private_ip_address_version    = "IPv4"
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.4"
    public_ip_address_id          = var.quickops_public_ip_id
  }
}

resource "azurestack_linux_virtual_machine" "quickops_vm" {
  name                  = "quickops-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_F64s_v2"
  admin_username        = var.quickops_admin_username
  network_interface_ids = [azurestack_network_interface.quickops_nic.id]

  admin_ssh_key {
    username   = var.quickops_admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 128
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

