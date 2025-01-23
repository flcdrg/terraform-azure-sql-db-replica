resource "random_password" "password" {
  length           = 32
  override_special = "!#%&*()-_=+[]{}<>:?"
}

# resource "azurerm_mssql_server" "mssql" {
#   name                          = "sql-georeplica-australiaeast"
#   resource_group_name           = data.azurerm_resource_group.rg.name
#   location                      = data.azurerm_resource_group.rg.location
#   minimum_tls_version           = "1.2"
#   version                       = "12.0"
#   administrator_login           = var.mssql_administrator_login
#   administrator_login_password  = var.mssql_administrator_password
#   public_network_access_enabled = false

#   identity {
#     type = "SystemAssigned"
#   }

#   azuread_administrator {
#     login_username = "AzureAD Admin"
#     object_id      = var.mssql_azuread_administrator_object_id
#   }
# }

# resource "azurerm_mssql_firewall_rule" "azure_services" {
#   name             = "AllowAllWindowsAzureIps"
#   server_id        = azurerm_mssql_server.mssql.id
#   start_ip_address = "0.0.0.0"
#   end_ip_address   = "0.0.0.0"
# }
