resource "azurestack_storage_account" "state" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
}

resource "azurestack_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_name  = azurestack_storage_account.state.name
  container_access_type = "private"
}
