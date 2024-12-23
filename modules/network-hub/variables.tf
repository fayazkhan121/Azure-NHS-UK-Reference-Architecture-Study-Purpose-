variable "environment" {
  description = "Environment name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "address_space" {
  description = "Address space for the hub VNet"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}