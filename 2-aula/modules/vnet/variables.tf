variable "name" {
  type        = string
  description = "Name of the virtual network"
}

variable "location" {
  type        = string
  description = "Location of the virtual network"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "address_space" {
  type        = set(string)
  description = "Address space of the virtual network"
}

variable "dns_servers" {
  type        = set(string)
  description = "DNS servers of the virtual network"
}

variable "subnets" {
  type = set(object({
    name             = string
    address_prefixes = set(string)
  }))
  description = "Subnets of the virtual network"
}

variable "tags" {
  type        = map(string)
  description = "Tags of the virtual network"
}