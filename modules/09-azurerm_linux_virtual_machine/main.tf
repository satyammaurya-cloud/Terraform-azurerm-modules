# Data block to read the NIC ID
data "azurerm_network_interface" "nic" {
  for_each = var.vm

  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

# Create the linux VM
resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each = var.vm 

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size

  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
  
  # admin_username                  = data.azurerm_key_vault_secret.username.value
  # admin_password                  = data.azurerm_key_vault_secret.password.value
  admin_username                  = "IT"
  admin_password                  = "Satyam@12345"

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

