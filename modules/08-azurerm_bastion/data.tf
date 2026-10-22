# Existing subnet, VNet, Public IP ko read karna

# data "azurerm_subnet" "subnet" {

#   name                 = "AzureBastionSubnet"
#   virtual_network_name = "axion-vnet"
#   resource_group_name  = "axion-rg"
# }

# output "subnet_id" {
#   value = data.azurerm_subnet.subnet.id
# }

# Data block to read the public IP
# data "azurerm_public_ip" "pip" {
#   name                = "name_of_public_ip"
#   resource_group_name = "name_of_resource_group"
# }

# output "public_ip_address" {
#   value = data.azurerm_public_ip.pip.ip_address
# }
