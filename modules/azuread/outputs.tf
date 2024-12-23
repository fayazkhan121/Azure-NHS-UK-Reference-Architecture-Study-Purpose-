output "admin_group_id" {
  description = "ID of the admin group"
  value       = azuread_group.admins.id
}

output "user_group_id" {
  description = "ID of the user group"
  value       = azuread_group.users.id
}

output "client_id" {
  description = "Client ID of the Azure AD application"
  value       = azuread_application.main.client_id
}

output "service_principal_id" {
  description = "ID of the service principal"
  value       = azuread_service_principal.main.id
}