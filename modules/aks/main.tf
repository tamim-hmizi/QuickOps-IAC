resource "azurerm_kubernetes_cluster" "aks" {
  name                = "devops-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "devopsaks"

  default_node_pool {
    name       = "agentpool"
    node_count = 3
    vm_size    = "Standard_D4s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}