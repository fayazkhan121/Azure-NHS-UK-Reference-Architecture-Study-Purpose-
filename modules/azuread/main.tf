data "azuread_client_config" "current" {}

resource "azuread_group" "admins" {
  display_name     = "${var.admin_group_name}-${var.environment}"
  security_enabled = true
}

resource "azuread_group" "users" {
  display_name     = "${var.user_group_name}-${var.environment}"
  security_enabled = true
}

resource "azuread_application" "main" {
  display_name = "nhs-app-${var.environment}"
  
  web {
    homepage_url  = "https://nhs-${var.environment}.azurewebsites.net"
    redirect_uris = ["https://nhs-${var.environment}.azurewebsites.net/.auth/login/aad/callback"]
  }

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # User.Read
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "main" {
  client_id = azuread_application.main.client_id
}