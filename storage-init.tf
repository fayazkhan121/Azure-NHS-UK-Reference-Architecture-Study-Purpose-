module "terraform_state" {
  source = "./modules/storage"

  resource_group_name  = "rg-terraform-state"
  storage_account_name = "stnhsterraformstate"
  container_name      = "tfstate"
  location           = var.location
  common_tags        = local.common_tags
}