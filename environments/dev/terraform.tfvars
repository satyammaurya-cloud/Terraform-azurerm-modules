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

pips = {
  pip1 = {
    name                = "bastion-pip"
    location            = "centralindia"
    resource_group_name = "axion-rg"
    allocation_method   = "Static"
  }
}

nsgs = {

  frontend-nsg = {
    name                = "frontend-vm-nsg"
    location            = "centralindia"
    resource_group_name = "axion-rg"

    rules = [
      {
        name        = "allow-http"
        priority    = 110
        direction   = "Inbound"
        access      = "Allow"
        protocol    = "Tcp"
        source      = "Internet"
        destination = "80"
      },

      {
        name        = "allow-ssh"
        priority    = 120
        direction   = "Inbound"
        access      = "Allow"
        protocol    = "Tcp"
        source      = "10.0.10.0/24"
        destination = "22"
      }
    ]
  }

  backend-nsg = {
    name                = "backend-vm-nsg"
    location            = "centralindia"
    resource_group_name = "axion-rg"

    rules = [
      {
        name        = "allow-app"
        priority    = 100
        direction   = "Inbound"
        access      = "Allow"
        protocol    = "Tcp"
        source      = "10.0.10.0/24"
        destination = "8000" # Any application running 5000, 8000
      },

      {
        name        = "allow-ssh"
        priority    = 110
        direction   = "Inbound"
        access      = "Allow"
        protocol    = "Tcp"
        source      = "10.0.10.0/24"
        destination = "22"
      }
    ]
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

nsg_attachments = {
  attach1 = {
    nic_name             = "frontend-vm-nic"
    virtual_network_name = "axion-vnet"
    resource_group_name  = "axion-rg"
    nsg_name             = "frontend-vm-nsg"

  }
  attach2 = {
    nic_name             = "backend-vm-nic"
    virtual_network_name = "axion-vnet"
    resource_group_name  = "axion-rg"
    nsg_name             = "backend-vm-nsg"
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

# vaults = {
#   vault1 = {
#     name                = "mypersonal-tijori"
#     location            = "centralindia"
#     resource_group_name = "axion-rg"
#   }
# }

