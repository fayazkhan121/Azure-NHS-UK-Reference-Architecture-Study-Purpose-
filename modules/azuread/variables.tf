variable "environment" {
  description = "Environment name"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}

variable "admin_group_name" {
  description = "Name of the admin group"
  type        = string
  default     = "NHS-Admins"
}

variable "user_group_name" {
  description = "Name of the user group"
  type        = string
  default     = "NHS-Users"
}