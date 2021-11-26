terraform {
  required_version = ">= 1.0.0"
  required_providers {
     azurerm = {
      source = "hashicorp/azurerm"
      version = "2.86.0"
     }
     random = {
       source = "hashicorp/random"
       version = "3.1.0"

      }
  }
}

provider "azurerm" {
  features {}
}

module "Azure-Website" {
    source = "./D:/Microsoft/Azure/Azure Devops - IAC/GitHub-Devops - Code/MyTerraformProject/Learn/01 - Learning - TF - Azure-website"
    #D:\Microsoft\Azure\Azure Devops - IAC\GitHub-Devops - Code\MyTerraformProject\Virtual Network\01 - Learning - TF - Azure-website
      # Resource Group

location                          = "canadacentral"
resource_group_name               = "myrg1"
storage_account_name              = "staticwebsite"
storage_account_tier              = "Standard"
storage_account_replication_type  = "LRS"
storage_account_kind              = "StorageV2"
static_website_index_document     = "index.html"
static_website_error_404_document = "error.html"
static_website_source_folder      = "../static-content"

}