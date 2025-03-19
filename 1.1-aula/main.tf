terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23.0"
    }
  }

  required_version = ">= 1.5.7"

  # backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = "677253fa-9e72-4166-ac53-247de4fb2181"
  features {}
}

# locals {
#   location            = "australiaeast"
#   resource_group_name = "rsgmanualcreated"
#   vnt_name            = "vntmanualcreated"
# }

# import {
#   to = azurerm_virtual_network.existing_vnet
#   id = "/subscriptions/677253fa-9e72-4166-ac53-247de4fb2181/resourceGroups/rsgmanualcreated/providers/Microsoft.Network/virtualNetworks/vntmanualcreated"
# }

# resource "azurerm_virtual_network" "existing_vnet" {
#   name                = local.vnt_name
#   resource_group_name = local.resource_group_name
#   location            = local.location
#   address_space       = ["10.0.0.0/16"]
# }

####################################################### VNET ###################################################################

# 🔍 Data Source para obter uma VNet existente
data "azurerm_virtual_network" "vnt_manual_created" {
  name                = "vntmanualcreated"
  resource_group_name = "rsgmanualcreated"
}

###################################################### SUBNET ##################################################################

# 🔍 Data Source para buscar a Subnet dentro da VNet
data "azurerm_subnet" "snt_manual_created" {
  name                 = "sntmanualcreated"
  virtual_network_name = data.azurerm_virtual_network.vnt_manual_created.name
  resource_group_name  = data.azurerm_virtual_network.vnt_manual_created.resource_group_name
}

####################################################### NIC ####################################################################

# 🚀 Criando um NIC (Network Interface) e associando à Subnet existente
resource "azurerm_network_interface" "vm_nic" {
  name                = "nicterraformvm"
  location            = data.azurerm_virtual_network.vnt_manual_created.location
  resource_group_name = data.azurerm_virtual_network.vnt_manual_created.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.snt_manual_created.id
    private_ip_address_allocation = "Dynamic"
  }
}

####################################################### VM #####################################################################

# 🖥 Criando a VM e injetando a VNet/Subnet
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "terraformvm"
  resource_group_name = data.azurerm_virtual_network.vnt_manual_created.resource_group_name
  location            = data.azurerm_virtual_network.vnt_manual_created.location
  size                = "Standard_B1s"

  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
