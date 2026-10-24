# Look up an existing Azure NAT Gateway
data "azurerm_nat_gateway" "nat" {
  for_each = var.nat_subnet_association

  name                = each.value.nat_name
  resource_group_name = each.value.resource_group_name
}

# Read existing subnets
data "azurerm_subnet" "subnet" {
  for_each = var.nat_subnet_association

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


# 1. Associate the NAT Gateway with a Subnet
resource "azurerm_subnet_nat_gateway_association" "nat_subnet_assoc" {
  for_each = var.nat_subnet_association

  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  nat_gateway_id = data.azurerm_nat_gateway.nat[each.key].id
}
