# Look up an existing Azure NAT Gateway
data "azurerm_nat_gateway" "nat" {
  for_each = var.nat_attachment

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

# Data block to read the public IP
data "azurerm_public_ip" "pip" {
  for_each = var.nat_attachment

  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

# Read existing subnets
data "azurerm_subnet" "subnet" {
  for_each = var.nat_attachment

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


# 1. Associate a Public IP with the NAT Gateway
resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assoc" {
  for_each = var.nat_attachment

  nat_gateway_id       = data.azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}

# 2. Associate the NAT Gateway with a Subnet
resource "azurerm_subnet_nat_gateway_association" "nat_subnet_assoc" {
  for_each = var.nat_attachment

  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  nat_gateway_id = data.azurerm_nat_gateway.nat[each.key].id
}