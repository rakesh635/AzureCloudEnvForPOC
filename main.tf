# Root module main.tf

provider "azurerm" {
  features {}
}

# Call the network module
module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_cidr           = var.vnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

# Call the bastion module
module "bastion" {
  source              = "./modules/bastion"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_subnet_id    = module.network.public_subnet_id
  bastion_admin_user  = var.bastion_admin_user
  bastion_admin_pass  = var.bastion_admin_pass
}

# Call the private VM module
module "private_vm" {
  source              = "./modules/private_vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  private_subnet_id   = module.network.private_subnet_id
  private_vm_ssh_key  = var.private_vm_ssh_key
}
