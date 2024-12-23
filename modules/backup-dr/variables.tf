variable "environment" {
  description = "Environment name"
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

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}