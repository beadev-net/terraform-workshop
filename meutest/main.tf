terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.24.0"
    }
  }
  required_version = "1.11.2"
}

provider "azurerm" {
  subscription_id = "677253fa-9e72-4166-ac53-247de4fb2181"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "eastus"
  tags = {
    name = "Vinicius"
  }
}