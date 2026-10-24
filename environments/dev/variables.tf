variable "rgs" {

}

variable "vnets" {

}

variable "subnets" {

}

variable "pips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    zones               = optional(list(string), null)
  }))
}

variable "nics" {

}

variable "nsgs" {

}

variable "nsg_attachments" {

}

variable "bastions" {

}

variable "vms" {

}

variable "nats" {

}

variable "nat_pip_associations" {

}

variable "nat_subnet_associations" {

}


# variable "vaults" {

# }