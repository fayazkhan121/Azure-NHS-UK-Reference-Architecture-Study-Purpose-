variable "environment" {
  description = "Environment name (e.g., prod, dev, staging)"
  type        = string
}

variable "location" {
  description = "Primary Azure region"
  type        = string
}

variable "secondary_location" {
  description = "Secondary Azure region for DR"
  type        = string
}

variable "organization_name" {
  description = "Organization name"
  type        = string
}

variable "address_space" {
  description = "Address spaces for VNets"
  type = object({
    hub            = string
    spoke_england  = string
    spoke_scotland = string
    spoke_wales    = string
    spoke_ni       = string
  })
}

variable "sql_admin_login" {
  description = "SQL Server admin login"
  type        = string
}

variable "sql_admin_password" {
  description = "SQL Server admin password"
  type        = string
  sensitive   = true
}