variable "environment" {
  description = "Environment name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}

variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 30
}