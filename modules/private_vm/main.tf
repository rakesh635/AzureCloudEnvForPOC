# Private VM module main.tf

resource "azurerm_linux_virtual_machine" "private_vm" {
  name                = "private-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B2s"
  admin_ssh_key {
    username   = "azureuser"
    public_key = var.private_vm_ssh_key
  }
  network_interface_ids = [var.private_subnet_id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
