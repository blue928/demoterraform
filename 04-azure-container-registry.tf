# The Azure Container Registry
# https://docs.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry

resource "azurerm_container_registry" "k8s_acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.k8s.name
  location            = azurerm_resource_group.k8s.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled

  tags = {
    environment = var.environment
  }
}

# add the role to the identity the kubernetes cluster was assigned
