output "resource_group_id" {
  description = "ID of the management resource group"
  value       = azurerm_resource_group.management.id
}

output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.main.id
}