# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone
#
# Note: This is used for development tickets. But this can be used
# to manage all dns resources. Or, kubernetes can interact with
# an existing dns zone where existing records aren't affected by
# those that are auto managed by k8s (ingress, external dns, and cert-manager). 

resource "azurerm_dns_zone" "public_dns_zone" {
  name                = var.azure_dns_domain
  resource_group_name = azurerm_resource_group.k8s.name

  tags = {}
}