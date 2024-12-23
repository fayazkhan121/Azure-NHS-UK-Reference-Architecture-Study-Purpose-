output "key_vault_id" {
  description = "ID of the Key Vault"
  value       = azurerm_key_vault.main.id
}

output "frontend_asg_id" {
  description = "ID of the frontend Application Security Group"
  value       = azurerm_application_security_group.frontend.id
}

output "backend_asg_id" {
  description = "ID of the backend Application Security Group"
  value       = azurerm_application_security_group.backend.id
}