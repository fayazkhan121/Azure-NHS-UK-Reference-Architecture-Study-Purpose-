output "vnet_id" {
  description = "ID of the spoke VNet"
  value       = azurerm_virtual_network.spoke.id
}

output "resource_group_id" {
  description = "ID of the spoke network resource group"
  value       = azurerm_resource_group.spoke.id
}