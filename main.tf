terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a7d5c3b8-efab-4b09-938f-ce6ca000d654"
  
}

arzurerm_resource_group "ofc-rg1" {
  name     = "example-resources1"
  location = "West Europe"
}

azurerm_storage_account "ofc-sa1" {
  name                     = "examplestorageaccount1"
  resource_group_name      = azurerm_resource_group.ofc-rg1.name
  location                 = azurerm_resource_group.ofc-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Terraform"
  }
}

