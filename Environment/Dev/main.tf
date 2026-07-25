
module "resource_group" {
  source         = "../../Modules/resource_group"
  resource_group = var.resource_group
}

module "virtual_network" {
  depends_on      = [module.resource_group]
  source          = "../../Modules/Vnet"
  virtual_network = var.virtual_network
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../Modules/Subnet"
  subnet     = var.subnet
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../../Modules/Nic"
  nic        = var.nic
}

module "virtual_machine" {
  depends_on      = [module.nic]
  source          = "../../Modules/Virtual_machine"
  virtual_machine = var.virtual_machine
}

module "bastion" {
  depends_on = [module.subnet]
  source     = "../../Modules/bastion"
  bastion    = var.bastion
}

module "application_gateway" {
  depends_on          = [module.subnet]
  source              = "../../Modules/application_gateway"
  application_gateway = var.application_gateway
}