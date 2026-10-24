# Data block to read existing Key Vault

# data "azurerm_key_vault" "my_vault" {
#   name                = "mypersonal-tijori"
#   resource_group_name = "axion-rg"
# }

# Data block to read the Key Vault's Secrect - Username

# data "azurerm_key_vault_secret" "username" {
#   name         = "vm-username"
#   key_vault_id = data.azurerm_key_vault.my_vault.id
# }


# Data block to read the Key Vault's Secrect - Password

# data "azurerm_key_vault_secret" "password" {
#   name         = "vm-password"
#   key_vault_id = data.azurerm_key_vault.my_vault.id
# }