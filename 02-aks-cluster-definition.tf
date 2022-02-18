# Production cluster definition


resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  node_resource_group = var.cluster_node_resource_group
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name = "agentpool"
    # node_count      = var.agent_count

    # Let Azure manage the API version automatically
    # orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    vm_size             = var.cluster_default_node_pool_vm_size
    availability_zones  = [1, 2, 3]
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = true
    max_count           = var.cluster_default_node_pool_max_count
    min_count           = var.cluster_default_node_pool_min_count
    os_disk_size_gb     = var.cluster_default_node_pool_os_disk_size_gb

    node_taints = []
    tags        = {}
  }

  identity {
    type = "SystemAssigned"
  }

  #service_principal {
  #    client_id     = var.client_id
  #    client_secret = var.client_secret
  #}

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.container_insights.id
    }
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }

  tags = {
    environment = var.environment
  }
}


resource "azurerm_role_assignment" "cluster_to_acr_permissions" {
  scope                = azurerm_container_registry.k8s_acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id

  depends_on = [
    azurerm_container_registry.k8s_acr
  ]
}

output "client_key" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.username
}

output "cluster_password" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.password
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.host
}

output "az_aks_get_credentials" {
  value = "az aks get-credentials --name ${azurerm_kubernetes_cluster.k8s.name} --resource-group ${azurerm_resource_group.k8s.name}"
}

