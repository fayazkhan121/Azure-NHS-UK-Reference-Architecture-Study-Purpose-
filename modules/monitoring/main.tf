resource "azurerm_resource_group" "monitoring" {
  name     = "rg-${var.environment}-monitoring"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "log-${var.environment}-main"
  location            = azurerm_resource_group.monitoring.location
  resource_group_name = azurerm_resource_group.monitoring.name
  sku                = "PerGB2018"
  retention_in_days   = var.log_retention_days
  tags                = var.common_tags
}

resource "azurerm_application_insights" "main" {
  name                = "appi-${var.environment}-main"
  location            = azurerm_resource_group.monitoring.location
  resource_group_name = azurerm_resource_group.monitoring.name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.main.id
  tags                = var.common_tags
}