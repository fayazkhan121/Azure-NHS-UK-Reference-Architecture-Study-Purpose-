data "azurerm_subscription" "current" {}

resource "azurerm_policy_definition" "allowed_locations" {
  name         = "allowed-locations-${var.environment}"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed Locations for Resources"

  policy_rule = jsonencode({
    if = {
      not = {
        field = "location"
        in    = var.allowed_locations
      }
    }
    then = {
      effect = "deny"
    }
  })
}

resource "azurerm_policy_definition" "require_tags" {
  name         = "require-tags-${var.environment}"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Require specified tags on resources"

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field  = "tags['Environment']"
          exists = "false"
        },
        {
          field  = "tags['ManagedBy']"
          exists = "false"
        }
      ]
    }
    then = {
      effect = "deny"
    }
  })
}

resource "azurerm_management_group_policy_assignment" "allowed_locations" {
  name                 = "allowed-locations-${var.environment}"
  policy_definition_id = azurerm_policy_definition.allowed_locations.id
  management_group_id  = data.azurerm_subscription.current.id
}