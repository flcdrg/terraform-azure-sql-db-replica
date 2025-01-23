
import {
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/rg-georeplica-australiaeast/providers/Microsoft.Sql/servers/sql-georeplica-australiaeast/databases/sqldb-georeplica-australiaeast"
  to = azurerm_mssql_database.primary
}

resource "azurerm_mssql_database" "primary" {
  name           = "sqldb-georeplica-australiaeast"
  server_id      = azurerm_mssql_server.mssql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  sku_name       = "Basic"
  max_size_gb    = 1
  zone_redundant = false
  sample_name    = "AdventureWorksLT"
}

# This is the secondary database that will be created as a replica of the primary

import {
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/rg-georeplica-australiaeast/providers/Microsoft.Sql/servers/sql-georeplica-australiaeast/databases/sqldb-georeplica-secondary-australiaeast"
  to = azurerm_mssql_database.secondary
}
resource "azurerm_mssql_database" "secondary" {
  name                        = "sqldb-georeplica-secondary-australiaeast"
  server_id                   = azurerm_mssql_server.mssql.id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  sku_name                    = "Basic"
  create_mode                 = "Secondary"
  creation_source_database_id = azurerm_mssql_database.primary.id
}
