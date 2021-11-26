resource "azurerm_linux_virtual_machine" "tfrlinuxvm" {
    name = "vm-${terraform.workspace}"
    location = data.azurerm_resource_group.tfrexistRg.location
    resource_group_name = data.azurerm_resource_group.tfrexistRg.name
    size = "Standard_B1s"
    admin_username = "adminuser"
    network_interface_ids = [
     # element(azurerm_network_interface.tfrNIC[*].id, count.index)
     azurerm_network_interface.tfrNIC.id
    ]
    admin_ssh_key {
      username = "adminuser"
      public_key = file("${path.module}/ssh-keys/id_rsa.pub")
    }

    os_disk {
     # name = "osdisk${count.index}"
      name = "osdisk"
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }  

    source_image_reference {
      publisher = "RedHat"
      offer = "RHEL"
      sku = "83-gen2"
      version = "latest"
    }
}

resource "azurerm_public_ip" "tfrpip" {
  name = "tftestpip"
  location = data.azurerm_resource_group.tfrexistRg.location
  resource_group_name = data.azurerm_resource_group.tfrexistRg.name
  allocation_method = "Dynamic"
}
resource "azurerm_network_interface" "tfrNIC" {
  name = "niclinuxvm01"
  location = data.azurerm_resource_group.tfrexistRg.location
  resource_group_name = data.azurerm_resource_group.tfrexistRg.name
  ip_configuration {
    name = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id = module.vnet.vnet_subnets[0]
    public_ip_address_id = azurerm_public_ip.tfrpip.id
  }
}
    