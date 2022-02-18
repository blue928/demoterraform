#################################################
# Variables used throughout all terraform scripts
# Global
#################################################

variable "azure_subscription_id" {
  default = "0bfe77a8-517e-450b-a955-92f03bb4c40c"
  #default = "578e0f86-0491-4137-9a4e-3a3c0ff28e91"
}

variable "azure_tenant_id" {
  default = "c9678da8-892e-40dc-ae82-901eace67542"
}
variable "environment" {
  type        = string
  description = "Target environment tag (dev, prod, etc)"
}

variable "resource_group_name" {
  type        = string
  description = "Global resource group for all resources."
}

variable "location" {
  type        = string
  description = "Default location for all resources"
}

variable "ssh_public_key" {
  default     = "~/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"
}

#################################################
# AKS Production Cluster definition
# 03-aks-cluster-definition.tf 
#################################################
variable "cluster_name" {
  type        = string
  description = "Kubernetes cluster name"
}

variable "dns_prefix" {
  type        = string
  description = "Kubernetes default cluster DNS prefix"
}

# Note: if we don't specify the NRG Azure creates a random one for us that's
# hard to keep track of. 
# See: https://github.com/Azure/AKS/issues/3
variable "cluster_node_resource_group" {
  type        = string
  description = "Name of the resource group that AKS automatically creates."
}

variable "cluster_default_node_pool_vm_size" {
  type        = string
  description = "The virtual machine SKU AKS uses when creating node pools"
}

variable "cluster_default_node_pool_os_disk_size_gb" {
  type        = number
  description = "The disk space size of the default node pool. Cannot be less than 32."
}

variable "cluster_default_node_pool_min_count" {
  default     = 1
  type        = number
  description = "Minimum number of agents in the default node pool"
}

variable "cluster_default_node_pool_max_count" {
  type        = number
  description = "Maximum number of agents in the default node pool"
}

# Datasource to get Azure AKS latest Version
data "azurerm_kubernetes_service_versions" "current" {
  location        = azurerm_resource_group.k8s.location
  include_preview = false
}

# Namespaces are often managed with kubectl / YAML.
# But these are permanent and required by the cluster
# to operate correctly, so they are better managed as
# part of the the IaC
variable "cluster_production_namespace" {
  type        = string
  description = "Name of the cluster's production namespace."
}

variable "cluster_staging_namespace" {
  type        = string
  description = "Name of the cluster's staging namespace."
}

variable "cluster_development_namespace" {
  type        = string
  description = "Name of the cluster's development namespace."
}

variable "cluster_qa_namespace" {
  type        = string
  description = "Name of the cluster's QA namespace."
}



#################################################
# Container Insights Monitoring
# 04-container-insights.tf 
#################################################
variable "log_analytics_workspace_name" {
  default = "demoterraformLogAnalyticsWorkspace"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable "log_analytics_workspace_location" {
  default = "eastus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}

#################################################
# Azure MySQL Flexible Server
# 05-mysql-flexible-server.tf 
#################################################
variable "fs_db_server_name" {
  default = "demoterraform-fs-db-server"
}

variable "fs_db_server_sku_name" {
  default = "B_Standard_B1s"
}

# Database access firewall rules:
# For PRODUCTION, start_ip_address and end_ip_address should
# both be 0.0.0.0 
#
# For TESTING that the terraform scripts work, use a service
# like "What's My IP" to get the publicly accessible IP address
# of your computer. Use that value for both. 
variable "fs_fw_start_ip_address" {
  default = "0.0.0.0"
}

variable "fs_fw_end_ip_address" {
  default = "0.0.0.0"
}

variable "fs_db_server_administrator_login" {
  default = "demoterraformadmin"
}

variable "fs_db_server_administrator_password" {
  default = "H@Sh1CoR3"
}

variable "fs_db_server_backup_retention_days" {
  default = 7
}

# Database names
variable "fs_db_server_prod_db_name" {
  default = "demoterraformproddb"
}

## staging and dev dbs are no longer necessary, but adding
## in case there may be a use case I haven't figured out.
variable "fs_db_server_staging_db_name" {
  default = "demoterraformstagingdb"
}

variable "fs_db_server_dev_db_name" {
  default = "demoterraformdevdb"
}

#################################################
# Azure Container Registry
# 06-azure-container-registry.tf 
#################################################
variable "acr_name" {
  default     = "demoterraformacrtest"
  description = "The name of the ACR registry. Note: This MUST be unique across the whole of Azure"
}

variable "acr_sku" {
  default = "Basic"
}

variable "acr_admin_enabled" {
  default = false
}

#################################################
# Azure Public DNS
# 07-azure-dns.tf 
# 
# Note this can also be private. The point here
# is that we have to have some type of dev.*.com
# domain name because all app require https to
# work correctly.
#################################################

variable "azure_dns_domain" {
  default = "bluepresley.com"
}

variable "externaldns_to_dns_sp_name" {
  default = "demoterraformSpConnectToDNS"
}



### 11-static-ip-address-for-load-balancer.tf 
variable "lb_public_ip_name" {
  default     = "lbPublicIp"
  type        = string
  description = "This is the resource name of the static, public IP address for the Loadbalancer"
}

variable "lb_public_ip_allocation_type" {
  type    = string
  default = "Static"
}

variable "lb_public_ip_sku" {
  type    = string
  default = "Standard"
}