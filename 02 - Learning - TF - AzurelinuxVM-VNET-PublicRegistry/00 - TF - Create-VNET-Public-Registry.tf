provider "azurerm" {
  features {}
}

variable "Vnet_Addressspace" {
  type = list(string)
  default = ["192.168.0.0/16, 192.168.1.0/16"]
}

variable "vnet_subnet_prefixes" {
  type = list(string)
  default = [ "192.168.1.0/24" ]
}

locals {
  VnetName = "tfvnettest"
  location = "canadacentral"
}

data "azurerm_resource_group" "tfrexistRg" {
    name = "TestRG1"
}

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "2.5.0"
  # insert the 2 required variables here
  vnet_name = local.VnetName
  resource_group_name = data.azurerm_resource_group.tfrexistRg.name
  vnet_location = local.location
  address_space = var.Vnet_Addressspace
  subnet_prefixes = [ "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24" ]
}

output "vnet_name" {
    value = module.vnet.vnet_name
}