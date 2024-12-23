resource "azurerm_resource_group" "spoke" {
  name     = "rg-${var.environment}-${var.name}-network"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_virtual_network" "spoke" {
  name                = "vnet-${var.environment}-${var.name}"
  location            = azurerm_resource_group.spoke.location
  resource_group_name = azurerm_resource_group.spoke.name
  address_space       = [var.address_space]

  subnet {
    name           = "frontend"
    address_prefix = cidrsubnet(var.address_space, 4, 0)
  }

  subnet {
    name           = "backend"
    address_prefix = cidrsubnet(var.address_space, 4, 1)
  }

  subnet {
    name           = "database"
    address_prefix = cidrsubnet(var.address_space, 4, 2)
  }

  tags = var.common_tags
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                         = "peer-${var.name}-to-hub"
  resource_group_name          = azurerm_resource_group.spoke.name
  virtual_network_name         = azurerm_virtual_network.spoke.name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways         = true
}