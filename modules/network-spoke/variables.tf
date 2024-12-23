variable "name" {
  description = "Name of the spoke network"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "address_space" {
  description = "Address space for the spoke VNet"
  type        = string
}

variable "hub_vnet_id" {
  description = "ID of the hub VNet"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}