resource "azurerm_resource_group" "management" {
  name     = "rg-${var.environment}-management"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "log-${var.environment}-main"
  location            = azurerm_resource_group.management.location
  resource_group_name = azurerm_resource_group.management.name
  sku                = "PerGB2018"
  retention_in_days   = 30
  tags                = var.common_tags
}