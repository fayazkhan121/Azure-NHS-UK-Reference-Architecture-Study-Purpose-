output "allowed_locations_policy_id" {
  description = "ID of the allowed locations policy"
  value       = azurerm_policy_definition.allowed_locations.id
}

output "require_tags_policy_id" {
  description = "ID of the required tags policy"
  value       = azurerm_policy_definition.require_tags.id
}