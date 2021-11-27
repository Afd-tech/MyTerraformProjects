terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.86.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "randomname" {
  length  = 13
  upper   = false
  special = false
  number  = false
}

data "azurerm_resource_group" "tfexistingRG" {
  name = "TestRG1"
}

resource "azurerm_storage_account" "tfrsta" {
  #name                     = "${var.storage_account_name}${random_string.randomname.id}"
  name =  "stact01tf01"
  location                 = data.azurerm_resource_group.tfexistingRG.location
  resource_group_name      = data.azurerm_resource_group.tfexistingRG.name
  account_replication_type = var.storage_account_replication_type
  access_tier              = "Hot"
  account_kind             = var.storage_account_kind
  account_tier = var.storage_account_tier

  static_website {
    index_document     = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
  }

}