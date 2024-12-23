resource "azurerm_resource_group" "backup" {
  name     = "rg-${var.environment}-backup"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_recovery_services_vault" "main" {
  name                = "rsv-${var.environment}-main"
  location            = azurerm_resource_group.backup.location
  resource_group_name = azurerm_resource_group.backup.name
  sku                = "Standard"
  soft_delete_enabled = true
  tags                = var.common_tags
}

resource "azurerm_site_recovery_fabric" "primary" {
  name                = "fabric-primary"
  resource_group_name = azurerm_resource_group.backup.name
  recovery_vault_name = azurerm_recovery_services_vault.main.name
  location           = var.location
}

resource "azurerm_site_recovery_fabric" "secondary" {
  name                = "fabric-secondary"
  resource_group_name = azurerm_resource_group.backup.name
  recovery_vault_name = azurerm_recovery_services_vault.main.name
  location           = var.secondary_location
}