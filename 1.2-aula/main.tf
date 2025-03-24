terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.112.0"
    }
  }

  backend "local" {}
  # backend "azurerm" {}
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
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.my_rg.name
  location                 = azurerm_resource_group.my_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  #min_tls_version          = "TLS1_2"
  tags = local.tags

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "azurerm_storage_container" "my_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.my_storage_account.name
  container_access_type = "private"
}