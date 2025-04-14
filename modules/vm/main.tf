resource "azurestack_network_interface" "vm_nic" {
  name                = "devops-vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.4"
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurestack_linux_virtual_machine" "vm" {
  name                  = "devops-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_D4s_v3"
  admin_username        = var.vm_admin_username
  network_interface_ids = [azurestack_network_interface.vm_nic.id]

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

