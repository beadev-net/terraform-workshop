terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.7.1"
    }
  }

  required_version = ">= 1.5.7"
}

provider "azurerm" {
  features {}
}

provider "random" {}

resource "random_string" "suffix" {
  length  = 4
  special = false
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-${random_string.suffix.result}" 
  location = "East US"
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
  description = "The name of the resource group"
}