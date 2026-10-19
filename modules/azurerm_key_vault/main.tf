# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "vault" {
#   for_each = var.vault  
#   name                       = each.value.name
#   location                   = each.value.location
#   resource_group_name        = each.value.resource_group_name
#   tenant_id                  = data.azurerm_client_config.current.tenant_id
#   sku_name                   = "standard"
#   rbac_authorization_enabled = true
# }

# resource "azurerm_role_assignment" "secrets_user" {
#   for_each = var.vault

#   scope                = azurerm_key_vault.vault[each.key].id
#   role_definition_name = "Key Vault Secrets User"
#   principal_id         = data.azurerm_client_config.current.object_id
# }