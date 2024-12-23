locals {
  common_tags = {
    Environment  = var.environment
    ManagedBy    = "Terraform"
    Organization = var.organization_name
  }
}

# Management Module
module "management" {
  source = "./modules/management"
  
  environment   = var.environment
  location      = var.location
  common_tags   = local.common_tags
}

# Network Hub Module
module "network_hub" {
  source = "./modules/network-hub"
  
  environment    = var.environment
  location       = var.location
  address_space  = var.address_space.hub
  common_tags    = local.common_tags
}

# Network Spoke Module
module "network_spoke_england" {
  source = "./modules/network-spoke"
  
  name           = "england"
  environment    = var.environment
  location       = var.location
  address_space  = var.address_space.spoke_england
  hub_vnet_id    = module.network_hub.vnet_id
  common_tags    = local.common_tags
}

# Compute Module
module "compute" {
  source = "./modules/compute"
  
  environment    = var.environment
  location       = var.location
  common_tags    = local.common_tags
  depends_on     = [module.network_hub, module.network_spoke_england]
}

# Data Module
module "data" {
  source = "./modules/data"
  
  environment         = var.environment
  location           = var.location
  sql_admin_login    = var.sql_admin_login
  sql_admin_password = var.sql_admin_password
  common_tags        = local.common_tags
}

# Security Module
module "security" {
  source = "./modules/security"
  
  environment    = var.environment
  location       = var.location
  common_tags    = local.common_tags
}

# Monitoring Module
module "monitoring" {
  source = "./modules/monitoring"
  
  environment    = var.environment
  location       = var.location
  common_tags    = local.common_tags
}

# Backup and DR Module
module "backup_dr" {
  source = "./modules/backup-dr"
  
  environment         = var.environment
  location           = var.location
  secondary_location = var.secondary_location
  common_tags        = local.common_tags
}

# Policies Module
module "policies" {
  source = "./modules/policies"
  
  environment    = var.environment
  common_tags    = local.common_tags
}

# Azure AD Module
module "azuread" {
  source = "./modules/azuread"
  
  environment    = var.environment
  common_tags    = local.common_tags
}