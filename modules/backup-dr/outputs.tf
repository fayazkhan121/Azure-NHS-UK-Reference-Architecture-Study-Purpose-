output "recovery_services_vault_id" {
  description = "ID of the Recovery Services Vault"
  value       = azurerm_recovery_services_vault.main.id
}

output "primary_fabric_id" {
  description = "ID of the primary Site Recovery Fabric"
  value       = azurerm_site_recovery_fabric.primary.id
}

output "secondary_fabric_id" {
  description = "ID of the secondary Site Recovery Fabric"
  value       = azurerm_site_recovery_fabric.secondary.id
}