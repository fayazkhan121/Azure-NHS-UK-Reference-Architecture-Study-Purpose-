data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "security" {
  name     = "rg-${var.environment}-security"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_key_vault" "main" {
  name                = "kv-${var.environment}-${var.location}"
  location            = azurerm_resource_group.security.location
  resource_group_name = azurerm_resource_group.security.name
  tenant_id          = data.azurerm_client_config.current.tenant_id
  sku_name           = "premium"

  purge_protection_enabled   = true
  soft_delete_retention_days = 90
  
  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
  }
  
  tags = var.common_tags
}

resource "azurerm_application_security_group" "frontend" {
  name                = "asg-${var.environment}-frontend"
  location            = azurerm_resource_group.security.location
  resource_group_name = azurerm_resource_group.security.name
  tags                = var.common_tags
}

resource "azurerm_application_security_group" "backend" {
  name                = "asg-${var.environment}-backend"
  location            = azurerm_resource_group.security.location
  resource_group_name = azurerm_resource_group.security.name
  tags                = var.common_tags
}