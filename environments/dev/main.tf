module "resource_group" {
  source = "../../modules/01-azurerm_resource_group"

  rg = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/02-azurerm_virtual_network"

  vnet = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/03-azurerm_subnet"

  subnet = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/04-azurerm_public_ip"

  pip = var.pips

}

module "network_interface" {
  depends_on = [module.subnet]
  source     = "../../modules/05-azurerm_nic"

  nic = var.nics

}
module "network_security_group" {
  depends_on = [module.subnet]
  source     = "../../modules/06-azurerm_nsg"

  nsg = var.nsgs
}

module "network_security_group_attachment" {
  depends_on = [module.network_interface, module.network_security_group]
  source     = "../../modules/07-azurerm_nsg_nic_attachment"

  nsg_attachment = var.nsg_attachments
}

module "bastion" {
  depends_on = [module.subnet]
  source     = "../../modules/08-azurerm_bastion"

  bastion = var.bastions
}


module "linux_vm" {
  depends_on = [module.network_interface]
  source     = "../../modules/09-azurerm_linux_virtual_machine"

  vm = var.vms
}

module "nat" {
  depends_on = [module.public_ip]

  source = "../../modules/10-azurerm_nat_gateway"

  nat = var.nats

}

module "nat_associations" {
  depends_on = [module.nat]
  source     = "../../modules/11-azurerm_nat_pip_association"

  nat_attachment = var.nat_attachments
}




# module "vault" {
#   depends_on = [ module.resource_group ]
#   source = "../../modules/azurerm_key_vault"

#   vault = var.vaults

# }