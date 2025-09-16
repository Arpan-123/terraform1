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
  subscription_id = "51984565-3b14-41c7-900f-cf01ff601798"
  
}

resource "azurerm_resource_group" "ofc-rg1" {
  name     = "example-resources1"
  location = "West Europe"
}

resource "azurerm_storage_account" "ofc-sa1" {
  name                     = "examplestorageaccount1"
  resource_group_name      = azurerm_resource_group.ofc-rg1.name
  location                 = azurerm_resource_group.ofc-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Terraform"
  }
}

