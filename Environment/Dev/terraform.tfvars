resource_group = {
  rg1 = {
    name     = "rg-dev-01"
    location = "centralindia"
  }
}

virtual_network = {
  vnet1 = {
    name                = "vnet-dev-01"
    address_space       = ["10.0.0.0/16"]
    location            = "centralindia"
    resource_group_name = "rg-dev-01"
  }
}

subnet = {
  subnet1 = {
    name                 = "subnet-dev-01"
    resource_group_name  = "rg-dev-01"
    virtual_network_name = "vnet-dev-01"
    address_prefixes     = ["10.0.0.0/24"]
  }
}
nic = {
  nic1 = {
    name                 = "nic-dev-01"
    resource_group_name  = "rg-dev-01"
    virtual_network_name = "vnet-dev-01"
    subnet_name          = "subnet-dev-01"
    location             = "centralindia"
  }
}
virtual_machine = {
  vm1 = {
    name                = "vm-dev-01"
    resource_group_name = "rg-dev-01"
    location            = "centralindia"
    nic_name            = "nic-dev-01"
    size                = "Standard_D2as_v4"
    admin_username      = "azureuser"
    admin_password      = "P@ssw0rd1234"

  }
}