terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.112.0"
    }
  }

  #backend "local" {}
  backend "azurerm" {}

  required_version = "1.11.2"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = local.tags
}

resource "azurerm_storage_account" "my_storage_account" {
  name                     = var.storage_account.name
  resource_group_name      = azurerm_resource_group.my_rg.name
  location                 = azurerm_resource_group.my_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = var.storage_account.min_tls_version
  tags                     = local.tags

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "azurerm_storage_container" "my_container" {
  name                  = "vinicius"
  storage_account_name  = azurerm_storage_account.my_storage_account.name
  container_access_type = "private"
}