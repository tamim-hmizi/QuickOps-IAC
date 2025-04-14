provider "azurestack" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  metadata_host   = "https://management.dc2.xpressazure.com/"
}
