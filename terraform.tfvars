# This is the global configuration file for the infrastructure. It provides
# the default values for the variables.tf file.
#azure_subscription_id          = "578e0f86-0491-4137-9a4e-3a3c0ff28e91"
azure_tenant_id                           = "0457c22a-03ab-4ceb-8e26-391ef8087bc2"
environment                               = "stihldevlift"
resource_group_name                       = "DEV-Lift_Stihl-Dev_CentralUS"
location                                  = "eastus"
ssh_public_key                            = "~/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
cluster_name                              = "stihldevlift-cluster"
dns_prefix                                = "stihldevliftrgk8s"
cluster_node_resource_group               = "stihldevlift-nrg"
cluster_default_node_pool_vm_size         = "Standard_B2s"
cluster_default_node_pool_os_disk_size_gb = 32
cluster_default_node_pool_min_count       = 1
cluster_default_node_pool_max_count       = 3
cluster_production_namespace              = "stihldevlift-production"
cluster_staging_namespace                 = "stihldevlift-staging"
cluster_development_namespace             = "stihldevlift-development"
cluster_qa_namespace                      = "stihldevlift-qa"
log_analytics_workspace_name              = "stihldevliftLogAnalyticsWorkspace"
log_analytics_workspace_location          = "eastus"
log_analytics_workspace_sku               = "PerGB2018"
fs_db_server_name                         = "stihldevliftfs-db-server"
#fs_db_server_sku_name                     = "G_Standard_D2ds_v4"
fs_db_server_sku_name               = "B_Standard_B1s"
fs_fw_start_ip_address              = "98.24.104.193"
fs_fw_end_ip_address                = "98.24.104.193"
fs_db_server_administrator_login    = "stihldevliftadmin"
fs_db_server_administrator_password = "H@Sh1CoR3"
fs_db_server_backup_retention_days  = 7
fs_db_server_prod_db_name           = "stihldevliftproddb"
fs_db_server_staging_db_name        = "stihldevliftstagingdb"
fs_db_server_dev_db_name            = "stihldevliftdevdb"
acr_name                            = "stihldevliftacr"
acr_sku                             = "Basic"
acr_admin_enabled                   = false
azure_dns_domain                    = "enterprisewp.cloud"
externaldns_to_dns_sp_name          = "stihldevliftSpConnectToDNS"