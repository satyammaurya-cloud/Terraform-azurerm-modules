data "azurerm_key_vault" "my_vault" {
  name                = "mypersonal-tijori"
  resource_group_name = "axion-rg"
}

data "azurerm_key_vault_secret" "username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.my_vault.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.my_vault.id
}