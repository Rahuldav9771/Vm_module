variable "resource_group" {
        type = map(object({
      name = string
      location = string
    }))
}

variable "virtual_network" {
    type = map(object({
      name                = string
      address_space       = list(string)
      location            = string
      resource_group_name = string
    }))
}

variable "subnet" {
    type = map(object({
      name                 = string
      resource_group_name  = string
      virtual_network_name = string
      address_prefixes     = list(string)
    }))
}

variable "nic" {
    type = map(object({
      name                 = string
      location             = string
      resource_group_name  = string
      subnet_name         = string
        virtual_network_name = string
    }))

}

variable "virtual_machine" {
    type = map(object({
      name                 = string
      resource_group_name  = string
      location             = string
      nic_name           = string
      size              = string
      admin_username    = string
      admin_password    = string
    }))
  

}