// Create resource group and storage account for Terraform state
resource "azurerm_resource_group" "terraform_state" {
  name     = "rg-terraform-state"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_storage_account" "terraform_state" {
  name                     = "stnhsterraformstate"
  resource_group_name      = azurerm_resource_group.terraform_state.name
  location                 = azurerm_resource_group.terraform_state.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version         = "TLS1_2"

  blob_properties {
    versioning_enabled = true
  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "terraform_state" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}