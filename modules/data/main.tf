data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "data" {
  name     = "rg-${var.environment}-data"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_mssql_server" "main" {
  name                         = "sql-${var.environment}-main"
  resource_group_name          = azurerm_resource_group.data.name
  location                     = azurerm_resource_group.data.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
  minimum_tls_version         = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id     = data.azurerm_client_config.current.object_id
  }

  tags = var.common_tags
}

resource "azurerm_storage_account" "main" {
  name                     = "st${var.environment}data"
  resource_group_name      = azurerm_resource_group.data.name
  location                 = azurerm_resource_group.data.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version         = "TLS1_2"

  blob_properties {
    versioning_enabled = true
  }

  tags = var.common_tags
}