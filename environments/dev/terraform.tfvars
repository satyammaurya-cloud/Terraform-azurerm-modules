rgs = {
  rg1 = {
    name     = "axion-rg"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "axion-vnet"
    resource_group_name = "axion-rg"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}


subnets = {
  subnet1 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "axion-rg"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.1.0/26"]
  }

  subnet2 = {
    name                 = "Frontend-Subnet"
    resource_group_name  = "axion-rg"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }

  subnet3 = {
    name                 = "Backend-Subnet"
    resource_group_name  = "axion-rg"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

nics = {
  nic1 = {
    subnet_name          = "Frontend-Subnet"
    location             = "centralindia"
    name                 = "frontend-vm-nic"
    virtual_network_name = "axion-vnet"
    resource_group_name  = "axion-rg"
  }
  nic2 = {
    subnet_name          = "Backend-Subnet"
    location             = "centralindia"
    name                 = "backend-vm-nic"
    virtual_network_name = "axion-vnet"
    resource_group_name  = "axion-rg"
  }
}

bastions = {
  bastion1 = {
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "axion-vnet"
    pip_name             = "bastion-pip"
    name                 = "my-bastion"
    resource_group_name  = "axion-rg"
    location             = "centralindia"
  }
}

vms = {
  vm1 = {
    name                = "frontend-vm"
    nic_name            = "frontend-vm-nic"
    resource_group_name = "axion-rg"
    location            = "centralindia"
    size                = "Standard_B2ls_v2"
  }
}

vaults = {
  vault1 = {
    name                = "mypersonal-tijori"
    location            = "centralindia"
    resource_group_name = "axion-rg"
  }
}

