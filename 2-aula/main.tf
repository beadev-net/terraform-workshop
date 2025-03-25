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

module "vnet" {
  source              = "./modules/vnet"
  name                = "vnet-terraform"
  resource_group_name = "terraform-workshop-rg"
  location            = "eastus"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet2"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]
  tags = {
    environment = "dev"
  }
}
