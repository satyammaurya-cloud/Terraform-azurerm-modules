# Existing NIC ID ko read karna
data "azurerm_network_interface" "nic" {
  for_each = var.nsg_attachment

  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

# Data block to read the NSG ID
data "azurerm_network_security_group" "nsg" {
  for_each = var.nsg_attachment

  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}

# Attach Network Interfaces with NSG 
resource "azurerm_network_interface_security_group_association" "nsg_attachments" {

  for_each = var.nsg_attachment

  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}