
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  #subscription_id = "578e0f86-0491-4137-9a4e-3a3c0ff28e91"
  skip_provider_registration = true

  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features
  features {
    resource_group {
      # For added security, the Production value for this should be set to true. 
      # Note: From version 3.0 this will be true by default. 
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#prevent_deletion_if_contains_resources
      # prevent_deletion_if_contains_resources = true

      prevent_deletion_if_contains_resources = true
    }

  }
}
/*
provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.current.kube_config.0.host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.current.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.current.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.current.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.current.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.current.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.current.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.current.kube_config.0.cluster_ca_certificate)
  }
}
*/