# Look up an existing Azure NAT Gateway
data "azurerm_nat_gateway" "nat" {
  for_each = var.nat_pip_association

  name                = each.value.nat_name
  resource_group_name = each.value.resource_group_name
}

# Data block to read the public IP
data "azurerm_public_ip" "pip" {
  for_each = var.nat_pip_association

  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}


# 1. Associate a Public IP with the NAT Gateway
resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assoc" {
  for_each = var.nat_pip_association

  nat_gateway_id       = data.azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}


