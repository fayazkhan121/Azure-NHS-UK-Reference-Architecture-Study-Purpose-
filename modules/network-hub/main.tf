resource "azurerm_resource_group" "hub" {
  name     = "rg-${var.environment}-hub-network"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_virtual_network" "hub" {
  name                = "vnet-${var.environment}-hub"
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
  address_space       = [var.address_space]

  subnet {
    name           = "AzureFirewallSubnet"
    address_prefix = cidrsubnet(var.address_space, 4, 0)
  }

  subnet {
    name           = "GatewaySubnet"
    address_prefix = cidrsubnet(var.address_space, 4, 1)
  }

  subnet {
    name           = "AzureBastionSubnet"
    address_prefix = cidrsubnet(var.address_space, 4, 2)
  }

  tags = var.common_tags
}

resource "azurerm_public_ip" "firewall" {
  name                = "pip-${var.environment}-firewall"
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
  allocation_method   = "Static"
  sku                = "Standard"
}

resource "azurerm_firewall" "hub" {
  name                = "fw-${var.environment}-hub"
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
  sku_name           = "AZFW_VNet"
  sku_tier           = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_virtual_network.hub.subnet.*.id[0]
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}