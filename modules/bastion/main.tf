# Bastion module main.tf

resource "azurerm_windows_virtual_machine" "bastion" {
  name                = "bastion-host"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B2s"
  admin_username      = var.bastion_admin_user
  admin_password      = var.bastion_admin_pass
  network_interface_ids = [var.public_subnet_id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
