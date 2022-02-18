# Flexible Server
# References:
# - https://docs.microsoft.com/en-us/azure/mysql/flexible-server/concepts-compute-storage
# - https://azure.microsoft.com/en-us/pricing/details/mysql/flexible-server/
# - https://docs.microsoft.com/en-us/azure/mysql/
# - https://docs.microsoft.com/en-us/cli/azure/mysql/flexible-server?view=azure-cli-latest

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server
/*
resource "azurerm_mysql_flexible_server" "fs_db" {
  name                   = var.fs_db_server_name
  resource_group_name    = azurerm_resource_group.k8s.name
  location               = azurerm_resource_group.k8s.location
  administrator_login    = var.fs_db_server_administrator_login
  administrator_password = var.fs_db_server_administrator_password
  backup_retention_days  = var.fs_db_server_backup_retention_days
  sku_name               = var.fs_db_server_sku_name

  # Uncomment to enable High Availability in Production. 
  # Note that the sku_name must be at least GeneralPurpose for HA to work.
  #storage {
  #  auto_grow_enabled = true
  #  # iops = 
  #  size_gb = 32
  #}
  #high_availability {
  #  mode = "SameZone"
  #}
  


}

# See the following reference for examples on setting up firewall rules:
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_firewall_rule
resource "azurerm_mysql_flexible_server_firewall_rule" "fs_db_fw" {
  name                = "azure-only-access"
  resource_group_name = azurerm_resource_group.k8s.name
  server_name         = azurerm_mysql_flexible_server.fs_db.name
  start_ip_address    = var.fs_fw_start_ip_address
  end_ip_address      = var.fs_fw_end_ip_address


}

# Databases: these are created when the server is created
# Drupal Database information: https://www.drupal.org/docs/7/api/schema-api/data-types/encoding-collation-and-storage
resource "azurerm_mysql_flexible_database" "prod_db_name" {
  name                = var.fs_db_server_prod_db_name
  resource_group_name = azurerm_resource_group.k8s.name
  server_name         = azurerm_mysql_flexible_server.fs_db.name
  charset             = "utf8"
  collation           = "utf8_general_ci"


}

resource "azurerm_mysql_flexible_database" "staging_db_name" {
  name                = var.fs_db_server_staging_db_name
  resource_group_name = azurerm_resource_group.k8s.name
  server_name         = azurerm_mysql_flexible_server.fs_db.name
  charset             = "utf8"
  collation           = "utf8_general_ci"


}

resource "azurerm_mysql_flexible_database" "dev_db_name" {
  name                = var.fs_db_server_dev_db_name
  resource_group_name = azurerm_resource_group.k8s.name
  server_name         = azurerm_mysql_flexible_server.fs_db.name
  charset             = "utf8"
  collation           = "utf8_general_ci"


}
*/