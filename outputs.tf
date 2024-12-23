output "hub_vnet_id" {
  description = "ID of the Hub VNet"
  value       = module.network_hub.vnet_id
}

output "spoke_england_vnet_id" {
  description = "ID of England's Spoke VNet"
  value       = module.network_spoke_england.vnet_id
}

output "key_vault_id" {
  description = "ID of the Key Vault"
  value       = module.security.key_vault_id
}

output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace"
  value       = module.monitoring.log_analytics_workspace_id
}

output "aks_cluster_id" {
  description = "ID of the AKS cluster"
  value       = module.compute.kubernetes_cluster_id
}

output "sql_server_id" {
  description = "ID of the SQL Server"
  value       = module.data.sql_server_id
}