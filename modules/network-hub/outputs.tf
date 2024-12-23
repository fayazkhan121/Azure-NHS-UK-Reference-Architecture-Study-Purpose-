output "vnet_id" {
  description = "ID of the hub VNet"
  value       = azurerm_virtual_network.hub.id
}

output "resource_group_id" {
  description = "ID of the hub network resource group"
  value       = azurerm_resource_group.hub.id
}