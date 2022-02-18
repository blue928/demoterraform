# Working with resources that already exist in the landing zone.
# The current configuration assumes that everything will exist
# under one resource group and one subscription. However, for the
# resources that support it, additional data blocks can be added
# so resources can be spread around as needed.


# Current kubernetes cluster information
#data "azurerm_kubernetes_cluster" "current" {
#  name                = azurerm_kubernetes_cluster.k8s.name
#  resource_group_name = azurerm_resource_group.k8s.name
#}

# Current subscription information
data "azurerm_subscription" "current" {}

# Current client configuration information
data "azuread_client_config" "current" {}
