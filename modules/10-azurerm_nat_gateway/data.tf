# # Look up an existing Azure NAT Gateway
# data "azurerm_nat_gateway" "nat" {
#   for_each = var.nat

#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
# }

# # Existing subnet, VNet, Public IP ko read karna
# data "azurerm_subnet" "subnet" {
#   for_each = var.nat  

#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.virtual_network_name
#   resource_group_name  = each.value.resource_group_name
# }

# Look up an existing Azure NAT Gateway
# data "azurerm_nat_gateway" "nat" {
#   for_each = var.nat

#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
# }