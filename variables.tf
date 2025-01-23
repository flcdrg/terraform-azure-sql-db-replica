variable "mssql_azuread_administrator_object_id" {
  type        = string
  description = "Object ID of AAD User that will be the Azure SQL Administrator"
  nullable    = false
}

variable "mssql_administrator_login" {
  type = string
}

variable "mssql_administrator_password" {
  type      = string
  sensitive = true
}