resource "azurerm_resource_group" "compute" {
  name     = "rg-${var.environment}-compute"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = "aks-${var.environment}-main"
  location            = azurerm_resource_group.compute.location
  resource_group_name = azurerm_resource_group.compute.name
  dns_prefix          = "aks-${var.environment}"

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_vm_size
    type       = "VirtualMachineScaleSets"
    enable_auto_scaling = true
    min_count  = 1
    max_count  = 5
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }

  tags = var.common_tags
}