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

module "network_interface" {
  depends_on = [module.subnet]
  source     = "../../modules/04-azurerm_network_interface_card"

  nic = var.nics

}

module "bastion" {
  depends_on = [module.subnet]
  source     = "../../modules/05-azurerm_bastion"

  bastion = var.bastions
}

module "linux_vm" {
  depends_on = [module.network_interface]
  source     = "../../modules/06-azurerm_linux_virtual_machine"

  vm = var.vms
}

module "vault" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_key_vault"

  vault = var.vaults
  
}