variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "vnet_cidr" {
  description = "CIDR block for the virtual network"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
}

variable "bastion_admin_user" {
  description = "Admin username for the bastion host"
}

variable "bastion_admin_pass" {
  description = "Admin password for the bastion host"
  sensitive   = true
}

variable "private_vm_ssh_key" {
  description = "SSH public key for the private VM"
  sensitive   = true
}
