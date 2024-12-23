# Temporarily comment out backend config until storage is created
/*
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stnhsterraformstate"
    container_name      = "tfstate"
    key                 = "prod.terraform.tfstate"
  }
}
*/