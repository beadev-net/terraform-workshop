terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }

  required_version = ">= 1.5.7"
}

provider "azurerm" {
  features {}
  subscription_id = ""
}

data "azurerm_resource_group" "rg" {
  name = "rsgdatasource"
}

resource "azurerm_storage_account" "my_storage_account" {
  name                     = "stavinicius"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}